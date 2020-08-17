package kr.co.sol.custom.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.custom.dao.RestaurantDAO;
import kr.co.sol.custom.dto.MenuDTO;
import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.service.RestaurantService;

@Service
public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	RestaurantDAO restaurantDao;
	
	@Override
	public List<RestaurantDTO> getRestaurants(RestaurantDTO tdto) {
		// TODO Auto-generated method stub
		return restaurantDao.getRestaurants(tdto);
	}

	@Override
	public List<MenuDTO> getMenus(RestaurantDTO tdto) {
		// TODO Auto-generated method stub
		return restaurantDao.getMenus(tdto);
	}

	@Override
	public int likeRestaurant(HashMap<String,Integer> hmap) {
		// TODO Auto-generated method stub

		return restaurantDao.likeRestaurant(hmap);
	}

	@Override
	public int dislikeRestaurant(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return restaurantDao.dislikeRestaurant(hmap);
	}

	@Override
	public int favoriteCheck(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return restaurantDao.favoriteCheck(hmap);
	}
	
	
	
}
