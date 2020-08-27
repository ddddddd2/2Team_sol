package kr.co.sol.custom.common.service.impl;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.custom.common.dao.MemberDAO;
import kr.co.sol.custom.common.service.MemberService;
import kr.co.sol.custom.dto.MemberDTO;

@Service("kr.co.sol.custom.common.service.MemberService")
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

	@Override
	public int updateMember(String nick_name, String phone, String passwd, String id, String email) {
		return memberDao.updateMember(nick_name, phone, passwd, id, email);
	}

	@Override
	public Integer getIdKey(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Integer idKey = (Integer)session.getAttribute("idKey");
		if(idKey == null) {
			return 0;
		}
		return idKey;
	}
}
