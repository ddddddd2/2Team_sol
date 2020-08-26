package kr.co.sol.custom.restaurantdetail.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.dto.MenuDTO;
import kr.co.sol.custom.dto.RestaurantDTO;
import kr.co.sol.custom.dto.ReviewDTO;

public interface RestaurantDetailService {
	int idCheck(String id);
	MemberDTO loginProc(MemberDTO mdto);
	int signUpProc(MemberDTO mdto);
	
	//리뷰에서 id로 mem_no 알아내기 위해 
	int getMemberNo(String idKey);

	List<RestaurantDTO> getRestaurants(RestaurantDTO resdto);
	List<MenuDTO> getMenus(RestaurantDTO resdto);
	int likeRestaurant(HashMap<String,Integer> hmap);
	int dislikeRestaurant(HashMap<String,Integer> hmap);
	int favoriteCheck(HashMap<String,Integer> hmap);
	
	int reviewInsert(ReviewDTO revdto , MultipartFile file);
	Map<String,Object> reviewCountAndAvg(RestaurantDTO resdto);
	List<ReviewDTO> getReviews(HashMap<String,Integer> hmap2);
	int likeReview(HashMap<String,Integer> hmap);
	int dislikeReview(HashMap<String,Integer> hmap);
	int likeCheck(HashMap<String,Integer> hmap);
	int likePlus(HashMap<String,Integer> hmap);
	int likeMinus(HashMap<String,Integer> hmap);
	void addClick(int res_no, HttpServletRequest request);
}
