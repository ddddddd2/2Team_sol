package kr.co.sol.custom.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
	int currentPage; 		//현제 페이지
	int linePerPage = 5; 	//페이지당 리뷰 수
	int allCount; 			//전체 리뷰 수 	 
	int allPage; 			//전체 페이지	 
	int pageBlock = 5;		//페이지 블락	
	int currPageBlock;		//현제 페이지 블락	
	
	int startPage;			//시작 페이지
	int endPage;			//끝 페이지 
}
