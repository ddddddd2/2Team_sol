package kr.co.sol.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		List<StoreDTO> sdto2 = storeService.getStore();
		List<MemberDTO> mdto2 = adminService.getMember();
				
		model.addAttribute("mdto", mdto2);
		model.addAttribute("sdto", sdto2);
		
//		if(page.length()>0 || page!=null) {
//			page+=".jsp";
//			model.addAttribute("contentView", page);
//		} 
		return "admin/index";
	}
	@GetMapping("admin/mem_manage")
	public String mm(Model model, HttpServletRequest request, HttpServletResponse response, StoreDTO sdto, MemberDTO mdto) {
		List<StoreDTO> sdto2 = storeService.getStore();
		List<MemberDTO> mdto2 = adminService.getMember();
		
		model.addAttribute("mdto", mdto2);
		model.addAttribute("sdto", sdto2);
		
		return "admin/mem_manage";
	}
}