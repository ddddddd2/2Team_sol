package kr.co.sol.custom.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import kr.co.sol.common.dto.ReviewDTO;
import kr.co.sol.restaurantdetail.service.RestaurantDetailService;
import kr.co.sol.searchresult.service.SearchResultService;


@Controller 
public class SearchResultController {
	
	@Autowired
	SearchResultService searchResultService;
	
	@Autowired
	RestaurantDetailService restaurantDetailService;
	
	// sub1 page 
	@RequestMapping("/custom/sub1")
	public String searchResult(HttpServletRequest request,Model model 
			,@RequestParam("keyword") String keyword
			,@RequestParam("category") Integer category
			, PageDTO pdto) {
		

		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("keyword",keyword);
		hmap.put("category", category);
		System.out.println("11");
		// paging info
		int cnt = searchResultService.getCnt(hmap); //페이징 처리를 위한 전체 레코드수
		System.out.println("cnt::"+cnt);
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
		System.out.println("sRow"+sRow);
		// keyword , category 에 맞는 음식점  구하기 
		List<RestaurantDTO> reslist = searchResultService.getRestaurants2(hmap);
		
		//==============================================================================
		//keyword(지역) 에서의  조회수 와 리뷰 평점순 음식점 top5 
		System.out.println("asdfs"+reslist);
		System.out.println(hmap);
		List<Map<String,Object>> vReslist =  searchResultService.getvRestaurants(hmap); // top5
		//List<RestaurantDTO> rReslist =  searchResultService. ; // 리뷰 평점 별 음식점
		
		if(reslist.size()==0) {
			return "/custom/empty";
		} 
		RestaurantDTO resdto3 = reslist.get(0);
		Map<String,Object> defaultResCna = searchResultService.reviewCountAndAvg(resdto3);
		System.out.println(defaultResCna);
		model.addAttribute("reslist",reslist); // 음식점 리스트 
		model.addAttribute("keyword",keyword); // 키워드
		model.addAttribute("category",category); // 카테고리
		model.addAttribute("pdto", pdto); // 페이지 
		model.addAttribute("vReslist",vReslist); // 저회수 별 음식점 리스트 
		model.addAttribute("CnA",defaultResCna); // 최초 페이지 접근 시,reslist에서 첫번째 녀석의 리뷰수와 평균을 가져옴.
		int ClickCnt = searchResultService.visitorsCnt(resdto3);
		ReviewDTO revdto=searchResultService.getReview(resdto3);
		model.addAttribute("ClickCnt",ClickCnt);
		model.addAttribute("freview",revdto);
		return "/custom/sub1";
	}
	
	
	// searchResult page 에서 음식점 리스트 중  음심점을 클릭시 그 음식점 정보를 리턴 하는 메소드 
	@ResponseBody
	@RequestMapping(value = "/custom/getResInfo", method = RequestMethod.POST)
	public HashMap<String,Object> getResInfo(@ModelAttribute RestaurantDTO resdto) throws Exception{
	    System.out.println(resdto);
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		

		// 1. sub1.jsp 에서 ajax -> no 파라미터 를 받아오고
		// 2. 이 함수의 매개변수(resdto) 가 resdto.setNo(no);
		

		// 레스토랑 번호로 해당 레스토랑 정보 구하기 
		RestaurantDTO resdto2 = searchResultService.getRestaurants(resdto);
		System.out.println(resdto2);
		int visitorsCnt = searchResultService.visitorsCnt(resdto2); // 조회수 
		Map<String,Object> rmap = searchResultService.reviewCountAndAvg(resdto2); // 리뷰 평점
		
		ReviewDTO revdto=searchResultService.getReview(resdto2); // 
		
		hmap.put("resdto", resdto2);
		hmap.put("visitorsCnt", visitorsCnt);
		hmap.put("reviewCount", rmap.get("count"));
		hmap.put("reviewAvg", rmap.get("avg"));
		hmap.put("revdto", revdto);
		System.out.println("revdto:::"+revdto);

		return hmap;

	}


}
