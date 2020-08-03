package kr.co.sol.custom.service;

import kr.co.sol.custom.dto.MemberDTO;

public interface MemberService {
	int idCheck(String id);
	MemberDTO loginProc(MemberDTO mdto);
}
