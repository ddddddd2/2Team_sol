package kr.co.sol.custom.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sol.common.dto.MemberDTO;
import kr.co.sol.common.service.MemberService;
//import kr.co.sol.etc.SecurityUtil;
import kr.co.sol.etc.SecurityUtil;

// index , login&out , loginProc , signUp , signUpProc 
@Controller
public class CommonController {
	
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
		SecurityUtil securityUtil = new SecurityUtil();
		String passwd = securityUtil.encryptSHA256(mdto.getPasswd());
		mdto.setPasswd(passwd);
		mdto = memberService.loginPro(mdto);
		
		if(mdto==null) {
			return 0; // 아이디 비밀번호 조회가 실패
		}
		session.setAttribute("mdto", mdto);
		session.setAttribute("idKey", mdto.getNo());
		if("admin".equals(mdto.getRole())) {
			return 1; // 로그인한 아이디가 어드민 계정일 경우
		}
		return 2;
	}

	// logout process
	@RequestMapping(value="/custom/logout")
	public String logout(HttpServletRequest request) {
				
		HttpSession session = request.getSession();
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
		SecurityUtil securityUtil = new SecurityUtil();
		String passwd = securityUtil.encryptSHA256(mdto.getPasswd());
		mdto.setPasswd(passwd);		
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
				
}