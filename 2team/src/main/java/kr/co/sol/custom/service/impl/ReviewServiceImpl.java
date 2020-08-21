package kr.co.sol.custom.service.impl;

import java.io.File;
import java.io.IOException;
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
	public int reviewInsert(ReviewDTO rdto, MultipartFile file) {
		
		String sourceFileName = file.getOriginalFilename();
		File destinationFile; 
		if (sourceFileName == null || sourceFileName.length()==0) { 
		    rdto.setFile1("");
		}else {
			rdto.setFile1(sourceFileName);
			destinationFile = new File(rdto.getPath()+ sourceFileName); 
	        destinationFile.getParentFile().mkdirs(); 
		    try {
				file.transferTo(destinationFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				 e.printStackTrace();
			}
		}
		
		return reviewDao.reviewInsert(rdto);
	}

	@Override
	public Map<String, Object> reviewCountAndAvg(RestaurantDTO tdto) {
		// TODO Auto-generated method stub
		return reviewDao.reviewCountAndAvg(tdto);
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
