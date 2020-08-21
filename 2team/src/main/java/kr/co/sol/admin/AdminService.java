package kr.co.sol.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.sol.custom.dto.MemberDTO;

public interface AdminService {
	List<HashMap<String, Object>> getMember();


	List<HashMap<String, Object>> getMemberList(@Param("searchOption") String searchOption, @Param("keyword") String keyword);


	MemberDTO login(String id, String passwd);


	String login2(MemberDTO mdto);


	MemberDTO loginPro(MemberDTO mdto);
}
