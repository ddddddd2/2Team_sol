package kr.co.sol.searchresult.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.common.dto.ReviewDTO;

@Mapper
public interface SearchResultDAO {
	RestaurantDTO getRestaurants(RestaurantDTO resdto);
	List<RestaurantDTO> getRestaurants2(HashMap<String,Object> hmap);
	List<Map<String,Object>> getvRestaurants(HashMap<String,Object> hmap);
	int getCnt(HashMap<String,Object> hmap);
	int visitorsCnt(RestaurantDTO resdto);
	Map<String,Object> reviewCountAndAvg(RestaurantDTO resdto);
	List<RestaurantDTO> getResname(@Param("category") int category);
	ReviewDTO getReview(RestaurantDTO resdto2);
}
