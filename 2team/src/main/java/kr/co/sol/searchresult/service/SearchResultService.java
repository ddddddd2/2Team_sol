package kr.co.sol.searchresult.service;

import java.util.HashMap;
import java.util.List;
<<<<<<< HEAD
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

=======
>>>>>>> branch 'newMaster' of https://github.com/ddddddd2/2Team_sol.git
import kr.co.sol.common.dto.RestaurantDTO;


public interface SearchResultService {
	RestaurantDTO getRestaurants(RestaurantDTO resdto);
	List<RestaurantDTO> getRestaurants2(HashMap<String,Object> hmap);
<<<<<<< HEAD
	List<Map<String,Object>> getvRestaurants(HashMap<String,Object> hmap );
	int getCnt(HashMap<String,Object> hmap);
	int visitorsCnt(RestaurantDTO resdto);
	Map<String,Object> reviewCountAndAvg(RestaurantDTO resdto);
=======
	List<RestaurantDTO> getResname(int category);
	
>>>>>>> branch 'newMaster' of https://github.com/ddddddd2/2Team_sol.git
}

