package kr.co.sol.custom.common.service;


import kr.co.sol.custom.dto.MemberDTO;

public interface MemberService {
	int idCheck(String id);
	MemberDTO loginProc(MemberDTO mdto);
	int signUpProc(MemberDTO mdto);
	
	//리뷰에서 id로 mem_no 알아내기 위해 
	int getMemberNo(String idKey);
	MemberDTO loginPro(MemberDTO mdto);
	
}
