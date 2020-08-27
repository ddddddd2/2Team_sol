package kr.co.sol.mypage.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.sol.common.dto.BookingDTO;
import kr.co.sol.common.dto.MemberDTO;
import kr.co.sol.common.dto.MyActDTO;
import kr.co.sol.common.dto.QnaDTO;
import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.common.dto.ReviewDTO;

@Mapper
public interface MyPageDAO {
	int updateMember(@Param("nick_name") String nick_name, @Param("phone") String phone, @Param("passwd") String passwd, @Param("no") Integer no, @Param("email") String email);
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
	// 회원 번호로 해당 회원 정보 수정
	List<ReviewDTO> getMyReviewList(Integer mem_no);
	List<QnaDTO> getMyQnaList(Integer mem_no);
	List<RestaurantDTO> getMyFavoriteList(Integer mem_no);
	List<BookingDTO> getMyBookingList(Integer mem_no);
	int emailCheck(@Param(value = "email") String email, @Param(value="no") int no);
	int nick_nameCheck(@Param(value = "nick_name") String nick_name, @Param(value="no") int no);
	int phoneCheck(@Param(value = "phone") String phone, @Param(value="no") int no);
	MyActDTO getMyAct(Integer no);
}