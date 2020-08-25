package kr.co.sol.custom.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.searchresult.service.SearchResultService;

@Controller 
public class SearchResultController {
	
	@Autowired
	SearchResultService restaurantService;
	
	// sub1 page 
	@RequestMapping("/custom/sub1")
	public String searchResult(Model model , @RequestParam("keyword") String keyword) {
		
		List<RestaurantDTO> reslist = restaurantService.getRestaurants2(keyword);		
		model.addAttribute("reslist",reslist); // 레스토랑 리스트 
		
		
		
		return "/custom/sub1";
	}
}
