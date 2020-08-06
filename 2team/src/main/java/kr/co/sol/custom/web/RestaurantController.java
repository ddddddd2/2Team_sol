package kr.co.sol.custom.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sol.custom.dto.MemberDTO;
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
			MemberDTO mdto,RestaurantDTO tdto,ReviewDTO rdto, Model model
			/*@RequestParam("no") int res_no*/) {
		int res_no = 1;
		
		tdto.setRes_no(res_no);
		
		// restaurant info
		List<RestaurantDTO> tList = restaurantService.getRestaurants(tdto); 
		model.addAttribute("tdto", tList.get(0));
		 
		// review count & avg(rating) -> reviewService.reviewCountAndAvg
		Map<String,Object> rmap = reviewService.reviewCountAndAvg(res_no);
		model.addAttribute("count",rmap.get("count"));
		model.addAttribute("avg",rmap.get("avg"));
	
		// menu info -> restaurantService.getMenus
		
		
		
		
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
