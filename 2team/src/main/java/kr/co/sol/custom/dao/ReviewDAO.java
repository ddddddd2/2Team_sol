package kr.co.sol.custom.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.custom.dto.ReviewDTO;

@Mapper
public interface ReviewDAO {
	int reviewInsert(ReviewDTO rdto);
	Map<String,Object> reviewCountAndAvg(int res_no);
	List<ReviewDTO> getReviews(int res_no);
}
