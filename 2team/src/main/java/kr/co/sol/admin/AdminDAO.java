package kr.co.sol.admin;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.sol.common.dto.MemberDTO;
import kr.co.sol.common.dto.RestaurantDTO;

@Mapper
public interface AdminDAO {

	List<HashMap<String, Object>> getMember();
	List<RestaurantDTO> getStoreList(@Param("startPage") int startPage, @Param("endPage") int endPage);
	List<RestaurantDTO> getStore(@Param("searchOption") String searchOption, @Param("keyword") String keyword, @Param("curPage") int curPage);
	List<HashMap<String, Object>> getMemberList(String searchOption, String keyword);
	MemberDTO login(String id, String passwd);
	String login2(MemberDTO mdto);
	MemberDTO loginPro(MemberDTO mdto);
	int nameChk(String name);
	// paging 처리 
	int allList(); // 전체 리스트 갯수 가져오기.
	int getStoreListCnt();
}
