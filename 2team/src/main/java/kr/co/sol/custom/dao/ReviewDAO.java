package kr.co.sol.custom.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;

@Mapper
public interface ReviewDAO {
	int reviewInsert(ReviewDTO revdto);
	Map<String,Object> reviewCountAndAvg(RestaurantDTO resdto);
	List<ReviewDTO> getReviews(HashMap<String,Integer> hmap2);
	int likeReview(HashMap<String,Integer> hmap);
	int dislikeReview(HashMap<String,Integer> hmap);
	int likeCheck(HashMap<String,Integer> hmap);
	int likePlus(HashMap<String,Integer> hmap);
	int likeMinus(HashMap<String,Integer> hmap);
}
