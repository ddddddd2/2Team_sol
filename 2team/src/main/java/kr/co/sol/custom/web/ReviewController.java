package kr.co.sol.custom.web;

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

import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.dto.ReviewDTO;
import kr.co.sol.custom.service.MemberService;
import kr.co.sol.custom.service.ReviewService;

@Controller
public class ReviewController {
	
	// 서비스들 wrapper로 묶을지 고민 ... 
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	MemberService memberService;
	
	
    @Value("${resources.location}")
    String resourcesLocation;
	
	// review insert
	@RequestMapping(value="/custom/reviewInsert")
	public String reviewInsert(HttpServletRequest request,
			 @RequestParam("image") MultipartFile file,
			 HttpServletResponse response,
			 ReviewDTO rdto,MemberDTO mdto,Model model) {
		
		HttpSession session = request.getSession();
		String idKey = (String)session.getAttribute("idKey");
		
		String msg ="";
		String url="/custom/sub2";
		
		// 세션에 id값이 없을 때 로그인 페이지로 이동 
		if(idKey == null || idKey.equals(""))
		{
			msg="로그인 부터 해주시길 바랍니다. ";
			url="/custom/login";
			
		}else {
			
			// 세션에 저장된 idKey(mem_id) 값으로 mem_no 구해오기 
			int mem_no = memberService.getMemberNo(idKey);
			
			rdto.setMem_no(mem_no);
			rdto.setMem_id(idKey);
			
			int r = 0;
			
			// 리뷰에서 파일업로드 경로 
			rdto.setPath(resourcesLocation);
			
			r = reviewService.reviewInsert(rdto,file);
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
}
