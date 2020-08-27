package kr.co.sol.common.service.impl;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.common.dao.MemberDAO;
import kr.co.sol.common.dto.MemberDTO;
import kr.co.sol.common.service.MemberService;

@Service("kr.co.sol.common.service.MemberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDao;

	@Override
	public int idCheck(String id) {
		return memberDao.idCheck(id);
	}
	@Override
	public int nickCheck(String nick_name) {
		return memberDao.nickCheck(nick_name);
	}

	@Override
	public int emailCheck(String email) {
		return memberDao.emailCheck(email);
	}

	@Override
	public int signUpProc(MemberDTO mdto) {
		return memberDao.signUpProc(mdto);
	}

	@Override
	public MemberDTO loginPro(MemberDTO mdto) {
		
		return memberDao.loginPro(mdto);
	}

	@Override
	public List<MemberDTO> getMemberList() {
		return memberDao.getMemberList();
	}

	@Override
	public MemberDTO getMemberInfo(Integer no) {
		return memberDao.getMemberInfo(no);
	}

	public Integer getIdKey(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer idKey = (Integer)session.getAttribute("idKey");
		if(idKey == null) {
			return 0;
		}
		return idKey;
	}
}
