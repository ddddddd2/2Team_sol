package kr.co.sol.custom.service;

import org.springframework.web.multipart.MultipartFile;

import kr.co.sol.custom.dto.ReviewDTO;

public interface ReviewService {
	int reviewInsert(ReviewDTO rdto , MultipartFile file);
}
