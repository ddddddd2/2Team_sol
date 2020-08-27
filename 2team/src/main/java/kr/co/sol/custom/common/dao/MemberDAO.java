package kr.co.sol.custom.common.dao;

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

	// 가입
	int idCheck(String id);
	int nickCheck(String nick_name);
	int emailCheck(String email);
	int signUpProc(MemberDTO mdto);

	// 로그인
	MemberDTO loginPro(MemberDTO mdto);
	
	// 멤버 관련
	List<MemberDTO> getMemberList();
	MemberDTO getMemberInfo(Integer no);
	int updateMember(@Param("nick_name") String nick_name, @Param("phone") String phone, @Param("passwd") String passwd, @Param("id") String id, @Param("email") String email);
	
	
	List<RestaurantDTO> getFavoriteList(Integer id);
	List<BookingDTO> getBookingList(Integer id);
	List<QnaDTO> getQnaList(Integer id);
	List<ReviewDTO> getReviewList(Integer id);
	List<RestaurantDTO> getRestaurantList(Integer id);
	MyAct getMyAct(Integer no);
}