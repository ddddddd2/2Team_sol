package kr.co.sol.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.custom.dto.MemberDTO;
<<<<<<< HEAD
import kr.co.sol.custom.dto.RestaurantDTO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDao;
	@Override
	public List<HashMap<String, Object>> getMember() {
		return adminDao.getMember();
	}
	@Override
	public List<HashMap<String, Object>> getMemberList(@Param("searchOption") String searchOption, @Param("keyword") String keyword) {
		// TODO Auto-generated method stub
		return adminDao.getMemberList(searchOption, keyword);
	}
	@Override
	public MemberDTO login(String id, String passwd) {
		// TODO Auto-generated method stub
		return adminDao.login(id, passwd);
	}
	@Override
	public String login2(MemberDTO mdto) {
		// TODO Auto-generated method stub
		return adminDao.login2(mdto);
	}
	@Override
	public MemberDTO loginPro(MemberDTO mdto) {
		System.out.println("impl::"+mdto);
		return adminDao.loginPro(mdto);
	}
	@Override
	public List<RestaurantDTO> getStore(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return adminDao.getStore(searchOption, keyword);
	}
	@Override
	public List<RestaurantDTO> getStoreList() {
		// TODO Auto-generated method stub
		return adminDao.getStoreList();
=======

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDao;
	@Override
	public List<HashMap<String, Object>> getMember() {
		return adminDao.getMember();
	}
	@Override
	public List<HashMap<String, Object>> getMemberList(@Param("searchOption") String searchOption, @Param("keyword") String keyword) {
		// TODO Auto-generated method stub
		return adminDao.getMemberList(searchOption, keyword);
	}
	@Override
	public MemberDTO login(String id, String passwd) {
		// TODO Auto-generated method stub
		return adminDao.login(id, passwd);
	}
	@Override
	public String login2(MemberDTO mdto) {
		// TODO Auto-generated method stub
		return adminDao.login2(mdto);
	}
	@Override
	public MemberDTO loginPro(MemberDTO mdto) {
		System.out.println("impl::"+mdto);
		return adminDao.loginPro(mdto);
>>>>>>> refs/heads/mypage
	}
}
