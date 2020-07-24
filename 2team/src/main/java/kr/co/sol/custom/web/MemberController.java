package kr.co.sol.custom.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.sol.custom.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
}
