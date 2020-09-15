package kr.co.sol.custom.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.sol.common.dto.MemberDTO;
import kr.co.sol.common.dto.MenuDTO;
import kr.co.sol.common.dto.PageDTO;
import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.common.dto.ReviewDTO;
import kr.co.sol.common.service.MemberService;
import kr.co.sol.restaurantdetail.service.RestaurantDetailService;

@Controller
public class RestaurantDetailController {

	@Autowired
	RestaurantDetailService restaurantDetailService;

	@Autowired
	MemberService memberService;
	
    @Value("${resources.location}")
    String resourcesLocation;
	
	
	// sub2 - selected restaurant page
	@RequestMapping(value="/custom/sub2")
	public String sub2(HttpServletRequest request, HttpServletResponse response,
			RestaurantDTO resdto, Model model , PageDTO pdto,
			@RequestParam("no") int res_no) {
		
		response.setHeader("Pragma","no-cache"); 
		response.setHeader("Cache-Control", "no-cache"); 
		response.setDateHeader("Expires",0);
		
		HttpSession session = request.getSession();
		resdto.setNo(res_no);
		// restaurant info
		List<RestaurantDTO> tlist = restaurantDetailService.getRestaurants(resdto); 
		model.addAttribute("resdto", tlist.get(0));
		
		// favorite check
		char favoriteCheck = 'f';

		Integer idKey = (Integer)session.getAttribute("idKey");
		restaurantDetailService.addClick(res_no, request);
		
		if(idKey == null) 
		{
			favoriteCheck = 'f';
			
		}else {
			
			HashMap<String,Integer> hmap = new HashMap<String,Integer>();
			hmap.put("res_no",res_no);
			hmap.put("mem_no",idKey);
			
			int r = restaurantDetailService.favoriteCheck(hmap);
			
			if(r>0) {
				favoriteCheck = 't';
			}else {
				favoriteCheck = 'f';
			}		
		}
		model.addAttribute("favoriteCheck",favoriteCheck);
		
		// review count & avg(rating) -> reviewService.reviewCountAndAvg
		Map<String,Object> rmap = restaurantDetailService.reviewCountAndAvg(resdto);
		model.addAttribute("count",rmap.get("count"));
		model.addAttribute("avg",rmap.get("avg"));
	
		// menu info -> restaurantService.getMenus
		List<MenuDTO> mlist = restaurantDetailService.getMenus(resdto);
		model.addAttribute("mlist",mlist);
		
		// paging info
			// 전체 레코드수
		int cnt = Integer.parseInt(String.valueOf(rmap.get("count")+""));
		pdto.setAllCount(cnt);
			// 전체 페이지 수 계산
		int pageCnt = cnt % pdto.getLinePerPage();
		pdto.setAllPage(pageCnt);
		if(pageCnt == 0) {
			pdto.setAllPage(cnt/pdto.getLinePerPage());
		}else {
			pdto.setAllPage(cnt/pdto.getLinePerPage() + 1);
		}
		
			// 현재 페이지
		int currentPage = 0;
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").equals("0"))
		{
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
			// 현재 블럭
		int currPageBlock = 0;
		
		if(request.getParameter("currPageBlock") == null || request.getParameter("currPageBlock").equals(0))
		{
			currPageBlock = 1;
		}else {
			currPageBlock = Integer.parseInt(request.getParameter("currPageBlock"));
		}
		pdto.setCurrentPage(currentPage);
		pdto.setCurrPageBlock(currPageBlock);
		
		int startPage = 1;
		int endPage = 1;
		
		startPage = (currPageBlock - 1) * pdto.getPageBlock() + 1;
    	endPage = currPageBlock * pdto.getPageBlock() > pdto.getAllPage() ? 
    			pdto.getAllPage() : currPageBlock * pdto.getPageBlock();
    
    	pdto.setStartPage(startPage);
    	pdto.setEndPage(endPage);
    	model.addAttribute("pdto",pdto);
    	
    	int sRow = (currentPage-1) * pdto.getLinePerPage() + 1;
    	
    	HashMap<String,Integer> hmap2 = new HashMap<String,Integer>();
    	hmap2.put("start", sRow);
    	hmap2.put("end", currentPage * pdto.getLinePerPage());
    	hmap2.put("res_no", res_no);
    	if(idKey != null )
    	{

    		int mem_no = idKey;
    		hmap2.put("mem_no2",mem_no);
    	}
    	
		// reviews info
		List<ReviewDTO> rlist = restaurantDetailService.getReviews(hmap2);
		model.addAttribute("rlist",rlist);
		
		return "/custom/sub2";
	}
	
	
	
	// favorites process 북마크 처리 
	@RequestMapping(value="/custom/favorites")
	public String favorites(HttpServletRequest request , 
			Model model, @RequestParam("no") int res_no) {
		
		HttpSession session = request.getSession();
		
		Integer idKey = (Integer)session.getAttribute("idKey");
		
		String msg = "";
		String url = "/custom/sub2?no="+res_no;
		
		// 세션에 id값이 없을 때 로그인 페이지로 이동 
		if(idKey == null )
		{
			msg="로그인 부터 해주시길 바랍니다. ";
			url="/custom/login";
			
		}else {
			
			HashMap<String,Integer> hmap = new HashMap<String,Integer>();
			hmap.put("res_no",res_no);
			hmap.put("mem_no",idKey);
			
			
			int r = restaurantDetailService.favoriteCheck(hmap);
			
			if(r > 0)
			{
				r = restaurantDetailService.dislikeRestaurant(hmap); // 좋아요 해제
				
				if(r > 0)
					msg = "favorite off";
				else
					msg = "favorite off error";
			}else {
				
				r = restaurantDetailService.likeRestaurant(hmap); // 좋아요 
				
				if(r > 0)
					msg = "favorite on";
				else
					msg = "favorite on error";
			}
			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url",url);
		
		return "/custom/msgPage";
	}
	
	
	// review insert 리뷰작성 
	@RequestMapping(value="/custom/reviewInsert")
	public String reviewInsert(HttpServletRequest request,
			 @RequestParam("file2") MultipartFile file,
			 HttpServletResponse response,
			 ReviewDTO revdto,Model model ,RestaurantDTO resdto ) {
		
		HttpSession session = request.getSession();
		Integer idKey = (Integer)session.getAttribute("idKey");
		
		String msg =""; ;
		String url="/custom/sub2?no="+resdto.getNo();
		
		// 세션에 id값이 없을 때 로그인 페이지로 이동 

		if(idKey == null)
		{
			msg="로그인 부터 해주시길 바랍니다. ";
			url="/custom/login";
			
		}else {
			

			// 세션에 저장된 idKey(mem_id) 값으로 mem_no 구해오기 
			int mem_no = idKey;
			

			revdto.setMem_no(mem_no);
			MemberDTO mdto2 = (MemberDTO) session.getAttribute("mdto");
			revdto.setMem_id(mdto2.getId());
			revdto.setRes_no(resdto.getNo());
			
			int r = 0;
			
			// 리뷰에서 파일업로드 경로 
			revdto.setPath(resourcesLocation+"review_img/");
			
			r = restaurantDetailService.reviewInsert(revdto,file);
			if(r > 0) {
				msg = "리뷰작성 완료";
			}else {
				msg = "리뷰작성 실패";
			}
			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url",url);
		
		return "/custom/msgPage";
	}
	
	// 리뷰 like(좋아요) process 
	@RequestMapping(value="/custom/like")
	public String reviewLike(HttpServletRequest request, HttpServletResponse response,
			RestaurantDTO resdto,ReviewDTO revdto,Model model ) {
		
		HttpSession session = request.getSession();
		Integer idKey = (Integer)session.getAttribute("idKey");
		
		String msg ="";
		String url="/custom/sub2?no="+resdto.getNo();
		
		// 세션에 id값이 없을 때 로그인 페이지로 이동 
		if(idKey == null)
		{
			msg="로그인 부터 해주시길 바랍니다. ";
			url="/custom/login";
					
		}else {
			
			// 세션에 저장된 idKey(mem_id) 값으로 mem_no 구해오기 
			int mem_no = idKey;		
			
			if(request.getParameter("rev_no") != null)
			{
				int rev_no = Integer.parseInt(request.getParameter("rev_no"));
				
				HashMap<String,Integer> hmap = new HashMap<String,Integer>();
				hmap.put("rev_no", rev_no);
				hmap.put("mem_no",mem_no);
				
				int r = restaurantDetailService.likeCheck(hmap);
				
				if(r > 0)
				{
					r = restaurantDetailService.dislikeReview(hmap); // like off 
					
					if( r > 0) {
						
						r = restaurantDetailService.likeMinus(hmap); // like count -- 
						
						msg = "like off";
						
					}
					else
						msg = "like off error";
				}else {
					
					r = restaurantDetailService.likeReview(hmap); // like on
					
					if( r > 0) {
						
						r = restaurantDetailService.likePlus(hmap); // like count ++
						
						msg = "like on";
						}
					else
						msg = "like on error";
				}

			}else {
				msg = "like process error";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url",url);
		return "/custom/msgPage";
	}
	
}
