package kr.co.sol.store.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.admin.AdminDAO;
import kr.co.sol.store.dao.BookingDAO;
import kr.co.sol.store.dao.StoreDAO;
import kr.co.sol.store.dto.StoreDTO;
import kr.co.sol.store.service.StoreService;

@Service("StoreService")
public class StoreServiceImpl implements StoreService {
	@Autowired
	StoreDAO storeDao;
	
	@Autowired
	AdminDAO adminDao;
	
	@Autowired
	BookingDAO bookingDao;
	
	@Override
	public List<StoreDTO> getStore() {
		return storeDao.getStore();
	}

	@Override
	public List<HashMap<String, Object>> getBooking() {
		// TODO Auto-generated method stub
		return bookingDao.getBooking();
	}

	@Override
	public List<StoreDTO> getStoreList(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return storeDao.getStoreList(searchOption, keyword);
	}

}
