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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sol.custom.dto.BookingDTO;
import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.dto.MyActDTO;
import kr.co.sol.custom.dto.QnaDTO;
import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;
import kr.co.sol.custom.service.MemberService;

@Controller
public class myPageController {
	private static final Logger logger = LoggerFactory.getLogger(myPageController.class);
	
	@Autowired
	MemberService memberService;
	
	// index page(main page)
	@RequestMapping(value="/")
	public String index(HttpServletRequest request, Model model, HttpServletResponse response) {
		
		/* 굳이 할필요 없을듯... 
		 * HttpSession session = request.getSession(); String idKey =
		 * (String)session.getAttribute("idKey"); session.setAttribute("idKey", idKey);
		 */
		 
		return "/custom/index";
	}
	
	// login page
	@RequestMapping(value="/custom/login")
	public String login(HttpServletRequest res) {
		
		return "/custom/login";
	}
	
	@PostMapping(value="/loginPro")
	public @ResponseBody int loginPro(HttpServletRequest request, MemberDTO mdto, HttpSession session) {
		mdto = memberService.loginPro(mdto);// 로그인 페이지에서 가져온 id, pw와 일치하는 사용자가 있는지 확인.
		System.out.println("loginPro-mdto::"+mdto);
		if(mdto==null) {
			return 0; // 아이디 비밀번호 조회가 실패
		}
		if("admin".equals(mdto.getRole())) {
			return 1; // 로그인한 아이디가 어드민 계정일 경우
		}
		request.getSession();
		session.setAttribute("mdto", mdto);
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
		
//		// email check ajax process 
//		@RequestMapping(value = "/emailCheck")
//		@ResponseBody()
//		public Map<String,Object> emailCheck(@RequestBody String email, MemberDTO mdto) throws UnsupportedEncodingException {
//			int cnt = 0;
//			email = URLDecoder.decode(email);
//			email = email.substring(6);
//			System.out.println(email);
//			if(email != null)
//			{
//				cnt = memberService.emailCheck(email, mdto.getNo());
//				System.out.println("널입니다");
//			}
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("cnt", cnt);
//			return map;
//		}
		
		
		// mypage
		@RequestMapping(value="/myPage")
		public String myPage(Model model, HttpServletRequest request, HttpServletResponse response,
				MemberDTO mdto) {
			HttpSession session = request.getSession();
			Integer no = (Integer)session.getAttribute("idKey");
			if(no == null) {
				return "/custom/login";
			} else {
			mdto.setEmail("rlejrrlejr@gmail.com");
			memberService.getMyAct(no, model);
			//MyActDTO myActDto = memberService.getMyAct(no);
			//model.addAttribute("myAct",myActDto);
			
			// 예약 내역 조회하는 메소드
			List<BookingDTO> bdto2 = memberService.getBookingList(no); 
			model.addAttribute("bdto", bdto2);
			// 리뷰 조회하는 메소드
			List<ReviewDTO> rdto2 = memberService.getReviewList(no);
			model.addAttribute("rdto",rdto2);
//			// 즐겨찾기 조회하는 메소드 실은  
			List<RestaurantDTO> fdto2 = memberService.getFavoriteList(no);
			model.addAttribute("fdto", fdto2);
			System.out.println(fdto2);
			MemberDTO mdto2 = memberService.getMemberList(no); 
			model.addAttribute("mdto", mdto2);
			//session.setAttribute("mdto", mdto2);
			// 문의 조회하는 메소드
			List<QnaDTO> qdto2 = memberService.getQnaList(no);  
			model.addAttribute("qdto", qdto2);
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
			MemberDTO mdto2 = memberService.getMemberInfo(no);
			session.setAttribute("mdto", mdto2);
			MemberDTO mdto3 = memberService.getMemberList(no); 
			model.addAttribute("mdto", mdto3);
			memberService.getMyAct(no, model);
			} 
			return "/custom/updateInfo";
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
			Integer no = (Integer)session.getAttribute("idKey");
			memberService.getMyAct(no, model);
//			System.out.println("id="+no);
//			System.out.println("rdto="+rdto);
			List<ReviewDTO> rdto2 = memberService.getReviewList(no);
			model.addAttribute("rdto",rdto2);
			MemberDTO mdto3 = memberService.getMemberList(no); 
			model.addAttribute("mdto", mdto3);
			memberService.getMyAct(no, model);
			System.out.println(rdto2);
			return "/custom/myPageReview";
		}
		/* ReviewController 끝 */
		/* QnaController 시작 */

		@GetMapping("/myPageQna")
		public String getQnaList(HttpServletRequest request, HttpServletResponse response, Model model, QnaDTO qdto) {
			HttpSession session = request.getSession();
			Integer no = (Integer)session.getAttribute("idKey");
			MemberDTO mdto3 = memberService.getMemberList(no); 
			model.addAttribute("mdto", mdto3);
			memberService.getMyAct(no, model);
			List<QnaDTO> qdto2 = memberService.getQnaList(no);  
			model.addAttribute("qdto", qdto2);
			System.out.println(qdto2);
			return "/custom/myPageQna";
		}
		/* QnaController 끝 */
		/* FavoriteController, restaurant 시작 */
		
		@GetMapping("/myPageFavorite")
		public String myPageFavorite(HttpServletRequest request, HttpServletResponse response, Model model) {
			HttpSession session = request.getSession();
			Integer no = (Integer)session.getAttribute("idKey");
			MemberDTO mdto2 = memberService.getMemberList(no); /* member_bar 이름 가입일 회원가입 부분 */ 
			model.addAttribute("mdto", mdto2);
			memberService.getMyAct(no, model); /* member_bar 리뷰 즐겨찾기 예약 부분 */
			List<RestaurantDTO> resdto2 = memberService.getFavoriteList(no);
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
			Integer no = (Integer)session.getAttribute("idKey");
			List<BookingDTO> bdto2 = memberService.getBookingList(no);
			MemberDTO mdto3 = memberService.getMemberList(no); 
			model.addAttribute("mdto", mdto3);
			memberService.getMyAct(no, model);
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
			System.out.println("email:::"+email);
			System.out.println("email2:::"+no);
			int r = memberService.emailCheck(email, no);
			System.out.println("rrrrrrrrrrrrrr"+r);
			// r == 0 이면 중복되는 email이 없다
			// r > 0 이면 중복되는 email이 있다.
			return r;
		}
		@PostMapping("nick_nameCheck")
		public @ResponseBody int nick_nameCheck(@RequestParam("nick_name") String nick_name, @RequestParam("no") int no) {
			// 받아온 파라메터 email의 값으로 DB에서 검색해서 같은 값을 가진 친구들을 count 해주는 메소드
			int r = memberService.nick_nameCheck(nick_name, no);
			// r == 0 이면 중복되는 email이 없다
			// r > 0 이면 중복되는 email이 있다.
			return r;
		}
		@PostMapping("phoneCheck")
		public @ResponseBody int phoneCheck(@RequestParam("phone") String phone, @RequestParam("no") int no) {
			// 받아온 파라메터 email의 값으로 DB에서 검색해서 같은 값을 가진 친구들을 count 해주는 메소드
			System.out.println("phone11"+phone);
			System.out.println("phone22"+no);
			int r = memberService.phoneCheck(phone, no);
			System.out.println("phonerrrr"+r);
			// r == 0 이면 중복되는 email이 없다
			// r > 0 이면 중복되는 email이 있다.
			return r;
		}
}