package kr.co.sol.custom.mypage.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import kr.co.sol.custom.dto.BookingDTO;
import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.dto.MyActDTO;
import kr.co.sol.custom.dto.QnaDTO;
import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;

@Mapper
public interface MyPageDAO {
	int idCheck(String id);
	MemberDTO loginPro(MemberDTO mdto);
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
	// 회원 번호로 해당 회원 정보 수정
	List<ReviewDTO> getMyReviewList(Integer mem_no);
	List<QnaDTO> getMyQnaList(Integer mem_no);
	List<RestaurantDTO> getMyFavoriteList(Integer mem_no);
	List<BookingDTO> getMyBookingList(Integer mem_no);
	int emailCheck(@Param(value = "email") String email, @Param(value="no") int no);
	int nick_nameCheck(@Param(value = "nick_name") String nick_name, @Param(value="no") int no);
	int phoneCheck(@Param(value = "phone") String phone, @Param(value="no") int no);

}