package kr.co.sol.custom.service;

import java.util.HashMap;
import java.util.List;

import kr.co.sol.custom.dto.MenuDTO;
import kr.co.sol.custom.dto.RestaurantDTO;

public interface RestaurantService {
	List<RestaurantDTO> getRestaurants(RestaurantDTO tdto);
	List<MenuDTO> getMenus(RestaurantDTO tdto);
	int likeRestaurant(HashMap<String,Integer> hmap);
	int dislikeRestaurant(HashMap<String,Integer> hmap);
	int favoriteCheck(HashMap<String,Integer> hmap);
}
