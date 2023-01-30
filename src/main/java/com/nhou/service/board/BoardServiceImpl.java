package com.nhou.service.board;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.nhou.domain.board.BoardDto;
import com.nhou.domain.board.PageInfo;
import com.nhou.mapper.board.BoardMapper;
import com.nhou.mapper.board.BoardReplyMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private BoardReplyMapper boardReplyMapper;
	
	@Autowired
	private S3Client s3Client;
	
	@Value("${aws.s3.bucket}")
	private String bucketName;
	
	// 게시글 작성
	/*
	 * @Override public int insert(BoardDto board) { return
	 * boardMapper.insert(board); }
	 */
	
	// 게시글 파일첨부 작성
	@Override
	public int insertFile(BoardDto board, MultipartFile[] files) {
		
		// db에 게시물 정보 삽입
		int cnt = boardMapper.insert(board);
		
		for (MultipartFile file : files) {
			
			if (files != null && file.getSize() > 0) {
				// db에 파일 저장
				// 파일명, 게시물id정보가 있어야함
				boardMapper.insertFile(board.getBoardId(), file.getOriginalFilename());
				
				uploadFile(board.getBoardId(), file);
		 }
			
	}
		
		return cnt;
		
	}
	
	private void uploadFile(int boardId, MultipartFile file) {
		try {
			String key = "board/" + boardId + "/" + file.getOriginalFilename();
			
			PutObjectRequest putObjectRequest = PutObjectRequest.builder()
					.bucket(bucketName)
					.key(key)
					.acl(ObjectCannedACL.PUBLIC_READ)
					.build();
			
			RequestBody requestBody = RequestBody.fromInputStream(file.getInputStream(), file.getSize());
		
			s3Client.putObject(putObjectRequest, requestBody);
		
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	// 게시글 목록
	@Override
	public List<BoardDto> listBoard(int page, String type, String keyword, PageInfo pageInfo, String category) { // service에 사용한 명명
		int records = 10; // 게시글 갯수
		int offset = (page - 1) * records; // 어디서부터 시작할지
		
		int countAll = boardMapper.countAll(type, "%" + keyword + "%"); // 게시물 총갯수 > mapper로 
		int lastPage = (countAll - 1) / records + 1; // 마지막 페이지
		
		// 5페이지씩 보이게
		int leftPageNum = (page - 1) / 5 * 5 + 1;
		int rightPageNum = leftPageNum + 4;
		rightPageNum = Math.min(rightPageNum, lastPage); // 오른쪽 페이지 숫자와 마지막 숫자중 더 적은 숫자 반환
		
		// 이전 버튼 유무 : 페이지가 5보다 크면 이전 버튼을 생성
		boolean hasPreBtn = page > 5;
		// 다음 버튼 유무
		boolean hasNextBtn = page <= ((lastPage - 1) / 5 * 5);
		
		// 이전 버튼을 눌렀을때 이동할 페이지 번호 위치
		int jumpPrePageNum = (page - 1) / 5 * 5 - 4;
		// 다음 버튼을 눌렀을때 이동할 페이지 번호 위치
		int jumpNextPageNum = (page - 1) / 5 * 5 + 6;
		
		pageInfo.setHasPreBtn(hasPreBtn);
		pageInfo.setHasNextBtn(hasNextBtn);
		pageInfo.setJumpNextPageNum(jumpNextPageNum);
		pageInfo.setJumpPrePageNum(jumpPrePageNum);
		pageInfo.setRightPageNum(rightPageNum);
		pageInfo.setLeftPageNum(leftPageNum);
		pageInfo.setCurrentPageNum(page);
		pageInfo.setLastPageNum(lastPage);
		
		
		return boardMapper.list(offset, records, type, "%" + keyword + "%", category);		// mapper에서 사용할 명명
	}
	
	// 게시물 가져와서 보기
	@Override
	public BoardDto get(int boardId, String member_userId) {		// service에 사용한 명명
		return boardMapper.select(boardId, member_userId); // mapper에서 사용할 명명
	}
	
	public BoardDto get(int boardId) {
		return get(boardId, null);
	}
	
	
	
	// 가져온 게시물 수정하고 등록하기
	@Override
	public int update(BoardDto board, MultipartFile[] files, List<String> removeFiles) { 	// service에 사용한 명명
		int boardId = board.getBoardId();
		
		// 수정 페이지에서 파일 삭제
		if (removeFiles != null) {
			for (String boardFileName : removeFiles) {
				// 1. File 테이블에서 record 지우기
				boardMapper.deleteFileBoardIdAndFileName(boardId, boardFileName);
				// 2. 저장소에 실제 파일 지우기
				deleteFile(boardId, boardFileName);
			}
			
		}
		
		// 수정 페이지에서 새 파일첨부
		for (MultipartFile file : files) {
			
			if (file != null && file.getSize() > 0) {
				
				String boardFileName = file.getOriginalFilename();
				
				// File table에 해당파일명 덮어씌우기 위해 지우기
				boardMapper.deleteFileBoardIdAndFileName(boardId, boardFileName);
				
				// boardFile table에 파일명 추가
				boardMapper.insertFile(boardId, boardFileName);
				
				// 저장소에 실제 파일 추가
				uploadFile(boardId, file);
			}
		}
		
		return boardMapper.update(board);	// mapper에서 사용할 명명
	}
	
	// 게시물 삭제하기
	@Override
	public int remove(int boardId) {		// service에 사용한 명명
		BoardDto board = boardMapper.select(boardId); // BoardDto에서 select를 가져와서
		
		// list에 있는 (파일첨부 2개 이상) 가져와서 s3 저장소 파일 지움
		List<String> fileNames = board.getBoardFileName();
		
		if(fileNames != null) {
			for (String fileName : fileNames) {
				// s3저장소 지우기
				deleteFile(boardId, fileName);
			}
		}
		// db 파일 records 지우기
		boardMapper.deleteFileByBoardId(boardId);
		
		// 게시글에 달린 댓글 지우기
		boardReplyMapper.deleteByBoardId(boardId); // boardReplyMapper로
		
		// 게시글 지울때
		return boardMapper.delete(boardId); // mapper에서 사용할 명명
		
	}
	
	private void deleteFile(int boardId, String fileName) {
		String key = "board/" + boardId + "/" + fileName;
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		s3Client.deleteObject(deleteObjectRequest);
	}
	
		// 좋아요
		@Override
		public Map<String, Object> updateLike(String board_boardId, String member_userId) {
			Map<String, Object> map = new HashMap<>();
			
			int cnt = boardMapper.getLikeByBoardIdAndUserId(board_boardId, member_userId);
			
			if (cnt == 1) {
				// 좋아요 있으면 삭제
				boardMapper.deleteLike(board_boardId, member_userId);
				map.put("current", "not liked");
			} else {
				// 없으면 좋아요 누르기 보이기
				boardMapper.insertLike(board_boardId, member_userId);
				map.put("current", "liked");
			}
			
			// 좋아요 카운트 갯수
			int countAll = boardMapper.countLikeByBoardId(board_boardId);
			map.put("count", countAll);
			
			return map;
		}
		
		// 조회수
		@Override
		public int updateViewCount(int boardId) {
			return boardMapper.updateViewCount(boardId);
		}
 }
