package kr.co.sol.update.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.service.MemberService;

@Controller
public class UpdateController {
	
	@Autowired
	MemberService ms;
//	수정 전 정보 가져오기
	@RequestMapping("/updateInfo")
	public String updateInfo(HttpServletRequest request, HttpServletResponse response, Model model, MemberDTO mdto) {
		int no = 1;
		model.addAttribute("no", no);
		MemberDTO mdto2 = ms.getMemberInfo(no);
		model.addAttribute("mdto", mdto2);
		System.out.println(mdto2.getNick_name());
		return "custom/updateInfo";
	}
//	update 후 값을 가져오기
	@RequestMapping("/updateInfoPro")
	public String updateInfoPro(HttpServletRequest request, HttpServletResponse response, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = request.getParameter("id");
		String nick_name= request.getParameter("nikck_name");
		String phone = request.getParameter("phone");
		String passwd = request.getParameter("passwd");
		String email = request.getParameter("email");
		int mem_no = 1;
		int r = ms.updateMember(nick_name, phone, passwd, id, email);
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
	}
}