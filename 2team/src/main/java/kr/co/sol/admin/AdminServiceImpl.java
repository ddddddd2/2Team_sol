package kr.co.sol.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.custom.dto.MemberDTO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDao;
	@Override
	public List<MemberDTO> getMember() {
		return adminDao.getMember();
	}
	@Override
	public List<MemberDTO> getMemberList(@Param("searchOption") String searchOption, @Param("keyword") String keyword) {
		// TODO Auto-generated method stub
		return adminDao.getMemberList(searchOption, keyword);
	}
}
