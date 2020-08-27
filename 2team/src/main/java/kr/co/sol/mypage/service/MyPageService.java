package kr.co.sol.mypage.service;

import java.util.List;

import org.springframework.ui.Model;

import kr.co.sol.common.dto.BookingDTO;
import kr.co.sol.common.dto.QnaDTO;
import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.common.dto.ReviewDTO;

public interface MyPageService {
	//해당 회원이 남긴 리뷰 조회
	List<ReviewDTO> getMyReviewList(Integer mem_no);
	//해당 회원의 1:1문의 조회
	List<QnaDTO> getMyQnaList(Integer mem_no);
//	//해당 회원의 즐겨찾기 조회
	List<RestaurantDTO> getMyFavoriteList(Integer mem_no);
	//해당 회원의 예약정보 조회
	List<BookingDTO> getMyBookingList(Integer mem_no);
	  // 기덕이꺼
	void getMyAct(Integer no, Model model);
	int updateMember(String nick_name, String phone, String passwd, String id, String email);
	int emailCheck(String email, int no);
	int nick_nameCheck(String nick_name, int no);
	int phoneCheck(String phone, int no);

}