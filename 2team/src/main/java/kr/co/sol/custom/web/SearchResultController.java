package kr.co.sol.custom.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.searchresult.service.SearchResultService;

@Controller 
public class SearchResultController {
	
	@Autowired
	SearchResultService restaurantService;
	
	// sub1 page 
	@RequestMapping("/custom/sub1")
	public String testCon(RestaurantDTO resdto, Model model) {
		
		List<RestaurantDTO> tdto2 = restaurantService.getRestaurants(resdto);		
		model.addAttribute("resdto",tdto2);
		
		return "/custom/sub1";
	}
}
