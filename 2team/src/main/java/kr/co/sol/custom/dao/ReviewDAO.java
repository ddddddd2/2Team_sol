package kr.co.sol.custom.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.custom.dto.ReviewDTO;

@Mapper
public interface ReviewDAO {
	int reviewInsert(ReviewDTO rdto);
}
