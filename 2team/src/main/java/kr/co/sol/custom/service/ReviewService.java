package kr.co.sol.custom.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;

public interface ReviewService {
	int reviewInsert(ReviewDTO rdto , MultipartFile file);
	Map<String,Object> reviewCountAndAvg(RestaurantDTO tdto);
	List<ReviewDTO> getReviews(RestaurantDTO tdto);
}
