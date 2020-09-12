package kr.co.sol.custom.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sol.booking.service.BookingService;
import kr.co.sol.common.dto.BookingDTO;
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
	
	@Autowired
	BookingService bookingService;
	
	@RequestMapping(value="/custom/booking")
	public String booking(HttpServletRequest request, HttpServletResponse response,
			Model model , RestaurantDTO resdto ,@RequestParam("no") Integer res_no){
		HttpSession session = request.getSession();
		Integer no = (Integer)session.getAttribute("idKey");
		
		MemberDTO mdto = null;
		
		if(no != null)
			mdto =  memberService.getMemberInfo(no); // 로그인한 멤버 정보 
		
		if(res_no != null) {
			resdto.setNo(res_no);
			// 해당 레스토랑 정보 
			List<RestaurantDTO> rlist = restaurantDetailService.getRestaurants(resdto);
			resdto = rlist.get(0);
		}
		
		// 메뉴 들 
		List<MenuDTO> mlist = restaurantDetailService.getMenus(resdto);
		
		model.addAttribute("mdto",mdto);
		model.addAttribute("mlist",mlist);
		model.addAttribute("resdto",resdto);
		
		return "/custom/booking";
	}
	
	@ResponseBody
	@RequestMapping(value = "/custom/bookingProc", method = RequestMethod.POST)
	public void bookingProc(@ModelAttribute BookingDTO bdto){
		
		System.out.println(bdto);
		
		if(bdto != null)
		{
			int r = bookingService.bookingProc(bdto);
			
		}
		
	}
}
