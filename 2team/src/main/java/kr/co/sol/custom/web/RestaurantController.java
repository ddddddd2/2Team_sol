package kr.co.sol.custom.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sol.custom.dto.MenuDTO;
import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;
import kr.co.sol.custom.service.MemberService;
import kr.co.sol.custom.service.RestaurantService;
import kr.co.sol.custom.service.ReviewService;

@Controller
public class RestaurantController {
	
	@Autowired
	RestaurantService restaurantService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	MemberService memberService;
	
	// selected restaurant page
	@RequestMapping(value="/custom/sub2")
	public String sub2(HttpServletRequest request, HttpServletResponse response,
			RestaurantDTO tdto,Model model
			/*@RequestParam("no") int res_no*/) {
		
		int res_no = 1; // 임시 음식점 번호
		
		tdto.setNo(res_no);
		
		// restaurant info
		List<RestaurantDTO> tlist = restaurantService.getRestaurants(tdto); 
		model.addAttribute("tdto", tlist.get(0));
		 
		// review count & avg(rating) -> reviewService.reviewCountAndAvg
		Map<String,Object> rmap = reviewService.reviewCountAndAvg(tdto);
		model.addAttribute("count",rmap.get("count"));
		model.addAttribute("avg",rmap.get("avg"));
	
		// menu info -> restaurantService.getMenus
		List<MenuDTO> mlist = restaurantService.getMenus(tdto);
		model.addAttribute("mlist",mlist);
		
		// reviews info
		List<ReviewDTO> rlist = reviewService.getReviews(tdto);
		model.addAttribute("rlist",rlist);
		
		return "/custom/sub2";
	}
	
	
	
	// favorites process
	@RequestMapping(value="/custom/favorites")
	public String favorites(HttpServletRequest request , Model model ) {
		
		int res_no = 1; // 임시 음식점 번호
		
		HttpSession session = request.getSession();
		String idKey = (String)session.getAttribute("idKey");
		
		String msg = "";
		String url = "/custom/sub2";
		
		// 세션에 id값이 없을 때 로그인 페이지로 이동 
		if(idKey == null || idKey.equals(""))
		{
			msg="로그인 부터 해주시길 바랍니다. ";
			url="/custom/login";
			
		}else {
			
			// 세션에 저장된 idKey(mem_id) 값으로 mem_no 구해오기 
			int mem_no = memberService.getMemberNo(idKey);
			int r = restaurantService.likeRestaurant(res_no,mem_no);
			
			if(r > 0) {
				msg = "좋아요 완료";
			}else {
				msg = "좋아요 실패";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url",url);
		
		return "/custom/msgPage";
	}
}
