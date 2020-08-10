package kr.co.sol.custom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.custom.dto.MenuDTO;
import kr.co.sol.custom.dto.RestaurantDTO;

@Mapper
public interface RestaurantDAO {
	List<RestaurantDTO> getRestaurants(RestaurantDTO tdto);
	List<MenuDTO> getMenus(RestaurantDTO tdto);
	int likeRestaurant(int res_no , int mem_no);
}
