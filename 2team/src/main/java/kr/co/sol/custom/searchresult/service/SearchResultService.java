package kr.co.sol.custom.searchresult.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.sol.custom.dto.RestaurantDTO;

public interface SearchResultService {
	List<RestaurantDTO> getRestaurants(RestaurantDTO resdto);
	List<RestaurantDTO> getRestaurants2(@Param("keyword") String keyword);
}
