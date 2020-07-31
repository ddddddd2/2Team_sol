package kr.co.sol.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.store.dao.StoreDAO;
import kr.co.sol.store.dto.StoreDTO;
import kr.co.sol.store.service.StoreService;
@Service("StoreService")
public class StoreServiceImpl implements StoreService {
	@Autowired
	StoreDAO storeDao;
	@Override
	public List<StoreDTO> getStore() {
		return storeDao.getStore();
	}

}
