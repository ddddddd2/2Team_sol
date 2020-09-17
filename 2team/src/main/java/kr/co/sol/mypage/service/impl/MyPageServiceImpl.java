package kr.co.sol.mypage.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.sol.common.dto.BookingDTO;
import kr.co.sol.common.dto.MyActDTO;
import kr.co.sol.common.dto.QnaDTO;
import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.common.dto.ReviewDTO;
import kr.co.sol.mypage.dao.MyPageDAO;
import kr.co.sol.mypage.service.MyPageService;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	MyPageDAO myPageDao;

	@Override
	public List<HashMap<String, Object>> getMyReviewList(Integer mem_no) {
		return myPageDao.getMyReviewList(mem_no);
	}

	@Override
	public List<QnaDTO> getMyQnaList(Integer mem_no) {
		return myPageDao.getMyQnaList(mem_no);
	}

	@Override
	public List<RestaurantDTO> getMyFavoriteList(Integer mem_no) {
		return myPageDao.getMyFavoriteList(mem_no);
	}

	@Override
	public List<HashMap<String, Object>> getMyBookingList(Integer mem_no) {
		return myPageDao.getMyBookingList(mem_no);
	}

	@Override
	public void getMyAct(Integer no, Model model) {
		MyActDTO myAct = myPageDao.getMyAct(no);
		model.addAttribute("myAct", myAct);
	}
	
	@Override
	public int emailCheck(String email, int no) {
		return myPageDao.emailCheck(email, no);
	}

	@Override
	public int nick_nameCheck(String nick_name, int no) {
		return myPageDao.nick_nameCheck(nick_name, no);
	}

	@Override
	public int phoneCheck(String phone, int no) {
		// TODO Auto-generated method stub
		return myPageDao.phoneCheck(phone, no);
	}
	
	@Override
	public int updateMember(String nick_name, String phone, String passwd, Integer no, String email) {
		return myPageDao.updateMember(nick_name, phone, passwd, no, email);
	}
}
