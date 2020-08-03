package kr.co.sol.custom.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sol.custom.dto.MemberDTO;
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
	public String login() {

		return "/custom/login";
	}
	
	// login process
	@RequestMapping(value="/custom/loginProc")
	public String loginProc(HttpServletRequest request, Model model, HttpServletResponse response,
			MemberDTO mdto) {
		
		mdto = memberService.loginProc(mdto);
	    HttpSession session = request.getSession();
		String mem_id= null;
		String url="/";
		
		// 일치하는 아이디와 비밀번호가 있는경우 
		if(mdto != null)
		{
			mem_id = mdto.getMem_id(); // member의 id가져오고 
			if(mdto.getMem_role().equals("admin")) // 역활이 admin 이라면 
			{
				session.setAttribute("adminDTO", mdto); // admin 세션을 추가
			}else {
				session.setAttribute("userDTO", mdto); // user 세션을 추가 
			}
		}
		
		// 로그인에 처리하지 못하였을 때 
		if(mem_id == null) {
			model.addAttribute("msg","id 또는 passwd 가 일치하지 않습니다. ");
			url = "/custom/login";
		}
		else {
			model.addAttribute("msg","로그인에 성공하였습니다. ");
			session.setAttribute("idKey", mem_id);
		}
		
		model.addAttribute("url",url);
			
		return "/custom/msgPage";
	}
	
	// logout process
	@RequestMapping(value="/custom/logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("idKey");
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
	@ResponseBody
	public int idCheck(MemberDTO mdto) {
		 
		int cnt = 0;
		String id = mdto.getMem_id();
		if(mdto.getMem_id() != null)
		{
			cnt = memberService.idCheck(id);
		}
		 
		return cnt;
	}
	
	
	// mypage2
	@RequestMapping(value="/custom/myPage2")
	public String myPage2(HttpServletRequest request, HttpServletResponse response,
			MemberDTO mdto) {
		
		return "/custom/myPage2";
	}
}
