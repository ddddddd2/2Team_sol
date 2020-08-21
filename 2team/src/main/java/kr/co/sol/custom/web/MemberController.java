package kr.co.sol.custom.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sol.custom.dto.BookingDTO;
import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.dto.QnaDTO;
import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;
import kr.co.sol.custom.service.MemberService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	// index page(main page)
	@RequestMapping(value="/")
	public String index(HttpServletRequest request, Model model, HttpServletResponse response) {
		
		/* 굳이 할필요 없을듯... 
		 * HttpSession session = request.getSession(); String idKey =
		 * (String)session.getAttribute("idKey"); session.setAttribute("idKey", idKey);
		 */
		 
		return "index";
	}
	
	// login page
	@RequestMapping(value="/custom/login")
	public String login(HttpServletRequest res) {
		
		return "/custom/login";
	}
	
	@PostMapping(value="/loginPro")
	public @ResponseBody int loginPro(HttpServletRequest request, MemberDTO mdto, HttpSession session) {
		mdto = memberService.loginPro(mdto);
		if(mdto==null) {
			return 0; // 아이디 비밀번호 조회가 실패
		}
		if("admin".equals(mdto.getRole())) {
			return 1; // 로그인한 아이디가 어드민 계정일 경우
		}
		request.getSession();
		session.setAttribute("idKey", mdto.getNo());
		return 2;
	}
	
//	// login process
//	@RequestMapping(value="/custom/loginProc")
//	public String loginProc(HttpServletRequest request, Model model, HttpServletResponse response,
//			MemberDTO mdto) {
//		
//		mdto = memberService.loginProc(mdto); 
//	    HttpSession session = request.getSession();
//		String mem_id= null;
//		String url="/";
//		
//		// 일치하는 아이디와 비밀번호가 있는경우 
//		if(mdto != null)
//		{
//			mem_id = mdto.getId(); // member의 id가져오고 
//			if(mdto.getRole().equals("admin")) // 역활이 admin 이라면 
//			{
//				session.setAttribute("adminDTO", mdto); // admin 세션을 추가
//			}else {
//				session.setAttribute("userDTO", mdto); // user 세션을 추가 
//			}
//		}
//		
//		// 로그인에 처리하지 못하였을 때 
//		if(mem_id == null) {
//			model.addAttribute("msg","id 또는 passwd 가 일치하지 않습니다. ");
//			url = "/custom/login";
//		}
//		else {
//			model.addAttribute("msg","로그인에 성공하였습니다. ");
//			session.setAttribute("idKey", mem_id);
//		}
//		
//		model.addAttribute("url",url);
//			
//		return "/custom/msgPage";
//	}
	
	
	// mypage2
	@RequestMapping(value="/custom/myPage2")
	public String myPage2(HttpServletRequest request, HttpServletResponse response,
			MemberDTO mdto) {
		
		return "/custom/myPage2";
	}
	
		
		// logout process
		@RequestMapping(value="/custom/logout")
		public String logout(HttpServletRequest request) {
			
			HttpSession session = request.getSession();
//			session.removeAttribute("idKey");
			session.invalidate();//세션 취소, 또는 초기화
			return "redirect:/"; 
		}
		
		// signUp page(회원가입 page)
		@RequestMapping(value="/custom/signUp")
		public String memSignUp(HttpServletRequest request, Model model, HttpServletResponse response) {
			
			return "/custom/signUp";
		}
		
		// signUp process 
		@RequestMapping(value="/custom/signUpProc")
		public String memSignUpProc(HttpServletRequest request, Model model, HttpServletResponse response,
				MemberDTO mdto) {
			
			int r = memberService.signUpProc(mdto);
			String url = "/";
			if(r > 0 )
				model.addAttribute("msg","회원가입에 성공하셧습니다.");
			else {
				model.addAttribute("msg","회원가입에 실패하셧습니다.");
				url = "/custom/signUp";
			}
			
			model.addAttribute("url", url);
			
			return "/custom/msgPage";
		}
		
		// idcheck ajax process 
		@RequestMapping(value = "/idCheck")
		@ResponseBody()
		public Map<String,Object> idCheck(@RequestBody String id, MemberDTO mdto) {
			System.out.println("아이디 체크 시작");
			int cnt = 0;
			if(id != null)
			{
				cnt = memberService.idCheck(id);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("cnt", cnt);
			return map;
		}
		
		// nick_name check ajax process 
		@RequestMapping(value = "/nickCheck")
		@ResponseBody()
		public Map<String,Object> nickCheck(@RequestBody String nick_name, MemberDTO mdto) throws UnsupportedEncodingException {
			int cnt = 0;
			String test = URLDecoder.decode(nick_name,"UTF-8");
			String nick_name2 = test.substring(10);
			if(nick_name2 != null)
			{
				cnt = memberService.nickCheck(nick_name2);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("cnt", cnt);
			return map;
		}
		
		// email check ajax process 
		@RequestMapping(value = "/emailCheck")
		@ResponseBody()
		public Map<String,Object> emailCheck(@RequestBody String email, MemberDTO mdto) throws UnsupportedEncodingException {
			int cnt = 0;
			email = URLDecoder.decode(email);
			email = email.substring(6);
			System.out.println(email);
			if(email != null)
			{
				cnt = memberService.emailCheck(email);
				System.out.println("널입니다");
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("cnt", cnt);
			return map;
		}
		
		
		// mypage
		@RequestMapping(value="/myPage")
		public String myPage(Model model, HttpServletRequest request, HttpServletResponse response,
				MemberDTO mdto) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("idKey");
			if(id == null) {
				return "/custom/login";
			} else {
			mdto.setEmail("rlejrrlejr@gmail.com");
			// 예약 내역 조회하는 메소드
			List<BookingDTO> bdto2 = memberService.getBookingList(id); 
			model.addAttribute("bdto", bdto2);
			// 리뷰 조회하는 메소드
			List<ReviewDTO> rdto2 = memberService.getReviewList(id);
			model.addAttribute("rdto",rdto2);
//			// 즐겨찾기 조회하는 메소드
			List<RestaurantDTO> fdto2 = memberService.getFavoriteList(id);
			model.addAttribute("fdto", fdto2); 
			System.out.println(fdto2);
//			List<MemberDTO> mdto2 = memberService.getMember(); 
//			model.addAttribute("mdto", mdto2);
			List<MemberDTO> mdto2 = memberService.getMemberList(id); 
			model.addAttribute("mdto", mdto2.get(0));
			//session.setAttribute("mdto", mdto2);
			// 문의 조회하는 메소드
			List<QnaDTO> qdto2 = memberService.getQnaList(id);  
			model.addAttribute("qdto", qdto2);
			return "/custom/myPage";
			}
		}

		/* UpdateController 시작 */

//		수정 전 정보 가져오기
		@RequestMapping("/updateInfo")
		public String updateInfo(HttpServletRequest request, HttpServletResponse response, Model model, MemberDTO mdto) {
			
			HttpSession session = request.getSession();
			int no = (int) session.getAttribute("idKey");
			System.out.println("세션 아이디"+no);
			model.addAttribute("id", no);
			MemberDTO mdto2 = memberService.getMemberInfo(no);
			session.setAttribute("mdto", mdto2);
			System.out.println(mdto2.getNick_name());
			return "custom/updateInfo";
		}
		
		//	update 후 값을 가져오기
		@RequestMapping("/updateInfoPro")
		public String updateInfoPro(HttpServletRequest request, HttpServletResponse response, Model model) {
			String nick_name = request.getParameter("nick_name");
			String phone = request.getParameter("phone");	
			System.out.println("phone::"+phone);
			System.out.println("nick_name::"+nick_name);
			String passwd = request.getParameter("wUserPW");
			
			String email = request.getParameter("email");
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("idKey");
			int r = memberService.updateMember(nick_name, phone, passwd, id, email);
			
			String msg=null;
			if(r!=0) {
				msg = "수정 완료";
				System.out.println("정보가 수정되었습니다");
			} else if(r==0) {
				msg = "수정 실패";
				System.out.println("정보 수정에 실패했습니다.");
			}
			model.addAttribute("msg", msg);
			return "redirect:/updateInfo";
		}/* UpdateController 끝 */
		
		/* ReviewController 시작 */

		
		@GetMapping("/myPageReview")
		public String myPageReview(HttpServletRequest request, MemberDTO mdto, HttpServletResponse response, Model model, ReviewDTO rdto) {
			HttpSession session = request.getSession();
			System.out.println(session.getAttribute("idKey"));
			String id = (String)session.getAttribute("idKey");
			System.out.println("id="+id);
			System.out.println("rdto="+rdto);
			List<ReviewDTO> rdto2 = memberService.getReviewList(id);
			model.addAttribute("rdto",rdto2);
			System.out.println(rdto2);
			return "/custom/myPageReview";
		}
		/* ReviewController 끝 */
		/* QnaController 시작 */

//		@GetMapping("/myPageQna")
//		public String getQnaList(HttpServletRequest request, HttpServletResponse response, Model model, QnaDTO qdto) {
//			HttpSession session = request.getSession();
//			String id = (String)session.getAttribute("idKey");
//			List<QnaDTO> qdto2 = memberService.getQnaList(id);  
//			model.addAttribute("qdto", qdto2);
//			System.out.println(qdto2);
//			return "/custom/myPageQna";
//		}
		/* QnaController 끝 */
		/* FavoriteController, restaurant 시작 */
		
		@GetMapping("/myPageFavorite")
		public String myPageFavorite(HttpServletRequest request, HttpServletResponse response, Model model) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("idKey");
			List<RestaurantDTO> resdto2 = memberService.getFavoriteList(id);
			model.addAttribute("resdto", resdto2); 
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
			String id = (String)session.getAttribute("idKey");
			List<BookingDTO> bdto2 = memberService.getBookingList(id); 
			model.addAttribute("bdto", bdto2);
			return "/custom/myPageBooking";
		}
	
	
}
