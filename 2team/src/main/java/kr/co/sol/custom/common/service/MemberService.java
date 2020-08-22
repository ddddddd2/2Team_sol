package kr.co.sol.custom.common.service;


import kr.co.sol.custom.dto.MemberDTO;

public interface MemberService {
	int idCheck(String id);
	MemberDTO loginProc(MemberDTO mdto);
	int signUpProc(MemberDTO mdto);
	
	//리뷰에서 id로 mem_no 알아내기 위해 
	int getMemberNo(String idKey);

	// 세션에 담겨있는 idKey(mem_no)로 해당 회원정보 얻어오는 메소드
	MemberDTO getMemberInfo(Integer mem_no);
	
	MemberDTO loginPro(MemberDTO mdto);
	
}
