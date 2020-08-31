package kr.co.sol.restaurantdetail.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.common.dto.MemberDTO;
import kr.co.sol.common.dto.MenuDTO;
import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.common.dto.ReviewDTO;

@Mapper
public interface RestaurantDetailDAO {
	int idCheck(String id);
	MemberDTO loginProc(MemberDTO mdto);
	int signUpProc(MemberDTO mdto);
	int getMemberNo(String idKey);
	
	List<RestaurantDTO> getRestaurants(RestaurantDTO resdto);
	List<MenuDTO> getMenus(RestaurantDTO resdto);
	int likeRestaurant(HashMap<String,Integer> hmap);
	int dislikeRestaurant(HashMap<String,Integer> hmap);
	int favoriteCheck(HashMap<String,Integer> hmap);
	
	int reviewInsert(ReviewDTO revdto);
	Map<String,Object> reviewCountAndAvg(RestaurantDTO resdto);
	List<ReviewDTO> getReviews(HashMap<String,Integer> hmap2);
	int likeReview(HashMap<String,Integer> hmap);
	int dislikeReview(HashMap<String,Integer> hmap);
	int likeCheck(HashMap<String,Integer> hmap);
	int likePlus(HashMap<String,Integer> hmap);
	int likeMinus(HashMap<String,Integer> hmap);
	void updateClick(int res_no);
}