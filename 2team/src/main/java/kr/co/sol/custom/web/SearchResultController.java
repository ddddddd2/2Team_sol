package kr.co.sol.custom.web;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		model.addAttribute("keyword",keyword);
		model.addAttribute("category",category);
		
		return "/custom/sub1";
	}
	
	
	// searchResult page 에서 음식점 리스트 중  음심점을 클릭시 그 음식점 정보를 리턴 하는 메소드 
	@ResponseBody
	@RequestMapping(value = "/custom/getResInfo", method = RequestMethod.POST)
	public RestaurantDTO getResInfo(@ModelAttribute RestaurantDTO resdto) throws Exception{
	    
		// 1. sub1.jsp 에서 ajax -> no 파라미터 를 받아오고
		// 2. 이 함수의 매개변수(resdto) 가 resdto.setNo(no);
		
		// resdto 로 음식점
		List<RestaurantDTO> reslist = searchResultService.getRestaurants(resdto);
		resdto = reslist.get(0);
		
		/* 
		  	List<RestaurantDTO> reslist = searchResultService.getRestaurants();
		  	reslist -> RestaurantDTO 431 개가 들어감  
		  	reslist.get(10) -> 11번째 
		  	
		    List<RestaurantDTO> reslist = searchResultService.getRestaurants(resdto);
		  	-> 음식점 하나만 뽑아오겟다  
		  	
		*/
		
		return resdto;
	}


}
