package kr.co.sol.custom.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.custom.common.dao.PageDAO;
import kr.co.sol.custom.common.service.PageService;
@Service("PageService")
public class PageServiceImpl implements PageService {
	
	@Autowired
	PageDAO pageDao;
		
	@Override
	public int getPage() {
		return pageDao.getPage();
	}

}
