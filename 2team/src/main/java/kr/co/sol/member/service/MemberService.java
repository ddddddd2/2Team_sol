package kr.co.sol.member.service;

import java.util.List;

import kr.co.sol.booking.dto.BookingDTO;
import kr.co.sol.favorite.dto.FavoriteDTO;
import kr.co.sol.member.dto.MemberDTO;
import kr.co.sol.qna.dto.QnaDTO;
import kr.co.sol.restaurant.dto.RestaurantDTO;
import kr.co.sol.review.dto.ReviewDTO;

public interface MemberService {
//	Member
	int idCheck(String id);
	MemberDTO loginProc(MemberDTO mdto);
	int signUpProc(MemberDTO mdto);
	List<MemberDTO> getMember();
//	Update
	MemberDTO getMemberInfo(String id);
	int updateMember(String nick_name, String phone, String passwd, String id, String email);
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

}
