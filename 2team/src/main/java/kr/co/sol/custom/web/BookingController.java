package kr.co.sol.custom.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sol.common.dto.MemberDTO;
import kr.co.sol.common.dto.MenuDTO;
import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.common.service.MemberService;
import kr.co.sol.restaurantdetail.service.RestaurantDetailService;

@Controller
public class BookingController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	RestaurantDetailService restaurantDetailService;
	
	@RequestMapping(value="/custom/booking")
	public String booking(HttpServletRequest request, HttpServletResponse response,
			Model model , RestaurantDTO resdto ,@RequestParam("no") Integer res_no){
		HttpSession session = request.getSession();
		Integer no = (Integer)session.getAttribute("idKey");
		
		MemberDTO mdto = null;
		
		if(no != null)
			mdto =  memberService.getMemberInfo(no);
		
		if(res_no != null)
			resdto.setNo(res_no);
		
		List<MenuDTO> mlist = restaurantDetailService.getMenus(resdto);
		
		model.addAttribute("mdto",mdto);
		model.addAttribute("mlist",mlist);
		
		return "/custom/booking";
	}
}
