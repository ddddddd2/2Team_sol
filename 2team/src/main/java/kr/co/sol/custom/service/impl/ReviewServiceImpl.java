package kr.co.sol.custom.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.sol.custom.dao.ReviewDAO;
import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;
import kr.co.sol.custom.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    ReviewDAO reviewDao;
	
	@Override
	public int reviewInsert(ReviewDTO revdto, MultipartFile file) {
//		
//		String sourceFileName = file.getOriginalFilename();
//		File destinationFile; 
//		if (sourceFileName == null || sourceFileName.length()==0) { 
//		    revdto.setFile1("");
//		}else {
//			rdto.setFile1(sourceFileName);
//			destinationFile = new File(revdto.getPath()+ sourceFileName); 
//	        destinationFile.getParentFile().mkdirs(); 
//		    try {
//				file.transferTo(destinationFile);
//			} catch (IllegalStateException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				 e.printStackTrace();
//			}
//		}
//	
		
		// ReviewDTO의 file1 은 byte[]로 해야함.
		
		return reviewDao.reviewInsert(revdto);
	}

	@Override
	public Map<String, Object> reviewCountAndAvg(RestaurantDTO resdto) {
		// TODO Auto-generated method stub
		return reviewDao.reviewCountAndAvg(resdto);
	}

	@Override
	public List<ReviewDTO> getReviews(HashMap<String,Integer> hmap2) {
		// TODO Auto-generated method stub
		return reviewDao.getReviews(hmap2);
	}

	@Override
	public int likeReview(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return reviewDao.likeReview(hmap);
	}

	@Override
	public int dislikeReview(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return reviewDao.dislikeReview(hmap);
	}

	@Override
	public int likeCheck(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return reviewDao.likeCheck(hmap);
	}

	@Override
	public int likePlus(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return reviewDao.likePlus(hmap);
	}

	@Override
	public int likeMinus(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return reviewDao.likeMinus(hmap);
	}
	
	
}
