package kr.co.sol.custom.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.sol.custom.dao.ReviewDAO;
import kr.co.sol.custom.dto.ReviewDTO;
import kr.co.sol.custom.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    ReviewDAO reviewDao;
	
	@Override
	public int reviewInsert(ReviewDTO rdto, MultipartFile file) {
		// TODO Auto-generated method stub
		
		String sourceFileName = file.getOriginalFilename();
		File destinationFile; 
		if (sourceFileName == null || sourceFileName.length()==0) { 
		    rdto.setFile("ready.gif");
		}else {
			rdto.setFile(sourceFileName);
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
	public Map<String, Object> reviewCountAndAvg(int res_no) {
		// TODO Auto-generated method stub
		return reviewDao.reviewCountAndAvg(res_no);
	}

	@Override
	public List<ReviewDTO> getReviews(int res_no) {
		// TODO Auto-generated method stub
		return reviewDao.getReviews(res_no);
	}
	
}
