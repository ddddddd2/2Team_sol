package kr.co.sol.custom.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
public class MyPageController {
	
	@Autowired
	MemberService memberService;
		
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
			Integer no = (Integer)session.getAttribute("idKey");
			if(no == null) {
				return "/custom/login";
			} else {
			mdto.setEmail("rlejrrlejr@gmail.com");
			memberService.getMyAct(no, model);
			// 예약 내역 조회하는 메소드
			List<BookingDTO> bdto2 = memberService.getBookingList(no); 
			model.addAttribute("bdto", bdto2);
			// 리뷰 조회하는 메소드
			List<ReviewDTO> revdto2 = memberService.getReviewList(no);
			model.addAttribute("revdto", revdto2);
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
			int no = (int) session.getAttribute("idKey");
			System.out.println("세션 아이디"+no);
			model.addAttribute("id", no);
			MemberDTO mdto2 = memberService.getMemberInfo(no);
			session.setAttribute("mdto", mdto2);
//			System.out.println(mdto2.getNick_name());
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
		public String myPageReview(HttpServletRequest request, MemberDTO mdto, HttpServletResponse response, Model model, ReviewDTO revdto) {
			HttpSession session = request.getSession();
			System.out.println(session.getAttribute("idKey"));
			Integer no = (Integer)session.getAttribute("idKey");
//			System.out.println("id="+no);
//			System.out.println("revdto="+rdto);
			List<ReviewDTO> revdto2 = memberService.getReviewList(no);
			model.addAttribute("revdto", revdto2);
			memberService.getMyAct(no, model);
			System.out.println(revdto2);
			return "/custom/myPageReview";
		}
		/* ReviewController 끝 */
		/* QnaController 시작 */

		@GetMapping("/myPageQna")
		public String getQnaList(HttpServletRequest request, HttpServletResponse response, Model model, QnaDTO qdto) {
			HttpSession session = request.getSession();
			Integer no = (Integer)session.getAttribute("idKey");
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
			model.addAttribute("bdto", bdto2);
			return "/custom/myPageBooking";
		}

}