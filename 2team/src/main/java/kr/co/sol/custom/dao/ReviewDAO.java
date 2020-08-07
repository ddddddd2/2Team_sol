package kr.co.sol.custom.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;

@Mapper
public interface ReviewDAO {
	int reviewInsert(ReviewDTO rdto);
	Map<String,Object> reviewCountAndAvg(RestaurantDTO tdto);
	List<ReviewDTO> getReviews(RestaurantDTO tdto);
}
