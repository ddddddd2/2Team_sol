package kr.co.sol.custom.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sol.custom.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
}
