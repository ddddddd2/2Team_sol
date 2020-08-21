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

import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.dto.StoreDTO;
import kr.co.sol.store.service.StoreService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@Autowired
	StoreService storeService;
	@RequestMapping(value="/admin/login",method= {RequestMethod.POST})
	public String login(HttpServletRequest request , @RequestParam(required = false) String id, @RequestParam(required = false) String passwd, Model model, MemberDTO mdto) {
		HttpSession session = request.getSession();
		System.out.println("id, pw :: "+id+" "+passwd);
		if(id!=null && passwd !=null) {
			MemberDTO mdto2 = adminService.login(id, passwd);
			session.setAttribute("mdto", mdto2);
			System.out.println(mdto2);
		} else {
			System.out.println("널이다 ");
			session.setAttribute("mdto",null);
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", "test_id");
			map.put("passwd", "1234");
			System.out.println(map);
			session.setAttribute("data", map);
		}
		System.out.println("login:id="+id);
		System.out.println("login:pw="+passwd);
//		if(role)
		return "/admin/login";
	}
	@PostMapping(value="/adminLoginPro")
	public @ResponseBody int adminLoginPro(HttpServletRequest request, MemberDTO mdto, HttpSession session) {
		System.out.println("0"+mdto);
			mdto = adminService.loginPro(mdto);
		if(mdto== null) {
			return 0;
		}
		if ("user".equals(mdto.getRole())) {
			return 1;	
		} 
		request.getSession();
		session.setAttribute("mdto", mdto);
		return 2;
	}
	
	@GetMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
//	@RequestMapping(value="/loginPro", method ={RequestMethod.GET,RequestMethod.POST})
//	public String loginPro(MemberDTO mdto, Model model, HttpServletRequest request) {
//		String role = adminService.login2(mdto);
//		System.out.println("loginPro::role="+role);
//		if("admin".equals(role)) {
//			HttpSession session = request.getSession();
//			Integer no = mdto.getNo();
//			session.setAttribute("idKey", no);
//		} else if(role==null) { 
//			String msg = "올바른 아이디와 비밀번호가 맞지 않습니다";
//			model.addAttribute("msg",msg);
//			return "/admin/index";
//		}
//		
//		return "/admin/index";
//	}
	
	@RequestMapping(value="/admin/index", method= {RequestMethod.GET, RequestMethod.POST})
	public String adminIndex(Model model, HttpServletRequest request,
			HttpServletResponse response){
		return "admin/index";
	}
	
	
	@RequestMapping(value="admin/mem_manage", method = {RequestMethod.GET,RequestMethod.POST})
	public String mm(Model model, HttpServletRequest request, HttpServletResponse response,MemberDTO mdto,
			@RequestParam(required=false) String searchOption,
			@RequestParam(required=false) String keyword) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mdto")==null) {
			
			return "redirect:/";
		}
		List<HashMap<String, Object>> map= new ArrayList<HashMap<String, Object>>();
		
		// 맨 처음 들어왔을 때 전체 리스트 불러오기 위해.
		if(searchOption==null && keyword==null) {
			// 전체 리스트 불러온다.
			map = adminService.getMember();
		} else {
			// 검색어와 옵션이 있을 경우 해당 내용으로 검색한 결과를 가져온다.
			map = adminService.getMemberList(searchOption,keyword);
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
	public String sm(HttpServletRequest request, String searchOption, String keyword, Model model, StoreDTO sdto) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mdto")==null) {
			return "redirect:/";
		} // 세션에 담긴게 없으면 로그인 화면으로
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
		HttpSession session = request.getSession();
		if(session.getAttribute("mdto")==null) {
			
			return "redirect:/";
		}
		return "admin/report";
	}
	
	@GetMapping("admin/reg_store")
	public String reg_store(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("mdto")==null) {
			
			return "redirect:/";
		}
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
	
	@RequestMapping(value="/juso", method = {RequestMethod.GET,RequestMethod.POST})
	
	public String map() {
		return "admin/juso";
	}
}