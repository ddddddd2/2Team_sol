package kr.co.sol.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.sol.common.dto.PageDTO;
import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.etc.Pagination;

public interface AdminService {
	List<HashMap<String, Object>> getMember(int start, int end);

	List<HashMap<String, Object>> getMemberList(@Param("searchOption") String searchOption, @Param("keyword") String keyword, int start, int end);

	List<RestaurantDTO> getStore(String searchOption, String keyword, int start, int end);

	List<RestaurantDTO> getStoreList(@Param("start") int start, @Param("end") int end);

	List<HashMap<String,Object>> getBookingList(int start, int end);
	int nameChk(String name);

	List<HashMap<String,Object>> getBooking(@Param("searchOption") String searchOption, @Param("keyword") String keyword, int start, int end);

	int bCancel(int no);

	RestaurantDTO getStoreInfo(int no);

	int addrChk(String addr);

	int updateResInfo(RestaurantDTO resdto);

	int allListCnt(Map<String, String> url);


}
