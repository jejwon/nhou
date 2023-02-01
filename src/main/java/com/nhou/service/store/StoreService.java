package com.nhou.service.store;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.nhou.domain.store.CategoryDto;

import com.nhou.domain.store.Criteria;
import com.nhou.domain.store.StoreDto;
import com.nhou.mapper.store.StoreMapper;
import com.nhou.mapper.store.StoreReviewMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;


@Service
@Transactional
public class StoreService {

	@Autowired
	private StoreMapper storeMapper;
	
	@Autowired
	private StoreReviewMapper storeReviewMapper;
	
	@Autowired
	private S3Client s3Client;
	
	@Value("${aws.s3.bucket}")
	private String bucketName;
	
	public int register(StoreDto store, MultipartFile productFile1, MultipartFile[] productFile2) {
//		db에 게시물 정보 저장
//		System.out.println("service =============> "+store);
		int cnt = storeMapper.insert(store);
	
		if (productFile1 != null && productFile1.getSize() > 0) {
//		db에 파일 정보 저장
//		파일명, 게시물id
			storeMapper.insertFile(store.getProductId(), productFile1.getOriginalFilename());
			
			uploadFile1(store.getProductId(), productFile1);

/*		파일 저장
		store id 이름의 새 폴더 만들기
			File folder = new File("C:\\Users\\fgsfs\\Desktop\\Study\\upload\\nhou\\store\\" + store.getProductId());
			folder.mkdirs();
			File dest = new File(folder, productFile1.getOriginalFilename());
			try {
				productFile1.transferTo(dest);
			} catch (IOException e) {
				// @Transactional은 RuntimeException에서만 rollback됨
				e.printStackTrace();
				throw new RuntimeException(e);
			}	*/	
					
		}

		for (MultipartFile file : productFile2) {
			if (file != null && file.getSize() > 0) {
//			db에 파일 정보 저장
//			파일명, 게시물id
				storeMapper.insertFile2(store.getProductId(), file.getOriginalFilename());
					
				uploadFile2(store.getProductId(), file);
					
	/*			파일 저장
			    store id 이름의 새 폴더 만들기
					File folder = new File("C:\\Users\\fgsfs\\Desktop\\Study\\upload\\nhou\\store\\" + store.getProductId());
					folder.mkdirs();
					File dest = new File(folder, file.getOriginalFilename());
					try {
						file.transferTo(dest);
					} catch (IOException e) {
						// @Transactional은 RuntimeException에서만 rollback됨
						e.printStackTrace();
						throw new RuntimeException(e);
					} */
							
				}		
	      }
		
		return cnt;
	}
	
	private void uploadFile1(int productId, MultipartFile productFile1) {
		try {
			String key = "atrium/store/" + productId + "/" + productFile1.getOriginalFilename();
			
			PutObjectRequest putObjectRequest = PutObjectRequest.builder()
					.bucket(bucketName)
					.key(key)
					.acl(ObjectCannedACL.PUBLIC_READ)
					.build();
			
			RequestBody requestBody = RequestBody.fromInputStream(productFile1.getInputStream(), productFile1.getSize());
		
			s3Client.putObject(putObjectRequest, requestBody);
		
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	private void uploadFile2(int productId, MultipartFile file) {
		try {
			String key = "atrium/store/" + productId + "/" + file.getOriginalFilename();
			
			
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
		int productId = store.getProductId();
		// removeFiles에 있는 파일명으로
		if (removeFiles != null) {
			for (String storeFileName : removeFiles) {
			
			// 1. File 테이블에서 record 지우기
			storeMapper.deleteFileByStoreIdAndFileName(productId, storeFileName);
			// 2. 저장소에 실제 파일 지우기
			deleteFile(productId, storeFileName);
			}
		}
		
		for (MultipartFile file : productFile2) {
			if (file != null && file.getSize() > 0) {
				String storeFileName = file.getOriginalFilename();
				
			// 파일 table에 해당 파일명 지우기
				storeMapper.deleteFileByStoreIdAndFileName(productId, storeFileName);
				
			// File table 파일명 추가
				storeMapper.insertFile2(productId, storeFileName);
				
			// 저장소에 실제 파일 추가
				uploadFile2(productId, file);
		
			}
		}
		
		return storeMapper.update(store);
	}


	public int remove(int productId) {
		// 저장소의 파일 지우기
		StoreDto store = storeMapper.select(productId);
		
		List<String> fileNames = store.getProductFileName();
		
		if(fileNames != null)
			for(String fileName : fileNames) {
				deleteFile(productId, fileName);
		}
		
		// db 파일 record 지우기
		storeMapper.deleteFileByStoreId(productId);
		
		// 게시물의 댓글들 지우기
		storeReviewMapper.deleteByReviewId(productId);
		
		//게시물 지우기
		return storeMapper.delete(productId);
		
	}
	
	private void deleteFile(int productId, String fileName) {
		String key = "atrium/store/" + productId + "/" + fileName;
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
				.bucket(bucketName)
				.key(key)
				.build();
		s3Client.deleteObject(deleteObjectRequest);
	}


	    public List<CategoryDto> getCateList(Criteria cri) {
		// TODO Auto-generated method stub
		return storeMapper.getCateList();
	}


}
