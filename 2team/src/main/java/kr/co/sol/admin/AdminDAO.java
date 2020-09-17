package kr.co.sol.admin;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.sol.common.dto.RestaurantDTO;

@Mapper
public interface AdminDAO {

	List<HashMap<String, Object>> getMember();
	List<RestaurantDTO> getStoreList(@Param("startPage") int startPage, @Param("endPage") int endPage);
	List<RestaurantDTO> getStore(@Param("searchOption") String searchOption, @Param("keyword") String keyword);
	List<HashMap<String, Object>> getMemberList(String searchOption, String keyword);
	int nameChk(String name);
	// paging 泥섎━ 
	int allList(); // �쟾泥� 由ъ뒪�듃 媛��닔 媛��졇�삤湲�.
	int getStoreListCnt();
	List<HashMap<String,Object>> getBookingList();
	List<HashMap<String,Object>> getBooking(String searchOption, String keyword);
	int bCancel(int no);
	RestaurantDTO getStoreInfo(int no);
	int addrChk(String addr);
	int updateResInfo(RestaurantDTO resdto);
}
