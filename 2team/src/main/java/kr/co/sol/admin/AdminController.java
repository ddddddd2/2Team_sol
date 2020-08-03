package kr.co.sol.admin;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.store.dto.BookingDTO;
import kr.co.sol.store.dto.StoreDTO;
import kr.co.sol.store.service.StoreService;

@Controller
public class AdminController<E> {
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
	
	
	@RequestMapping(value="admin/mem_manage", method = {RequestMethod.GET,RequestMethod.POST})
	public String mm(Model model, HttpServletRequest request, HttpServletResponse response,MemberDTO mdto,
			@RequestParam(required=false) String searchOption,
			@RequestParam(required=false) String keyword) {
		List<MemberDTO> mdto2;
		if(searchOption==null && keyword==null) {
			mdto2 = adminService.getMember();
		} else {
			mdto2 = adminService.getMemberList(searchOption, keyword);
		}
		model.addAttribute("mdto",mdto2);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword",keyword);
		model.addAttribute("map",map);
		
		System.out.println("SO:  "+searchOption);
		System.out.println("KW:  "+keyword);
		System.out.println("mdto:  "+mdto2);
		return "admin/mem_manage";
	}
	
	@GetMapping("admin/store_manage")
	public String sm(Model model, HttpServletRequest request, HttpServletResponse response, StoreDTO sdto,
			@RequestParam(required=false) String searchOption,
			@RequestParam(required=false) String keyword) {
		List<StoreDTO> sdto2;
		if(searchOption==null && keyword==null) {
			sdto2 = storeService.getStore();
		} else {
			sdto2 = storeService.getStoreList(searchOption, keyword);
		}
		model.addAttribute("sdto",sdto2);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword",keyword);
		model.addAttribute("map",map);
		
		return "admin/store_manage";
	}
	
	@GetMapping("admin/report")
	public String report(Model model, HttpServletRequest request, HttpServletResponse response, StoreDTO sdto, MemberDTO mdto) {
		return "admin/report";
	}

	@GetMapping("admin/reserv_manage")
	public String reserv(Model model, HttpServletRequest request, HttpServletResponse response, BookingDTO bdto, StoreDTO sdto, MemberDTO mdto) {
		List<HashMap<String, Object>> bdto3 = storeService.getBooking();
		model.addAttribute("bdto",bdto3);
		System.out.println("bdto3:"+bdto3);
		return "admin/reserv_manage";
	}
	
	
}