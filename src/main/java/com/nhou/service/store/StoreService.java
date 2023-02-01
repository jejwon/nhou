package com.nhou.service.store;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.nhou.domain.store.CategoryDto;
import com.nhou.domain.store.Criteria;
import com.nhou.domain.store.StoreDto;
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

		for (MultipartFile file : productFile2) {
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


	// 리스트
	public List<StoreDto> listStore(Criteria cri, String category, Long productCategory_categoryId) {
	
		System.out.println("list Criteria" + cri);
		
		int offset = (cri.getPageNum() - 1) * cri.getAmount();
		int records = cri.getAmount();
		System.out.println(cri.getType());
		
		return storeMapper.getListWithPaging(cri, offset, records, category, productCategory_categoryId);
	}

	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return storeMapper.getTotalCount(cri, 134);
	}


	public StoreDto get(int productId) {
		return storeMapper.select(productId);
	}


	public int update(StoreDto store, MultipartFile[] productFile2, List<String> removeFiles) {
		int storeId = store.getProductId();
		// removeFiles에 있는 파일명으로
		if (removeFiles != null) {
			for (String fileName : removeFiles) {
			
			// 1. File 테이블에서 record 지우기
			storeMapper.deleteFileByStoreIdAndFileName(storeId, fileName);
			// 2. 저장소에 실제 파일 지우기
			String path = "C:\\Users\\fgsfs\\Desktop\\Study\\upload\\nhou\\store\\" + storeId + "\\" + fileName;
			File file = new File(path);
						
				file.delete();
			}
		}
		
		for (MultipartFile file : productFile2) {
			if (file != null && file.getSize() > 0) {
				String name = file.getOriginalFilename();
				
			// 파일 table에 해당 파일명 지우기
				storeMapper.deleteFileByStoreIdAndFileName(storeId, name);
				
			// File table 파일명 추가
				storeMapper.insertFile2(storeId, name);
				
			// 저장소에 실제 파일 추가
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
		
		return storeMapper.update(store);
	}


	public int remove(int productId) {
		// 저장소의 파일 지우기
		String path = "C:\\Users\\fgsfs\\Desktop\\Study\\upload\\nhou\\store\\" + productId;
		File folder = new File(path);
		
		File[] listFiles = folder.listFiles();
		
		for(File file : listFiles) {
			file.delete();
		}
		
		folder.delete();
		
		// db 파일 record 지우기
		storeMapper.deleteFileByStoreId(productId);
		
		// 게시물의 댓글들 지우기
		storeReviewMapper.deleteByReviewId(productId);
		
		//게시물 지우기
		return storeMapper.delete(productId);
		
	}


	    public List<CategoryDto> getCateList(Criteria cri) {
		// TODO Auto-generated method stub
		return storeMapper.getCateList();
	}


}
