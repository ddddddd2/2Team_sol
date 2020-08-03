package kr.co.sol.admin;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.store.dto.StoreDTO;

@Mapper
public interface AdminDAO {

	List<MemberDTO> getMember();

	List<StoreDTO> getStore();

	List<MemberDTO> getMemberList(String searchOption, String keyword);
}
