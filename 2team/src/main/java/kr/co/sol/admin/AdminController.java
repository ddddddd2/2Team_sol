package kr.co.sol.admin;



import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.sol.common.dto.MemberDTO;
import kr.co.sol.common.dto.PageDTO;
import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.common.service.MemberService;
import kr.co.sol.etc.Pagination;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/admin/index", method= {RequestMethod.GET, RequestMethod.POST})
	public String adminIndex(Model model, HttpServletRequest request,
			HttpServletResponse response){
		return "admin/index";
	}
	
	@RequestMapping(value="admin/mem_manage", method = {RequestMethod.GET,RequestMethod.POST})
	public String mem_manage(Model model, HttpServletRequest request, HttpServletResponse response,MemberDTO mdto,
			@RequestParam(required=false) String searchOption,
			@RequestParam(required=false) String keyword,
			@RequestParam(value="curPage", defaultValue="1") int curPage,@RequestParam(value="curBlock", defaultValue="1") int curBlock) {
			
		List<HashMap<String, Object>> map= new ArrayList<HashMap<String, Object>>();
		Pagination page = new Pagination();
		Map<String, String> url = new HashMap<String, String>();
		url.put("url", "member");
		
		int listCnt = adminService.allListCnt(url);
		page.pageInfo(curPage, curBlock, listCnt);
		int start = page.getStartList();
		int end = start+page.getListSize();
		model.addAttribute("pdto",page);
		
		
		// 맨 처음 들어왔을 때 전체 리스트 불러오기 위해.
		if(searchOption==null && keyword==null) {
			// 전체 리스트 불러온다.
			map = adminService.getMember(start, end);
		} else {
			// 검색어와 옵션이 있을 경우 해당 내용으로 검색한 결과를 가져온다.
			map = adminService.getMemberList(searchOption,keyword,start, end);
		}
		model.addAttribute("mList",map);
		// 검색 후 옵션 유지하기 위해서.
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("searchOption", searchOption);
		map2.put("keyword",keyword);
		
		model.addAttribute("map",map2);
		return "admin/mem_manage";
	}
	
	@GetMapping("/admin/store_manage")
	public String res_manage(HttpServletRequest request, String searchOption, String keyword,
			@RequestParam(value="curPage", defaultValue="1") int curPage,@RequestParam(value="curBlock", defaultValue="1") int curBlock, Model model, RestaurantDTO resdto, PageDTO pdto) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mdto")==null) {
			return "redirect:/";
		} // 세션에 담긴게 없으면 로그인 화면으로
		Pagination page = new Pagination();
		Map<String, String> url = new HashMap<String, String>();
		url.put("url", "restaurant");
		
		int listCnt = adminService.allListCnt(url);
		page.pageInfo(curPage, curBlock, listCnt);
		int start = page.getStartList();
		int end = start+page.getListSize();
		model.addAttribute("pdto",page);
		
		List<RestaurantDTO> resdto2;
		
		if(searchOption==null && keyword==null) {
			// 없을 경우, 전체List에서 paging처리 
			resdto2 = adminService.getStoreList(start, end);
		} else { // 있을 경우, 검색조건에 맞는 애들에서 가져오는 작업
			// 현재 페이지를 넘겨서 출력할 list 가져와야함.
			resdto2 = adminService.getStore(searchOption, keyword, start, end);
		}

		
		model.addAttribute("resdto",resdto2);
		model.addAttribute("curPage", curPage);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("searchOption", searchOption);
		map2.put("keyword",keyword);
		model.addAttribute("map",map2);
		
		return "/admin/store_manage";
	}
	
	// 음식점 정보 업데이트
	@GetMapping("/admin/update_res") 
	public String update_res(Model model, HttpServletRequest request, @RequestParam("no") int no) {
		RestaurantDTO resdto = adminService.getStoreInfo(no);
		model.addAttribute("resdto",resdto);
		return "/admin/update_res";
	}
	
	
	@GetMapping("admin/report")
	public String report(Model model, HttpServletRequest request, HttpServletResponse response, RestaurantDTO resdto, MemberDTO mdto) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mdto")==null) {
			
			return "redirect:/";
		}
		return "admin/report";
	}
	
	@RequestMapping(value="admin/reg_store", method= {RequestMethod.GET,RequestMethod.POST})
	public String reg_store(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mdto")==null) {
			
			return "redirect:/";
		}
		return "admin/reg_store";
	}
	
	@RequestMapping(value="/admin/reg_storePro", method ={RequestMethod.GET,RequestMethod.POST})
	public String reg_storePro(RestaurantDTO rdto, @RequestParam(value="fileName", required=false) MultipartFile file, Model model) {
		String sourceFileName = file.getOriginalFilename();
		File destinationFile; 
		if (sourceFileName == null || sourceFileName.length()==0) { 
			return "admin/reg_store";
		}else {
			destinationFile = new File("res_no_"+rdto.getNo()+"jpg"); 
	        
			destinationFile.getParentFile().mkdirs(); 
		    try {
				file.transferTo(destinationFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:admin/store_manage";
	}
	
	@RequestMapping(value="/admin/reg_storePro/nameChk", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int nameChk(@RequestParam("nameChk") String name) {
			int ckResult = adminService.nameChk(name);
			if (ckResult==0) {
				return 0;
			}
		return 1;
	}
	
	@RequestMapping(value="/admin/reg_storePro/addrChk", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int addrChk(@RequestParam("addr") String addr) {
		int ckResult = adminService.addrChk(addr);
		if (ckResult==0) {
			return 0;
		}
		return 1;
	}
	@GetMapping("/UpdateRes")
	public @ResponseBody int UpdateRes(RestaurantDTO resdto) {
		System.out.println("==아니 왜 안돼?");
		int result = adminService.updateResInfo(resdto);
		System.out.println("=="+result);
		if(result==0) {
			return 0;
		}
		return 1;
	}
	
	@RequestMapping(value="/admin/reserv_manage", method= {RequestMethod.GET, RequestMethod.POST})
	public String booking_manage(HttpServletRequest request, Model model,String searchOption, String keyword,
			@RequestParam(value="curPage", defaultValue="1") int curPage,@RequestParam(value="curBlock", defaultValue="1") int curBlock) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mdto")==null) {
			
			return "redirect:/";
		}
		Pagination page = new Pagination();
		Map<String, String> url = new HashMap<String, String>();
		url.put("url", "booking");
		
		int listCnt = adminService.allListCnt(url);
		page.pageInfo(curPage, curBlock, listCnt);
		int start = page.getStartList();
		int end = start+page.getListSize();
		model.addAttribute("pdto",page);
		
		List<HashMap<String,Object>> bdto;
		
		if(searchOption==null && keyword==null) {
			// 없을 경우, 전체List에서 paging처리
			bdto = adminService.getBookingList(start, end);
		} else { // 있을 경우, 검색조건에 맞는 애들에서 가져오는 작업
			// 현재 페이지를 넘겨서 출력할 list 가져와야함.
			bdto = adminService.getBooking(searchOption, keyword,start, end);
		}
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("searchOption", searchOption);
		map2.put("keyword",keyword);
		model.addAttribute("map",map2);
		model.addAttribute("bdto",bdto);
		System.out.println(bdto);
		return "/admin/reserv_manage";
	}
	
	
	@PostMapping("/booking_cancel")
	public @ResponseBody int booking_cancel(@RequestParam("no") int no) {
		int r = adminService.bCancel(no);
		if(r==0) {
			return r;
		}
		return no;
	}
	
}