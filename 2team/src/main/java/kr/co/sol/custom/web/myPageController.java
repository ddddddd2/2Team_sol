package kr.co.sol.custom.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sol.common.dto.BookingDTO;
import kr.co.sol.common.dto.MemberDTO;
import kr.co.sol.common.dto.QnaDTO;
import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.common.dto.ReviewDTO;
import kr.co.sol.common.service.MemberService;
import kr.co.sol.etc.SecurityUtil;
import kr.co.sol.mypage.service.MyPageService;

@Controller
public class myPageController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MyPageService mypageService;
		
		
		// mypage
		@RequestMapping(value="/myPage")
		public String myPage(Model model, HttpServletRequest request, HttpServletResponse response,
				MemberDTO mdto) {
			
			HttpSession session = request.getSession();
			Integer no = (Integer)session.getAttribute("idKey");
			if(no == null) {
				return "/custom/login";
			} else {
			mypageService.getMyAct(no, model);
			// 예약 내역 조회하는 메소드
			List<HashMap<String, Object>> bdto2 = mypageService.getMyBookingList(no);
			System.out.println(bdto2);
			model.addAttribute("bdto", bdto2);
			
			// 리뷰 조회하는 메소드
			List<HashMap<String, Object>> rdto2 = mypageService.getMyReviewList(no);
			model.addAttribute("revdto",rdto2);
//			
			// 즐겨찾기 조회하는 메소드 실은  
			List<RestaurantDTO> fdto2 = mypageService.getMyFavoriteList(no);
			model.addAttribute("resdto", fdto2); 
			//session.setAttribute("mdto", mdto2);
			// 문의 조회하는 메소드
			List<QnaDTO> qdto2 = mypageService.getMyQnaList(no);  
			model.addAttribute("qdto", qdto2);
			
			System.out.println(session.getAttribute("idKey"));
			return "/custom/myPage";
			}
		}

		/* UpdateController 시작 */

//		수정 전 정보 가져오기
		@RequestMapping("/updateInfo")
		public String updateInfo(HttpServletRequest request, HttpServletResponse response, Model model, MemberDTO mdto) {
			HttpSession session = request.getSession();
			Integer no = (Integer) session.getAttribute("idKey");
			if(no==null) {
				return "/custom/index";
			} else {
			model.addAttribute("id", no);
			mypageService.getMyAct(no, model);
			} 
			return "/custom/updateInfo";
		}
		
		//	update 후 값을 가져오기
		@RequestMapping("/updateInfoPro")
		public String updateInfoPro(MemberDTO mdto, HttpServletRequest request, HttpServletResponse response, Model model) {
			String nick_name = request.getParameter("nick_name");
			String phone = request.getParameter("phone");	
			String passwd = request.getParameter("passwd");
			String email = request.getParameter("email");
			
			HttpSession session = request.getSession();
			
			Integer no = (Integer) session.getAttribute("idKey");
			
			SecurityUtil securityUtil = new SecurityUtil();
			passwd = securityUtil.encryptSHA256(passwd);
	
			
			int r = mypageService.updateMember(nick_name, phone, passwd, no, email);
			MemberDTO mdto2 = memberService.getMemberInfo(no);
			session.setAttribute("mdto", mdto2);
			String msg=null;
			if(r!=0) {
				msg = "수정 완료";
			} else if(r==0) {
				msg = "수정 실패";
			}
			model.addAttribute("msg", msg);
			return "redirect:/updateInfo";
		}/* UpdateController 끝 */
		
		/* ReviewController 시작 */

		
		@GetMapping("/myPageReview")
		public String myPageReview(HttpServletRequest request, MemberDTO mdto, HttpServletResponse response, Model model, ReviewDTO rdto) {
			HttpSession session = request.getSession();
			Integer no = (Integer)session.getAttribute("idKey");
			List<HashMap<String, Object>> rdto2 = mypageService.getMyReviewList(no);
			model.addAttribute("revdto",rdto2);
			mypageService.getMyAct(no, model);
			return "/custom/myPageReview";
		}
		/* ReviewController 끝 */
		/* QnaController 시작 */

		@GetMapping("/myPageQna")
		public String getQnaList(HttpServletRequest request, HttpServletResponse response, Model model, QnaDTO qdto) {
			HttpSession session = request.getSession();
			Integer no = (Integer)session.getAttribute("idKey");
			mypageService.getMyAct(no, model);
			List<QnaDTO> qdto2 = mypageService.getMyQnaList(no);  
			model.addAttribute("qdto", qdto2);
			System.out.println(session.getAttribute("idKey"));
			return "/custom/myPageQna";
		}
		/* QnaController 끝 */
		/* FavoriteController, restaurant 시작 */
		
		@GetMapping("/myPageFavorite")
		public String myPageFavorite(HttpServletRequest request, HttpServletResponse response, Model model) {
			HttpSession session = request.getSession();
			Integer no = (Integer)session.getAttribute("idKey");
			mypageService.getMyAct(no, model); /* member_bar 리뷰 즐겨찾기 예약 부분 */
			List<RestaurantDTO> resdto2 = mypageService.getMyFavoriteList(no);
			model.addAttribute("resdto", resdto2); 
			System.out.println(resdto2);
			return "/custom/myPageFavorite";
		}
		/* FavoriteController 끝 */
//		/* FavoriteController, restaurant 시작 */
	//	
//		@GetMapping("/myPageFavorite")
//		public String myPageFavorite(HttpServletRequest request, HttpServletResponse response, Model model) {
//			HttpSession session = request.getSession();
//			String id = (String)session.getAttribute("idKey");
//			List<FavoriteDTO> fdto2 = memberService.getFavoriteList(id);
//			System.out.println(id);
//			model.addAttribute("fdto", fdto2); 
//			return "/custom/myPageFavorite";
//		}
//		/* FavoriteController 끝 */
		
		@GetMapping("/myPageBooking")
		public String myPageBooking(HttpServletRequest request, HttpServletResponse response, Model model, BookingDTO bdto) {
			HttpSession session = request.getSession();
			Integer no = (Integer)session.getAttribute("idKey");
			List<HashMap<String, Object>> bdto2 = mypageService.getMyBookingList(no);
			
			System.out.println(bdto2);
			mypageService.getMyAct(no, model);
			model.addAttribute("bdto", bdto2);
			return "/custom/myPageBooking";
		}
	
//		@PostMapping("emailCheck")
//		public @ResponseBody int emailCheck(MemberDTO mdto) {
//			// 받아온 파라메터 email의 값으로 DB에서 검색해서 같은 값을 가진 친구들을 count 해주는 메소드
//			System.out.println(mdto+"dddddddd");
//			int r = memberService.emailCheck(mdto);
//			// r == 0 이면 중복되는 email이 없다
//			// r  > 0 이면 중복되는 email이 있다
//			return r;
//		}
		@PostMapping("emailCheck")
		public @ResponseBody int emailCheck(@RequestParam("email") String email, @RequestParam("no") int no) {
			// 받아온 파라메터 email의 값으로 DB에서 검색해서 같은 값을 가진 친구들을 count 해주는 메소드
			int r = mypageService.emailCheck(email, no);
			// r == 0 이면 중복되는 email이 없다
			// r > 0 이면 중복되는 email이 있다.
			return r;
		}
		@PostMapping("nick_nameCheck")
		public @ResponseBody int nick_nameCheck(@RequestParam("nick_name") String nick_name, @RequestParam("no") int no) {
			// 받아온 파라메터 email의 값으로 DB에서 검색해서 같은 값을 가진 친구들을 count 해주는 메소드
			System.out.println("nick:"+nick_name+"    no:"+no);
			int r = mypageService.nick_nameCheck(nick_name, no);
			// r == 0 이면 중복되는 email이 없다
			// r > 0 이면 중복되는 email이 있다.
			return r;
		}
		@PostMapping("phoneCheck")
		public @ResponseBody int phoneCheck(@RequestParam("phone") String phone, @RequestParam("no") int no) {
			// 받아온 파라메터 email의 값으로 DB에서 검색해서 같은 값을 가진 친구들을 count 해주는 메소드
			int r = mypageService.phoneCheck(phone, no);
			// r == 0 이면 중복되는 email이 없다
			// r > 0 이면 중복되는 email이 있다.
			return r;
		}
}
