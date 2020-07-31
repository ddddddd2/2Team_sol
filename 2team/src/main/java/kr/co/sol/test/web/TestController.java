package kr.co.sol.test.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sol.test.web.service.TestService;

@Controller
public class TestController {
	@Autowired
	TestService testService;
	
	@RequestMapping("/test")
	public String testCon() {
		return "sub";
	}
}