package kr.co.sol.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.sol.common.dto.PageDTO;
import kr.co.sol.common.dto.RestaurantDTO;

public interface AdminService {
	List<HashMap<String, Object>> getMember();

	List<HashMap<String, Object>> getMemberList(@Param("searchOption") String searchOption, @Param("keyword") String keyword);

	List<RestaurantDTO> getStore(String searchOption, String keyword);

	List<RestaurantDTO> getStoreList(PageDTO pdto, int curPage);

	List<HashMap<String,Object>> getBookingList();
	int nameChk(String name);

	List<HashMap<String,Object>> getBooking(String searchOption, String keyword);

	int bCancel(int no);

	RestaurantDTO getStoreInfo(int no);

	int addrChk(String addr);

	int updateResInfo(RestaurantDTO resdto);


}
