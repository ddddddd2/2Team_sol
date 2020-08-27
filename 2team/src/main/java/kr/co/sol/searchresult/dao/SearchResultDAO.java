package kr.co.sol.searchresult.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.common.dto.RestaurantDTO;

@Mapper
public interface SearchResultDAO {
	List<RestaurantDTO> getRestaurants(RestaurantDTO resdto);

	RestaurantDTO getResInfo(int no);

}
