package kr.co.sol.admin;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.store.dto.StoreDTO;
import kr.co.sol.store.service.StoreService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	StoreService storeService;
	
	@GetMapping("admin/index")
	public String adminIndex(Model model, HttpServletRequest request,
			HttpServletResponse response
//			,@RequestParam(value="page", required=false, defaultValue = "") String page
			){
		
//		if(page.length()>0 || page!=null) {
//			page+=".jsp";
//			model.addAttribute("contentView", page);
//		} 
		return "admin/index";
	}
	@GetMapping("admin/mem_manage")
	public String mm(Model model, HttpServletRequest request, HttpServletResponse response, StoreDTO sdto, MemberDTO mdto) {
		System.out.println("여기냐?");
		List<StoreDTO> sdto2 = storeService.getStore();
		System.out.println("여기냐?");
		System.out.println(sdto2);

		List<MemberDTO> mdto2 = adminService.getMember();
		
		model.addAttribute("mdto", mdto2);
		model.addAttribute("sdto", sdto2);
		
		return "admin/mem_manage";
	}
}