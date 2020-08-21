package kr.co.sol.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.booking.dto.BookingDTO;
import kr.co.sol.favorite.dto.FavoriteDTO;
import kr.co.sol.member.dao.MemberDAO;
import kr.co.sol.member.dto.MemberDTO;
import kr.co.sol.member.service.MemberService;
import kr.co.sol.qna.dto.QnaDTO;
import kr.co.sol.restaurant.dto.RestaurantDTO;
import kr.co.sol.review.dto.ReviewDTO;
//import kr.co.sol.review.service.impl.ReviewDAO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
//	Member
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
		System.out.println("impl:::::"+mdto);
		return memberDao.loginProc(mdto);
	}

	@Override
	public int signUpProc(MemberDTO mdto) {
		// TODO Auto-generated method stub
		return memberDao.signUpProc(mdto);
	}
	
//  Update

	@Override
	public MemberDTO getMemberInfo(String id) {
		// TODO Auto-generated method stub
		return memberDao.getMemberInfo(id);
	}

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

	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return memberDao.emailCheck(email);
	}
	
//	Review
	@Override
	public List<ReviewDTO> getReviewList(String id) {
		// TODO Auto-generated method stub
		return memberDao.getReviewList(id);
	}
//	Restaurant
	@Override
	public List<QnaDTO> getQnaList(String id) {
		return memberDao.getQnaList(id);
	}
////	Favorite	
	@Override
	public List<RestaurantDTO> getFavoriteList(String id) {
		return memberDao.getFavoriteList(id);
	}
//	Favorite	
//	Booking	
	@Override
	public List<BookingDTO> getBookingList(String id) {
		return memberDao.getBookingList(id);
	}

	@Override
	public List<MemberDTO> getMemberList(String id) {
		// TODO Auto-generated method stub
		return memberDao.getMemberList(id);
	}

	@Override
	public List<MemberDTO> getMember() {
		// TODO Auto-generated method stub
		return null;
	}


}
