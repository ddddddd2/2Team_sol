package kr.co.sol.searchresult.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.searchresult.dao.SearchResultDAO;
import kr.co.sol.searchresult.service.SearchResultService;

@Service
public class SearchResultServiceImpl implements SearchResultService {

	@Autowired
	SearchResultDAO searchResultDao;
	
	@Override
	public RestaurantDTO getRestaurants(RestaurantDTO resdto) {
		// TODO Auto-generated method stub
		return searchResultDao.getRestaurants(resdto);
	} 

	@Override
	public List<RestaurantDTO> getRestaurants2(HashMap<String,Object> hmap) {
		// TODO Auto-generated method stub
		return searchResultDao.getRestaurants2(hmap);
	}	
	
	
}
