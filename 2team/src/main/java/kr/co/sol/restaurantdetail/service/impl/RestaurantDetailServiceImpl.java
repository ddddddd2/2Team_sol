package kr.co.sol.restaurantdetail.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.sol.common.dto.MemberDTO;
import kr.co.sol.common.dto.MenuDTO;
import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.common.dto.ReviewDTO;
import kr.co.sol.restaurantdetail.dao.RestaurantDetailDAO;
import kr.co.sol.restaurantdetail.service.RestaurantDetailService;

@Service
public class RestaurantDetailServiceImpl implements RestaurantDetailService{
	@Autowired
	RestaurantDetailDAO restaurantDetailDao;
    
	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return restaurantDetailDao.idCheck(id);
	}

	@Override
	public MemberDTO loginProc(MemberDTO mdto) {
		// TODO Auto-generated method stub
		return restaurantDetailDao.loginProc(mdto);
	}

	@Override
	public int signUpProc(MemberDTO mdto) {
		// TODO Auto-generated method stub
		return restaurantDetailDao.signUpProc(mdto);
	}

	
	@Override
	public List<RestaurantDTO> getRestaurants(RestaurantDTO resdto) {
		// TODO Auto-generated method stub
		return restaurantDetailDao.getRestaurants(resdto);
	}

	@Override
	public List<MenuDTO> getMenus(RestaurantDTO resdto) {
		// TODO Auto-generated method stub
		return restaurantDetailDao.getMenus(resdto);
	}

	@Override
	public int likeRestaurant(HashMap<String,Integer> hmap) {
		// TODO Auto-generated method stub

		return restaurantDetailDao.likeRestaurant(hmap);
	}

	@Override
	public int dislikeRestaurant(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return restaurantDetailDao.dislikeRestaurant(hmap);
	}

	@Override
	public int favoriteCheck(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return restaurantDetailDao.favoriteCheck(hmap);
	}
	
	@Override
	public int reviewInsert(ReviewDTO revdto, MultipartFile file) {
		
		String sourceFileName = file.getOriginalFilename();
		File destinationFile; 
		if (sourceFileName == null || sourceFileName.length()==0) { 
//		    revdto.setFile1("");
		}else {
//			revdto.setFile1(sourceFileName);
			destinationFile = new File(revdto.getPath()+ sourceFileName); 
	        destinationFile.getParentFile().mkdirs(); 
		    try {
				file.transferTo(destinationFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				 e.printStackTrace();
			}
		}
		
		return restaurantDetailDao.reviewInsert(revdto);
	}

	@Override
	public Map<String, Object> reviewCountAndAvg(RestaurantDTO resdto) {
		// TODO Auto-generated method stub
		return restaurantDetailDao.reviewCountAndAvg(resdto);
	}

	@Override
	public List<ReviewDTO> getReviews(HashMap<String,Integer> hmap2) {
		// TODO Auto-generated method stub
		return restaurantDetailDao.getReviews(hmap2);
	}

	@Override
	public int likeReview(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return restaurantDetailDao.likeReview(hmap);
	}

	@Override
	public int dislikeReview(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return restaurantDetailDao.dislikeReview(hmap);
	}

	@Override
	public int likeCheck(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return restaurantDetailDao.likeCheck(hmap);
	}

	@Override
	public int likePlus(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return restaurantDetailDao.likePlus(hmap);
	}

	@Override
	public int likeMinus(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return restaurantDetailDao.likeMinus(hmap);
	}

	@Override
	@SuppressWarnings("unchecked")
	public void addClick(int res_no, HttpServletRequest request) {

		HttpSession session = request.getSession();
		List<Integer> addClick = (List<Integer>)session.getAttribute("addClick");
		if(addClick==null) {
			addClick = new ArrayList<Integer>();
			addClick.add(res_no);
		session.setAttribute("addClick", addClick);
		} else {
			if(!addClick.contains(res_no)) {
				addClick.add(res_no);
				session.setAttribute("addClick", addClick);
				restaurantDetailDao.updateClick(res_no);
			}
		}

	}
}