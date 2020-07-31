package kr.co.sol.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import kr.co.sol.custom.dto.MemberDTO;

@Mapper
public interface AdminDAO {

	List<MemberDTO> getMember();	
}
