package kr.co.sol.custom.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.custom.dto.MemberDTO;

@Mapper
public interface MemberDAO {
	MemberDTO getMembers();
}
