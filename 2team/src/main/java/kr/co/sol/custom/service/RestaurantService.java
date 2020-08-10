package kr.co.sol.custom.service;

import java.util.List;

import kr.co.sol.custom.dto.MenuDTO;
import kr.co.sol.custom.dto.RestaurantDTO;

public interface RestaurantService {
	List<RestaurantDTO> getRestaurants(RestaurantDTO tdto);
	List<MenuDTO> getMenus(RestaurantDTO tdto);
	int likeRestaurant(int res_no,int mem_no);
}
