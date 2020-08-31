package kr.co.sol.common.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PageDAO {

	int getPage();

}
