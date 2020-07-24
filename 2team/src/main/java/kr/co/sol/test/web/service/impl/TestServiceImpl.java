package kr.co.sol.test.web.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.test.dao.TestDAO;
import kr.co.sol.test.web.service.TestService;

@Service("TestService")
public class TestServiceImpl implements TestService{
	
	@Autowired
	TestDAO testDao;
	
	@Override
	public int getParam() {
		return testDao.getParam();
	}

}
