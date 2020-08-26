package kr.co.sol.admin;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.sol.custom.dto.MemberDTO;
<<<<<<< HEAD
import kr.co.sol.custom.dto.RestaurantDTO;

@Mapper
public interface AdminDAO {

	List<HashMap<String, Object>> getMember();

	List<RestaurantDTO> getStoreList();

	List<RestaurantDTO> getStore(String searchOption, String keyword);
=======
import kr.co.sol.custom.dto.StoreDTO;

@Mapper
public interface AdminDAO {

	List<HashMap<String, Object>> getMember();

	List<StoreDTO> getStore();
>>>>>>> refs/heads/mypage

	List<HashMap<String, Object>> getMemberList(@Param("searchOption") String searchOption, @Param("keyword") String keyword);

	MemberDTO login(String id, String passwd);

	String login2(MemberDTO mdto);

	MemberDTO loginPro(MemberDTO mdto)
	;
}
