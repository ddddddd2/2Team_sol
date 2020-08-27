package kr.co.sol.custom.service;

import java.util.List;

import org.springframework.ui.Model;

import kr.co.sol.custom.dto.BookingDTO;
import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.dto.MyActDTO;
import kr.co.sol.custom.dto.QnaDTO;
import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;

public interface MemberService {
	int idCheck(String id);
	MemberDTO loginProc(MemberDTO mdto);
	int signUpProc(MemberDTO mdto);
	
	//리뷰에서 id로 mem_no 알아내기 위해 
	int getMemberNo(String idKey);
	MemberDTO loginPro(MemberDTO mdto);
	
//	Member
	List<MemberDTO> getMember();
//	Update
	int nickCheck(String nick_name);
	//Review
	List<ReviewDTO> getReviewList(Integer id);
	//Qna
	List<QnaDTO> getQnaList(Integer no);
//	List<QnaDTO> getQnaList(Integer id);
	//Favorite
	List<RestaurantDTO> getFavoriteList(Integer id);
	//Booking
	List<BookingDTO> getBookingList(Integer no);
//	Member
	MemberDTO getMemberList(Integer id);
	MemberDTO getMemberInfo(int no);
	int updateMember(String nick_name, String phone, String passwd, String id, String email);
	void getMyAct(Integer no, Model model);
	int emailCheck(String email, int no);
	int nick_nameCheck(String nick_name, int no);
//	int emailCheck(MemberDTO mdto);
	int phoneCheck(String phone, int no);
}
