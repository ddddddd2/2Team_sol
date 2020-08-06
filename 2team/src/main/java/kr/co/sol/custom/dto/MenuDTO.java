package kr.co.sol.custom.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MenuDTO {
	private int res_no; // 음식점 번호
	private String menu_name; // 메뉴 이름
	private int menu_price; // 메뉴 가격 
}
