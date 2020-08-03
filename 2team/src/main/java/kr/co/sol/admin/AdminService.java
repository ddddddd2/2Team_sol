package kr.co.sol.admin;

import java.util.List;

import kr.co.sol.custom.dto.MemberDTO;

public interface AdminService {
	List<MemberDTO> getMember();


	List<MemberDTO> getMemberList(String searchOption, String keyword);
}
