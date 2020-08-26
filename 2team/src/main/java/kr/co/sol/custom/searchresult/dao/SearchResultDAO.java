package kr.co.sol.custom.searchresult.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.sol.custom.dto.RestaurantDTO;

@Mapper
public interface SearchResultDAO {
	List<RestaurantDTO> getRestaurants(RestaurantDTO resdto);
	List<RestaurantDTO> getRestaurants2(HashMap<String,Object> hmap);
}
