package kr.co.sol.searchresult.service.impl;

import java.util.List;

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
	public List<RestaurantDTO> getRestaurants(RestaurantDTO resdto) {
		// TODO Auto-generated method stub
		return searchResultDao.getRestaurants(resdto);
	}

	@Override
	public RestaurantDTO getResInfo(int no) {
		
		return searchResultDao.getResInfo(no);
	}	
	
}
