package kr.co.sol.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.sol.custom.dto.MemberDTO;

public interface AdminService {
	List<MemberDTO> getMember();


	List<MemberDTO> getMemberList(@Param("searchOption") String searchOption, @Param("keyword") String keyword);
}
