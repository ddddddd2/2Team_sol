package kr.co.sol.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.common.dao.MemberDAO;
import kr.co.sol.common.dto.PageDTO;
import kr.co.sol.common.dto.RestaurantDTO;
import kr.co.sol.etc.Pagination;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDao;
	@Autowired
	MemberDAO memberDao;
	
	@Override
	public List<HashMap<String, Object>> getMember(int start, int end) {
		return adminDao.getMember(start, end);
	}
	@Override
	public List<HashMap<String, Object>> getMemberList(@Param("searchOption") String searchOption, @Param("keyword") String keyword, int start, int end) {
		// TODO Auto-generated method stub
		return adminDao.getMemberList(searchOption, keyword,start, end);
	}
	@Override
	public List<RestaurantDTO> getStore(String searchOption, String keyword,int start, int end) {
		
		return adminDao.getStore(searchOption, keyword, start, end);
	}
	@Override
	public List<RestaurantDTO> getStoreList(@Param("start") int start, @Param("end") int end) { // 현재 페이지 가져오기.
		
		return adminDao.getStoreList(start, end);
	}
	@Override
	public int nameChk(String name) {
		// TODO Auto-generated method stub
		return adminDao.nameChk(name);
	}
	@Override
	public List<HashMap<String,Object>> getBookingList(int start, int end) {
		// TODO Auto-generated method stub
		return adminDao.getBookingList(start, end);
	}
	@Override
	public List<HashMap<String,Object>> getBooking(@Param("searchOption") String searchOption, @Param("keyword") String keyword,int start, int end) {
		// TODO Auto-generated method stub
		return adminDao.getBooking(searchOption, keyword,start, end);
	}
	@Override
	public int bCancel(int no) {
		// TODO Auto-generated method stub
		return adminDao.bCancel(no);
	}
	@Override
	public RestaurantDTO getStoreInfo(int no) {
		// TODO Auto-generated method stub
		return adminDao.getStoreInfo(no);
	}
	@Override
	public int addrChk(String addr) {
		// TODO Auto-generated method stub
		return adminDao.addrChk(addr);
	}
	@Override
	public int updateResInfo(RestaurantDTO resdto) {
		return adminDao.updateResInfo(resdto);
	}
	@Override
	public int allListCnt(Map<String, String> url) {
		// TODO Auto-generated method stub
		return adminDao.allListCnt(url);
	}
}
