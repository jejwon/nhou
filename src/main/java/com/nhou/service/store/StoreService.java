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
import com.nhou.mapper.store.StoreMapper;
import com.nhou.mapper.store.StoreReviewMapper;


@Service
public class StoreService {

	@Autowired
	private StoreMapper storeMapper;
	
	@Autowired
	private StoreReviewMapper storeReviewMapper;
	
	@Transactional
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
			File folder = new File("C:\\Users\\user\\Desktop\\Study\\upload\\nhou\\store\\" + store.getProductId());
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
					File folder = new File("C:\\Users\\user\\Desktop\\Study\\upload\\nhou\\store\\" + store.getProductId());
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


	public List<StoreDto> listStore() {
		return storeMapper.list(); 	
	}


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


}
