package kr.co.sol.custom.mypage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
	public List<ReviewDTO> getMyReviewList(Integer mem_no) {
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
	public List<BookingDTO> getMyBookingList(Integer mem_no) {
		return myPageDao.getMyBookingList(mem_no);
	}

	@Override
	public void getMyAct(Integer no, Model model) {
		
	}

}
