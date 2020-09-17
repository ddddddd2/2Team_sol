package kr.co.sol.searchresult.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.common.dto.ReviewDTO;


public interface SearchResultService {
	RestaurantDTO getRestaurants(RestaurantDTO resdto);
	List<RestaurantDTO> getRestaurants2(HashMap<String,Object> hmap);
	List<Map<String,Object>> getvRestaurants(HashMap<String,Object> hmap );
	int getCnt(HashMap<String,Object> hmap);
	int visitorsCnt(RestaurantDTO resdto);
	Map<String,Object> reviewCountAndAvg(RestaurantDTO resdto);
	List<RestaurantDTO> getResname(int category);
	ReviewDTO getReview(RestaurantDTO resdto2);
}

