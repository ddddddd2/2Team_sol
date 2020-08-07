package kr.co.sol.custom.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.dto.MenuDTO;
import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;
import kr.co.sol.custom.service.RestaurantService;
import kr.co.sol.custom.service.ReviewService;

@Controller
public class RestaurantController {
	
	@Autowired
	RestaurantService restaurantService;
	
	@Autowired
	ReviewService reviewService;
	
	// selected restaurant page
	@RequestMapping(value="/custom/sub2")
	public String sub2(HttpServletRequest request, HttpServletResponse response,
			RestaurantDTO tdto,Model model
			/*@RequestParam("no") int res_no*/) {
		
		int res_no = 1; // 임시 
		
		tdto.setNo(res_no);
		
		// restaurant info
		List<RestaurantDTO> tlist = restaurantService.getRestaurants(tdto); 
		model.addAttribute("tdto", tlist.get(0));
		 
		// review count & avg(rating) -> reviewService.reviewCountAndAvg
		Map<String,Object> rmap = reviewService.reviewCountAndAvg(res_no);
		model.addAttribute("count",rmap.get("count"));
		model.addAttribute("avg",rmap.get("avg"));
	
		// menu info -> restaurantService.getMenus
		List<MenuDTO> mlist = restaurantService.getMenus(res_no);
		model.addAttribute("mlist",mlist);
		
		// reviews info
		List<ReviewDTO> rlist = reviewService.getReviews(res_no);
		model.addAttribute("rlist",rlist);
		
		return "/custom/sub2";
	}
	
	
	
	// favorites process
	@RequestMapping(value="#")
	public String favorites() {
		
		
		return "";
	}
}
