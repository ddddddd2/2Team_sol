package kr.co.sol.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.common.dto.MemberDTO;
import kr.co.sol.common.dto.PageDTO;
import kr.co.sol.common.dto.RestaurantDTO;

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
	public List<RestaurantDTO> getStore(String searchOption, String keyword, int curPage) {
		System.out.println("임플::"+searchOption+"=="+keyword);
		
		return adminDao.getStore(searchOption, keyword, curPage);
	}
	@Override
	public List<RestaurantDTO> getStoreList(PageDTO pdto, int curPage) { // 현재 페이지 가져오기.
		// paging 처리
		// 전체 리스트 가져오기.;
		
		int total = adminDao.getStoreListCnt(); // 전체 게시물 수
		int listSize = 10;
		int startPage = (curPage-1)*10+1;
		int endPage = (curPage)*10;
//		int allList = adminDao.allList();
		
		System.out.println("startP = "+startPage+"endP = "+endPage);
		return adminDao.getStoreList(startPage, endPage);
	}
	@Override
	public int nameChk(String name) {
		// TODO Auto-generated method stub
		return adminDao.nameChk(name);
	}
}
