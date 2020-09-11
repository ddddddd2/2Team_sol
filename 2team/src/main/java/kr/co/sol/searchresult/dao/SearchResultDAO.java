package kr.co.sol.searchresult.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestParam;
=======
import org.apache.ibatis.annotations.Param;
>>>>>>> branch 'newMaster' of https://github.com/ddddddd2/2Team_sol.git

import kr.co.sol.common.dto.RestaurantDTO;

@Mapper
public interface SearchResultDAO {
	RestaurantDTO getRestaurants(RestaurantDTO resdto);
	List<RestaurantDTO> getRestaurants2(HashMap<String,Object> hmap);
<<<<<<< HEAD
	List<Map<String,Object>> getvRestaurants(HashMap<String,Object> hmap);
	int getCnt(HashMap<String,Object> hmap);
	int visitorsCnt(RestaurantDTO resdto);
	Map<String,Object> reviewCountAndAvg(RestaurantDTO resdto);
=======
	List<RestaurantDTO> getResname(@Param("category") int category);
>>>>>>> branch 'newMaster' of https://github.com/ddddddd2/2Team_sol.git
}
