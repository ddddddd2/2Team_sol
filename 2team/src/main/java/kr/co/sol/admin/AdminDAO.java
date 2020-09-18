package kr.co.sol.admin;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.sol.common.dto.PageDTO;
import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.etc.Pagination;

@Mapper
public interface AdminDAO {

	List<HashMap<String, Object>> getMember(@Param("start") int start, @Param("end") int end);
	List<RestaurantDTO> getStoreList(@Param("start") int start, @Param("end") int end);
	List<RestaurantDTO> getStore(@Param("searchOption") String searchOption, @Param("keyword") String keyword,@Param("start") int start, @Param("end") int end);
	List<HashMap<String, Object>> getMemberList(@Param("searchOption") String searchOption, @Param("keyword") String keyword, @Param("start") int start, @Param("end") int end);
	int nameChk(String name);
	// paging 泥섎━ 
	List<HashMap<String,Object>> getBookingList(@Param("start") int start, @Param("end") int end);
	List<HashMap<String,Object>> getBooking(@Param("searchOption") String searchOption, @Param("keyword") String keyword, @Param("start") int start, @Param("end") int end);
	int bCancel(int no);
	RestaurantDTO getStoreInfo(int no);
	int addrChk(String addr);
	int updateResInfo(RestaurantDTO resdto);
	int allListCnt(Map<String, String> url);
}
