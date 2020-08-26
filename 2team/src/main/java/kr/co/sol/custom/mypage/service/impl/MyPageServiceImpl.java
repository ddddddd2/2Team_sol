package kr.co.sol.custom.mypage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.custom.mypage.dao.MyPageDAO;
import kr.co.sol.custom.mypage.service.MyPageService;
import kr.co.sol.custom.dto.BookingDTO;
import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.dto.QnaDTO;
import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	MyPageDAO myPageDao;

	@Override
	public int updateMember(String nick_name, String phone, String passwd, String id, String email) {
		System.out.println("impl에서 이름이 뭐니? "+nick_name);
		return myPageDao.updateMember(nick_name, phone, passwd, id, email);
	}

	@Override
	public int nickCheck(String nick_name) {
		// TODO Auto-generated method stub
		return myPageDao.nickCheck(nick_name);
	}

	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return myPageDao.emailCheck(email);
	}
	
//	Review
	@Override
	public List<ReviewDTO> getReviewList(String id) {
		// TODO Auto-generated method stub
		return myPageDao.getReviewList(id);
	}
//	Restaurant
	@Override
	public List<QnaDTO> getQnaList(String id) {
		return myPageDao.getQnaList(id);
	}
////	Favorite	
	@Override
	public List<RestaurantDTO> getFavoriteList(String id) {
		return myPageDao.getFavoriteList(id);
	}
//	Favorite	
//	Booking	
	@Override
	public List<BookingDTO> getBookingList(String id) {
		return myPageDao.getBookingList(id);
	}

	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return myPageDao.idCheck(id);
	}
	
	@Override
	public MemberDTO loginPro(MemberDTO mdto) {
		// TODO Auto-generated method stub
		return myPageDao.loginPro(mdto);
	}

//	Review
	@Override
	public List<ReviewDTO> getMyReviewList(Integer mem_no) {
		// TODO Auto-generated method stub
		return myPageDao.getMyReviewList(mem_no);
	}
//	Restaurant
	@Override
	public List<QnaDTO> getMyQnaList(Integer mem_no) {
		return myPageDao.getMyQnaList(mem_no);
	}
////	Favorite	
	@Override
	public List<RestaurantDTO> getMyFavoriteList(Integer mem_no) {
		return myPageDao.getMyFavoriteList(mem_no);
	}
//	Favorite	
//	Booking	
	@Override
	public List<BookingDTO> getMyBookingList(Integer mem_no) {
		return myPageDao.getMyBookingList(mem_no);
	}

	@Override
	public List<MemberDTO> getMemberList(String id) {
		// TODO Auto-generated method stub
		return myPageDao.getMemberList(id);
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
}
