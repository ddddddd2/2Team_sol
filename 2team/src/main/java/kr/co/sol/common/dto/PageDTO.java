package kr.co.sol.common.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
	int currentPage; 		//현재 페이지
	int linePerPage = 5; 	//페이지당 라인 수
	int allCount; 			//�쟾泥� 由щ럭 �닔 	 
	int allPage; 			//�쟾泥� �럹�씠吏�	 
	int pageBlock = 5;		//페이지 블럭(한줄 페이지 수)	
	int currPageBlock;		//�쁽�옱 �럹�씠吏� 釉붾씫	
	
	int startPage;			//�떆�옉 �럹�씠吏�
	int endPage;			//�걹 �럹�씠吏� 
}
