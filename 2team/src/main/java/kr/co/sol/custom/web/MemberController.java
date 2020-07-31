package kr.co.sol.custom.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/")
	public String index(HttpServletRequest request, Model model, HttpServletResponse response) {
		/*
		 * HttpSession session = request.getSession(); String idKey =
		 * (String)session.getAttribute("idKey"); session.setAttribute("idKey", idKey);
		 */
		
		return "index";
	}
	
	@RequestMapping(value="/custom/login")
	public String login(HttpServletRequest request, Model model, HttpServletResponse response) {

		return "/custom/login";
	}
	
	@RequestMapping(value="/custom/loginProc")
	public String loginProc(HttpServletRequest request, Model model, HttpServletResponse response) {
		
		
		
		return "";
	}
	
	@RequestMapping(value="/custom/memSignUp")
	public String memSignUp(HttpServletRequest request, Model model, HttpServletResponse response) {
		
		return "custom/memSignUp";
	}
	
	@RequestMapping(value="/custom/memSignUpProc")
	public String memSignUpProc(HttpServletRequest request, Model model, HttpServletResponse response,
			MemberDTO mdto) {
		
		
		return "custom/memSignUp";
	}
	
	 @RequestMapping(value = "/idCheck")
	 @ResponseBody
	 public int idCheck(HttpServletRequest request, HttpServletResponse response,
			 MemberDTO mdto, Model model) {
		 
		 int cnt = 0;
		 String id = mdto.getMem_id();
		 if(mdto.getMem_id() != null)
		 {
			 cnt = memberService.idCheck(id);
		 }
		 
		 return cnt;
	 }
	
}
