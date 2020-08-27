package kr.co.sol.custom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.sol.custom.dao.MemberDAO;
import kr.co.sol.custom.dto.BookingDTO;
import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.dto.MyActDTO;
import kr.co.sol.custom.dto.QnaDTO;
import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;
import kr.co.sol.custom.service.MemberService;

@Service("MemberService")
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
	
	
//  Update

	@Override
	public int updateMember(String nick_name, String phone, String passwd, String id, String email) {
		System.out.println("impl에서 이름이 뭐니? "+nick_name);
		return memberDao.updateMember(nick_name, phone, passwd, id, email);
	}

	@Override
	public int nickCheck(String nick_name) {
		// TODO Auto-generated method stub
		return memberDao.nickCheck(nick_name);
	}


	
//	Review
	@Override
	public List<ReviewDTO> getReviewList(Integer id) {
		// TODO Auto-generated method stub
		return memberDao.getReviewList(id);
	}
//	Restaurant
	@Override
	public List<QnaDTO> getQnaList(Integer id) {
		return memberDao.getQnaList(id);
	}
////	Favorite	
	@Override
	public List<RestaurantDTO> getFavoriteList(Integer id) {
		return memberDao.getFavoriteList(id);
	}
//	Favorite	
//	Booking	
	@Override
	public List<BookingDTO> getBookingList(Integer id) {
		return memberDao.getBookingList(id);
	}

	@Override
	public MemberDTO getMemberList(Integer id) {
		// TODO Auto-generated method stub
		return memberDao.getMemberList(id);
	}

	@Override
	public List<MemberDTO> getMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO getMemberInfo(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void getMyAct(Integer no, Model model) {
		System.out.println("no::::"+no);
		MyActDTO myAct = memberDao.getMyAct(no);
		model.addAttribute("myAct", myAct);
		System.out.println("serviceImpl::"+myAct);
	}
	
//	@Override
//	public int emailCheck(MemberDTO mdto) {
//		// TODO Auto-generated method stub
//		return memberDao.emailCheck(mdto);
//	}
	
	@Override
	public int emailCheck(String email, int no) {
		return memberDao.emailCheck(email, no);
	}

	@Override
	public int nick_nameCheck(String nick_name, int no) {
		return memberDao.nick_nameCheck(nick_name, no);
	}

	@Override
	public int phoneCheck(String phone, int no) {
		// TODO Auto-generated method stub
		return memberDao.phoneCheck(phone, no);
	}
}