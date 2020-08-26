package kr.co.sol.custom.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;

public interface ReviewService {
	int reviewInsert(ReviewDTO revdto , MultipartFile file);
	Map<String,Object> reviewCountAndAvg(RestaurantDTO resdto);
	List<ReviewDTO> getReviews(HashMap<String,Integer> hmap2);
	int likeReview(HashMap<String,Integer> hmap);
	int dislikeReview(HashMap<String,Integer> hmap);
	int likeCheck(HashMap<String,Integer> hmap);
	int likePlus(HashMap<String,Integer> hmap);
	int likeMinus(HashMap<String,Integer> hmap);
}
