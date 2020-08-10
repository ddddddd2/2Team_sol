package kr.co.sol.custom.service.impl;

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
	public int likeRestaurant(int res_no, int mem_no) {
		// TODO Auto-generated method stub
		return restaurantDao.likeRestaurant(res_no , mem_no);
	}
	
	
	
}
