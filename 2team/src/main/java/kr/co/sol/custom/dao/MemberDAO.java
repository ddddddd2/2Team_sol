package kr.co.sol.custom.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import kr.co.sol.custom.dto.BookingDTO;
import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.dto.MyAct;
import kr.co.sol.custom.dto.QnaDTO;
import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;

@Mapper
public interface MemberDAO {
//	MemberDAO
	int idCheck(String id);
	MemberDTO loginProc(MemberDTO mdto);
	int signUpProc(MemberDTO mdto);
	int getMemberNo(String idKey);
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
	List<RestaurantDTO> getFavoriteList(Integer id);
//  BookingDAO
	List<BookingDTO> getBookingList(Integer id);
//	QnaDAO
	List<QnaDTO> getQnaList(Integer id);
//  ReviewDAO
	List<ReviewDTO> getReviewList(Integer id);
	//Restaurant
	List<RestaurantDTO> getRestaurantList(Integer id);
	//Restaurant
	MemberDTO getMemberList(Integer id);
	MyAct getMyAct(Integer no);
	
	

}