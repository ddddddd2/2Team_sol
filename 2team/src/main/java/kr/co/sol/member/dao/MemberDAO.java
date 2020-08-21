package kr.co.sol.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.sol.booking.dto.BookingDTO;
import kr.co.sol.favorite.dto.FavoriteDTO;
import kr.co.sol.member.dto.MemberDTO;
import kr.co.sol.qna.dto.QnaDTO;
import kr.co.sol.restaurant.dto.RestaurantDTO;
import kr.co.sol.review.dto.ReviewDTO;

@Mapper
public interface MemberDAO {
//	MemberDAO
	int idCheck(String id);
	MemberDTO loginProc(MemberDTO mdto);
	int signUpProc(MemberDTO mdto);
	List<MemberDTO> getMember();
	//	Update
	// 회원 번호로 조회한 회원 정보 가져오기.
	MemberDTO getMemberInfo(String id); 
	// 회원 번호로 해당 회원 정보 수정
	int updateMember(@Param("nick_name") String nick_name, @Param("phone") String phone, @Param("passwd") String passwd, @Param("id") String id, @Param("email") String email);
	int nickCheck(String nick_name);
	int emailCheck(String email);
////	FavoriteDAO
	List<RestaurantDTO> getFavoriteList(String id);
//  BookingDAO
	List<BookingDTO> getBookingList(String id);
//	QnaDAO
	List<QnaDTO> getQnaList(String id);
//  ReviewDAO
	List<ReviewDTO> getReviewList(String id);
	//Restaurant
	List<RestaurantDTO> getRestaurantList(String id);
	//Restaurant
	List<MemberDTO> getMemberList(String id);
}
