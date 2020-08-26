package kr.co.sol.custom.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.custom.common.service.MemberService;
import kr.co.sol.custom.dao.MemberDAO;
import kr.co.sol.custom.dto.MemberDTO;

@Service("kr.co.sol.custom.common.service.MemberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDao;
	
	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return memberDao.idCheck(id);
	}

	@Override
	public MemberDTO loginProc(MemberDTO mdto) {
		// TODO Auto-generated method stub
		return memberDao.loginProc(mdto);
	}

	@Override
	public int signUpProc(MemberDTO mdto) {
		// TODO Auto-generated method stub
		return memberDao.signUpProc(mdto);
	}

	@Override
	public int getMemberNo(String idKey) {
		// TODO Auto-generated method stub
		return memberDao.getMemberNo(idKey);
	}

	@Override
	public MemberDTO loginPro(MemberDTO mdto) {
		// TODO Auto-generated method stub
		return memberDao.loginPro(mdto);
	}
//	Member

	@Override
	public MemberDTO getMemberInfo(Integer mem_no) {
		// TODO Auto-generated method stub
		return memberDao.getMemberInfo(mem_no);
	}

}
