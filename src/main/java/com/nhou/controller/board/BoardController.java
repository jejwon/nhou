package com.nhou.controller.board;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nhou.domain.board.BoardDto;
import com.nhou.domain.board.PageInfo;
import com.nhou.domain.member.MemberDto;
import com.nhou.service.board.BoardService;
import com.nhou.service.member.MemberService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberService memberSeervice;
	
	@GetMapping("boardInsert")
	public void insert() {
		
	}
	
	@PostMapping("boardInsert")
	public String insert(BoardDto board, Principal principal, // 작성한 작성자 정보 가져옴
			MultipartFile[] files, RedirectAttributes rttr) { 
		
		String loginId = principal.getName();
		board.setMember_userId(loginId);
		
		/*
		 * System.out.println(files.length);
		 * 
		 * for (MultipartFile file : files) {
		 * System.out.println(file.getOriginalFilename()); }
		 */
		
		
		int cnt = boardService.insertFile(board, files);
		
		if (cnt == 1) {
			rttr.addFlashAttribute("message", "새 게시물이 등록되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 게시물이 등록되지 않았습니다.");
		}
		
		return "redirect:/board/boardList";
	}
	
	// 게시글 리스트
	@GetMapping("boardList")
	public void get(@RequestParam(name="page", defaultValue = "1") int page, // 페이지
					@RequestParam(name="t", defaultValue = "all") String type, // 검색할 범위(카테고리)
					@RequestParam(name="q", defaultValue = "") String keyword, // 검색 키워드
					@RequestParam(name = "category", defaultValue = "") String category, // 카테고리
					PageInfo pageInfo, Model model) {
		
		List<BoardDto> list = boardService.listBoard(page, type, keyword, pageInfo, category); // service에 listBoard로 넘어감
		/* System.out.println("게시물" + list); */
		
		model.addAttribute("boardList", list); // boardList라는 곳에 list를 담겠다
	}
	
	// 게시글 보기
	@GetMapping("boardGet")
	public void get(@RequestParam(name="boardId") int boardId,
			Model model, Authentication auth) {
			
		String member_userId = null;
			
		if (auth != null) {
			member_userId = auth.getName();
		}
		
		// 조회수
		boardService.updateViewCount(boardId);
			
		BoardDto board = boardService.get(boardId, member_userId);
		model.addAttribute("board", board);
			
	}
	
	// 게시글 수정하기(이전에 쓴 글 가져오기)
	@GetMapping("boardModify") // @은 외부 빈, #은 메소드의 파라미터
	@PreAuthorize("@boardSecurity.checkWriter(authentication.name, #boardId)")
	public void modify(@RequestParam(name="boardId") int boardId,
			Model model) {
		
		BoardDto board = boardService.get(boardId); // service에 get을 사용
	
		model.addAttribute("board", board);
	}
	
	// 게시글 수정해서 다시 등록하기
	@PostMapping("boardModify")                                   // BoardDto board를 앞에 붙임
	@PreAuthorize("@boardSecurity.checkWriter(authentication.name, #board.boardId)")
	public String modify(BoardDto board, 
						 @RequestParam("files") MultipartFile[] files,
						 @RequestParam(name="removeFiles", required = false) List<String> removeFiles,
						 RedirectAttributes rttr) {
		
		/*
		 * if (files != null) { System.out.println(files.length); for (MultipartFile
		 * file : files) { System.out.println(file.getOriginalFilename()); }
		 */
		
		int cnt = boardService.update(board, files, removeFiles); // service에 update를 사용

		if (cnt == 1) {
			rttr.addFlashAttribute("message", board.getBoardId() + "새 게시물이 수정되었습니다.");
		} else {
			rttr.addFlashAttribute("message", board.getBoardId() + "새 게시물이 수정되지 않았습니다.");
		}
		
		return "redirect:/board/boardList";
	}
	
	// 게시글 삭제하기
	@PostMapping("boardRemove")
	public String remove(@RequestParam(name="boardId") int boardId,
			RedirectAttributes rttr) {
		int cnt = boardService.remove(boardId);
		
		if (cnt == 1) {
			rttr.addFlashAttribute("message", "새 게시물이 삭제되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 게시물이 삭제되지 않았습니다.");
		}
		
		return "redirect:/board/boardList";
	}
	

	// 좋아요
	@PutMapping("boardLike")
	@ResponseBody
	@PreAuthorize("isAuthenticated()") // 로그인 했을때만 작동하도록
	public Map<String, Object> like(@RequestBody Map<String, String> req,
							Authentication auth) {
		
		System.out.println(req);
		
		Map<String, Object> result = boardService.updateLike(req.get("board_boardId"), auth.getName());
		
		
		return result;
		
	}

}
