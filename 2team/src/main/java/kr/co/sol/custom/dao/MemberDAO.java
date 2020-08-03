package kr.co.sol.custom.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.custom.dto.MemberDTO;

@Mapper
public interface MemberDAO {
	int idCheck(String id);
	MemberDTO loginProc(MemberDTO mdto);
	int signUpProc(MemberDTO mdto);
}
