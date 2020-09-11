package kr.co.sol.searchresult.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.sol.common.dto.RestaurantDTO;

@Mapper
public interface SearchResultDAO {
	RestaurantDTO getRestaurants(RestaurantDTO resdto);
	List<RestaurantDTO> getRestaurants2(HashMap<String,Object> hmap);
	List<RestaurantDTO> getResname(@Param("category") int category);
}
