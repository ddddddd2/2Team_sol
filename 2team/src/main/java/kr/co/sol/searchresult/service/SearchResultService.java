package kr.co.sol.searchresult.service;

import java.util.List;

import kr.co.sol.common.dto.RestaurantDTO;

public interface SearchResultService {
	List<RestaurantDTO> getRestaurants(RestaurantDTO resdto);

	RestaurantDTO getResInfo(int no);

}
