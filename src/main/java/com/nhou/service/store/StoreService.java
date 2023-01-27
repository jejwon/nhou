package com.nhou.service.store;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.nhou.domain.store.StoreDto;
import com.nhou.domain.store.CategoryDto;
import com.nhou.domain.store.Criteria;
import com.nhou.mapper.store.StoreMapper;
import com.nhou.mapper.store.StoreReviewMapper;


@Service
@Transactional
public class StoreService {

	@Autowired
	private StoreMapper storeMapper;
	
	@Autowired
	private StoreReviewMapper storeReviewMapper;
	
	
	public int register(StoreDto store, MultipartFile productFile1, MultipartFile[] productFile2) {
//		db에 게시물 정보 저장
//		System.out.println("service =============> "+store);
		int cnt = storeMapper.insert(store);
	
		if (productFile1 != null && productFile1.getSize() > 0) {
//		db에 파일 정보 저장
//		파일명, 게시물id
			storeMapper.insertFile(store.getProductId(), productFile1.getOriginalFilename());
			
//		파일 저장
//		store id 이름의 새 폴더 만들기
			File folder = new File("C:\\Users\\fgsfs\\Desktop\\Study\\upload\\nhou\\store\\" + store.getProductId());
			folder.mkdirs();
			File dest = new File(folder, productFile1.getOriginalFilename());
			try {
				productFile1.transferTo(dest);
			} catch (IOException e) {
				// @Transactional은 RuntimeException에서만 rollback됨
				e.printStackTrace();
				throw new RuntimeException(e);
			}		
					
		}

		for (MultipartFile file : productFile2 ) {
			if (file != null && file.getSize() > 0) {
//			db에 파일 정보 저장
//			파일명, 게시물id
					storeMapper.insertFile2(store.getProductId(), file.getOriginalFilename());
					
	//			파일 저장
	//			store id 이름의 새 폴더 만들기
					File folder = new File("C:\\Users\\fgsfs\\Desktop\\Study\\upload\\nhou\\store\\" + store.getProductId());
					folder.mkdirs();
					File dest = new File(folder, file.getOriginalFilename());
					try {
						file.transferTo(dest);
					} catch (IOException e) {
						// @Transactional은 RuntimeException에서만 rollback됨
						e.printStackTrace();
						throw new RuntimeException(e);
					}
							
				}		
	      }
		return cnt;

	}

	// 스토어 리스트 페이징 + 카테고리 분류
	/*
	 * public List<StoreDto> listStore(int page, String type, String keyword,
	 * StorePageInfo StorePageInfo, String category) { int records = 5; // 글 갯수 int
	 * offset = (page - 1) * records; // 페이지수
	 * 
	 * int countAll = storeMapper.countAll(type, "%" + keyword + "%"); // SELECT
	 * Count(*) FROM product int lastPage = (countAll - 1) / records + 1;
	 * 
	 * int leftPageNum = (page - 1) / 5 * 5 + 1; int rightPageNum = leftPageNum + 4;
	 * rightPageNum = Math.min(rightPageNum, lastPage);
	 * 
	 * // 이전버튼 유무 boolean hasPreBtn = page > 5; // 다음버튼 유무 boolean hasNextBtn = page
	 * <= ((lastPage - 1) / 5 * 5);
	 * 
	 * // 이전버튼 눌렀을 때 가는 페이지 번호 int jumpPrePageNum = (page - 1) / 5 * 5 - 4; int
	 * jumpNextPageNum = (page - 1) / 5 * 5 + 6;
	 * 
	 * StorePageInfo.setHasPreBtn(hasPreBtn);
	 * StorePageInfo.setHasNextBtn(hasNextBtn);
	 * StorePageInfo.setJumpNextPageNum(jumpNextPageNum);
	 * StorePageInfo.setJumpPrePageNum(jumpPrePageNum);
	 * StorePageInfo.setRightPageNum(rightPageNum);
	 * StorePageInfo.setLeftPageNum(leftPageNum);
	 * StorePageInfo.setCurrentPageNum(page);
	 * StorePageInfo.setLastPageNum(lastPage);
	 * 
	 * return storeMapper.list(offset, records, type, "%" + keyword + "%",
	 * category); }
	 */


	public StoreDto get(int productId) {
		return storeMapper.select(productId);
	}


	public int update(StoreDto store) {
		return storeMapper.update(store);
		
	}


	public int remove(int productId) {
		// 게시물의 댓글들 지우기
		storeReviewMapper.deleteByReviewId(productId);
		
		//게시물 지우기
		return storeMapper.delete(productId);
		
	}

	/*
	 * public List<StoreDto> listStore(String type, String keyword, String
	 * categoryName) { // TODO Auto-generated method stub int counAll =
	 * storeMapper.countAll(type, "%" + keyword + "%");
	 * 
	 * return storeMapper.list(type, "%" + keyword + "%", categoryName); }
	 */

	// 리스트
	public List<StoreDto> listStore(Criteria cri, String category) {
	
		System.out.println("list Criteria" + cri);
		
		int offset = (cri.getPageNum() - 1) * cri.getAmount();
		int records = cri.getAmount();
		System.out.println(cri.getType());
		
		return storeMapper.getListWithPaging(cri, offset, records, category);
	}

	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return storeMapper.getTotalCount(cri, 134);
	}
	
	public List<CategoryDto> getCategory() {
		return storeMapper.getCategory();
	}

	public List<CategoryDto> getCateList(Criteria cri) {
		// TODO Auto-generated method stub
		return storeMapper.getCateList();
	}

}
