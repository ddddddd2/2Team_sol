package kr.co.sol.custom.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.searchresult.service.SearchResultService;

@Controller
public class SearchResultController {
	
	@Autowired
	SearchResultService restaurantService;
	
	// sub1 page 
	@RequestMapping("/custom/sub1")
	public String testCon(RestaurantDTO resdto, Model model) {
		
		List<RestaurantDTO> resdto2 = restaurantService.getRestaurants(resdto);		
		model.addAttribute("resdto",resdto2);
		return "/custom/sub1";
	}
	
	@PostMapping("/rlist")
	public @ResponseBody RestaurantDTO getResInfo(int no){
		// 특정 레스토랑 번호로 해당 레스토랑의 정보를 조회
		RestaurantDTO resInfo = restaurantService.getResInfo(no);
		return resInfo;		
	}
	
}