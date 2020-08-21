package kr.co.sol.custom.mypage.service;

import java.util.List;

import kr.co.sol.custom.dto.BookingDTO;
import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.dto.QnaDTO;
import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;

public interface MyPageService {
	int idCheck(String id);
	MemberDTO loginPro(MemberDTO mdto);
	
//	Member
	List<MemberDTO> getMember();
//	Update
	int nickCheck(String nick_name);
	int emailCheck(String email);
	//Review
	List<ReviewDTO> getReviewList(String id);
	//Qna
	List<QnaDTO> getQnaList(String id);
//	//Favorite
	List<RestaurantDTO> getFavoriteList(String id);
	//Booking
	List<BookingDTO> getBookingList(String id);
//	Member
	List<MemberDTO> getMemberList(String id);
	MemberDTO getMemberInfo(int no);
	int updateMember(String nick_name, String phone, String passwd, String id, String email);
}
