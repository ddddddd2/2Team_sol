package kr.co.sol.custom.searchresult.service;

import java.util.List;

import kr.co.sol.custom.dto.RestaurantDTO;

public interface SearchResultService {
	List<RestaurantDTO> getRestaurants(RestaurantDTO resdto);

}
