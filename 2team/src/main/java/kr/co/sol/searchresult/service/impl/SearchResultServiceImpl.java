package kr.co.sol.searchresult.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.searchresult.dao.SearchResultDAO;
import kr.co.sol.searchresult.service.SearchResultService;

@Service
public class SearchResultServiceImpl implements SearchResultService {

	@Autowired
	SearchResultDAO searchResultDao;
	
	
	@Override
	public RestaurantDTO getRestaurants(RestaurantDTO resdto) {
		return searchResultDao.getRestaurants(resdto);
	} 

	@Override
	public List<RestaurantDTO> getRestaurants2(HashMap<String,Object> hmap) {
		return searchResultDao.getRestaurants2(hmap);
	}

	
	 @Override public List<Map<String,Object>> getvRestaurants(HashMap<String,Object> hmap) { 
		// TODO Auto-generated method stub 
		 return searchResultDao.getvRestaurants(hmap);
	}
	 

	@Override
	public int getCnt(HashMap<String, Object> hmap) {
		// TODO Auto-generated method stub
		return searchResultDao.getCnt(hmap);
	}

	@Override
	public int visitorsCnt(RestaurantDTO resdto) {
		// TODO Auto-generated method stub
		return searchResultDao.visitorsCnt(resdto);
	}

	@Override
	public Map<String,Object> reviewCountAndAvg(RestaurantDTO resdto) {
		// TODO Auto-generated method stub
		return searchResultDao.reviewCountAndAvg(resdto);
	}	
	
	@Override
	public List<RestaurantDTO> getResname(int category){
		return searchResultDao.getResname(category);
	}

}
