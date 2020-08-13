package kr.co.sol.admin;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;

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
	
	
	@RequestMapping(value="admin/mem_manage", method = {RequestMethod.GET,RequestMethod.POST})
	public String mm(Model model, HttpServletRequest request, HttpServletResponse response,MemberDTO mdto,
			@RequestParam(required=false) String searchOption,
			@RequestParam(required=false) String keyword) {
		List<HashMap<String, Object>> map= new ArrayList<HashMap<String, Object>>();
		
		// 맨 처음 들어왔을 때 전체 리스트 불러오기 위해.
		if(searchOption==null && keyword==null) {
			// 전체 리스트 불러온다.
			map = adminService.getMember();
			System.out.println("map1:"+map);
		} else {
			// 검색어와 옵션이 있을 경우 해당 내용으로 검색한 결과를 가져온다.
			map = adminService.getMemberList(searchOption,keyword);
			System.out.println("map2:"+map);
		}
		model.addAttribute("mdto",map);
		System.out.println();
		// 검색 후 옵션 유지하기 위해서.
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("searchOption", searchOption);
		map2.put("keyword",keyword);
		
		model.addAttribute("map",map2);
		return "admin/mem_manage";
	}
	
	@GetMapping("/admin/store_manage")
	public String sm(String searchOption, String keyword, Model model, StoreDTO sdto) {
		List<StoreDTO> sdto2;
		if(searchOption==null && keyword==null) {
			sdto2 = storeService.getStoreList();
		} else {
			sdto2 = storeService.getStore(searchOption, keyword);
		}
		model.addAttribute("sdto",sdto2);
		return "/admin/store_manage";
	}
	
	
//	@GetMapping("admin/store_manage")
//	public String sm(Model model, HttpServletRequest request, HttpServletResponse response, StoreDTO sdto,
//			@RequestParam(required=false) String searchOption,
//			@RequestParam(required=false) String keyword) {
//		List<StoreDTO> sdto2;
//		if(searchOption==null && keyword==null) {
//			sdto2 = storeService.getStore();
//		} else {
////			sdto2 = storeService.getStoreList(searchOption, keyword);
//		}
//		model.addAttribute("sdto",sdto2);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("searchOption", searchOption);
//		map.put("keyword",keyword);
//		model.addAttribute("map",map);
//		
//		return "admin/store_manage";
//	}
	
	@GetMapping("admin/report")
	public String report(Model model, HttpServletRequest request, HttpServletResponse response, StoreDTO sdto, MemberDTO mdto) {
		return "admin/report";
	}
	
	@GetMapping("admin/reg_store")
	public String reg_store() {
		return "admin/reg_store";
	}
	
	@RequestMapping("admin/reg_storePro")
	public String reg_storePro(@RequestParam("fileName") MultipartFile fileName, Model model) {
			try {
				fileName.transferTo(new File("${path}/"+fileName.getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		return "redirect:admin/store_manage";
	}
	@GetMapping("sub")
	public String sub() {
		return "sub";
	}
}