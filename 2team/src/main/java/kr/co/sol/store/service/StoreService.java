package kr.co.sol.store.service;

import java.util.HashMap;
import java.util.List;
import kr.co.sol.store.dto.StoreDTO;

public interface StoreService {

	List<StoreDTO> getStore();
	List<HashMap<String, Object>> getBooking();
	List<StoreDTO> getStoreList(String searchOption, String keyword);

}
