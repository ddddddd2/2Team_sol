package kr.co.sol.custom.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MenuDTO {
	private int res_no; // 음식점 번호
	private int food_no;// 음식 번호
	private String name;// 음식 이름 
	private int price; // 메뉴 가격 
	private int c_no; // 카테고리 번호
	
}

