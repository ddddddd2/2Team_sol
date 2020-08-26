package kr.co.sol.custom.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	SearchResultService searchResultService;
	
	// sub1 page 
	@RequestMapping("/custom/sub1")
	public String searchResult(Model model , @RequestParam("keyword") String keyword
			,@RequestParam("category") String category) {

		
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("keyword",keyword);
		hmap.put("category", category);
		
		List<RestaurantDTO> reslist = searchResultService.getRestaurants2(hmap);		
		model.addAttribute("reslist",reslist); // 레스토랑 리스트 
		
		return "/custom/sub1";
	}

}
