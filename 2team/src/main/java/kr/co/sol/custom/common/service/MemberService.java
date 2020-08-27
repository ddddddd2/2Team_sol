package kr.co.sol.custom.common.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.sol.custom.dto.MemberDTO;


public interface MemberService {
	
  // 세션 처리
    Integer getIdKey(HttpServletRequest request);
  // 가입  처리
	
	int idCheck(String id);
	int nickCheck(String nick_name);
	int emailCheck(String email);
	int signUpProc(MemberDTO mdto);

  // 로그인 처리
	MemberDTO loginPro(MemberDTO mdto);
	
  // member 관련 
	List<MemberDTO> getMemberList();
	MemberDTO getMemberInfo(Integer no);
	int updateMember(String nick_name, String phone, String passwd, String id, String email);
	

	
}
