package kr.co.sol.common.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.common.dto.MemberDTO;

@Mapper
public interface MemberDAO {

	// 가입
	int idCheck(String id);
	int nickCheck(String nick_name);
	int emailCheck(String email);
	int signUpProc(MemberDTO mdto);

	// 로그인
	MemberDTO loginPro(MemberDTO mdto);
	
	// 멤버 관련
	List<MemberDTO> getMemberList();
	MemberDTO getMemberInfo(Integer no);
}