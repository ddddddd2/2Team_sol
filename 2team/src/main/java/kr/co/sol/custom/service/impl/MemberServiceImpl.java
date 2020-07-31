package kr.co.sol.custom.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.custom.dao.MemberDAO;
import kr.co.sol.custom.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDao;
	
	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return memberDao.idCheck(id);
	}
	
}
