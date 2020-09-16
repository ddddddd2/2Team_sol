package kr.co.sol.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.sol.common.dto.BookingDTO;
import kr.co.sol.common.dto.MemberDTO;
import kr.co.sol.common.dto.PageDTO;
import kr.co.sol.common.dto.RestaurantDTO;

public interface AdminService {
	List<HashMap<String, Object>> getMember();

	List<HashMap<String, Object>> getMemberList(@Param("searchOption") String searchOption, @Param("keyword") String keyword);

	MemberDTO login(String id, String passwd);

	String login2(MemberDTO mdto);

	MemberDTO loginPro(MemberDTO mdto);

	List<RestaurantDTO> getStore(String searchOption, String keyword);

	List<RestaurantDTO> getStoreList(PageDTO pdto, int curPage);

	List<HashMap<String,Object>> getBookingList();
	int nameChk(String name);

	List<HashMap<String,Object>> getBooking(String searchOption, String keyword);

	int bCancel(int no);


}
