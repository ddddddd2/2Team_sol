package kr.co.sol.custom.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sol.common.dto.PageDTO;
import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.searchresult.service.SearchResultService;


@Controller 
public class SearchResultController {
	
	@Autowired
	SearchResultService searchResultService;
	
	// sub1 page 
	@RequestMapping("/custom/sub1")
	public String searchResult(HttpServletRequest request,Model model 
			,@RequestParam("keyword") String keyword
			,@RequestParam("category") Integer category
			, PageDTO pdto) {
		
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("keyword",keyword);
		hmap.put("category", category);
		
		// paging info
		// 전체 레코드수
		int cnt = searchResultService.getCnt(hmap);
		pdto.setLinePerPage(10);
		pdto.setAllCount(cnt);
		// 전체 페이지 수 계산
		int pageCnt = cnt % pdto.getLinePerPage();
		pdto.setAllPage(pageCnt);
		if (pageCnt == 0) {
			pdto.setAllPage(cnt / pdto.getLinePerPage());
		} else {
			pdto.setAllPage(cnt / pdto.getLinePerPage() + 1);
		}

		// 현재 페이지
		int currentPage = 0;

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		// 현재 블럭
		int currPageBlock = 0;

		if (request.getParameter("currPageBlock") == null || request.getParameter("currPageBlock").equals(0)) {
			currPageBlock = 1;
		} else {
			currPageBlock = Integer.parseInt(request.getParameter("currPageBlock"));
		}
		pdto.setCurrentPage(currentPage);
		pdto.setCurrPageBlock(currPageBlock);

		int startPage = 1;
		int endPage = 1;

		startPage = (currPageBlock - 1) * pdto.getPageBlock() + 1;
		endPage = currPageBlock * pdto.getPageBlock() > pdto.getAllPage() ? pdto.getAllPage()
				: currPageBlock * pdto.getPageBlock();

		pdto.setStartPage(startPage);
		pdto.setEndPage(endPage);

		int sRow = (currentPage - 1) * pdto.getLinePerPage() + 1;

		hmap.put("start", sRow);
		hmap.put("end", currentPage * pdto.getLinePerPage());

		// reviews info
		List<RestaurantDTO> reslist = searchResultService.getRestaurants2(hmap);
		
		model.addAttribute("reslist",reslist); // 레스토랑 리스트 
		model.addAttribute("keyword",keyword);
		model.addAttribute("category",category);
		model.addAttribute("pdto", pdto);
		
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
		
		
		return resdto;
	}


}
