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
	//해당 회원이 남긴 리뷰 조회
	List<ReviewDTO> getMyReviewList(Integer mem_no);
	//해당 회원의 1:1문의 조회
	List<QnaDTO> getMyQnaList(Integer mem_no);
//	//해당 회원의 즐겨찾기 조회
	List<RestaurantDTO> getMyFavoriteList(Integer mem_no);
	//해당 회원의 예약정보 조회
	List<BookingDTO> getMyBookingList(Integer mem_no);
//	Member
	List<MemberDTO> getMemberList(String id);

	int updateMember(String nick_name, String phone, String passwd, String id, String email);
}
