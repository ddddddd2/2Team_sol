package kr.co.sol.custom.common.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.custom.dto.MemberDTO;


@Mapper
public interface MemberDAO {
//	MemberDAO
	int idCheck(String id);
	MemberDTO loginProc(MemberDTO mdto);
	int signUpProc(MemberDTO mdto);
	int getMemberNo(String idKey);
	MemberDTO loginPro(MemberDTO mdto);


}