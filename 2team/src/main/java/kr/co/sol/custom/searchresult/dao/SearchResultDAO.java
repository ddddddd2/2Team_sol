package kr.co.sol.custom.searchresult.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.custom.dto.RestaurantDTO;

@Mapper
public interface SearchResultDAO {
	List<RestaurantDTO> getRestaurants(RestaurantDTO resdto);

}
