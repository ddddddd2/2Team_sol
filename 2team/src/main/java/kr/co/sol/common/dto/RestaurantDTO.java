package kr.co.sol.common.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RestaurantDTO {
	private int no; // 음식점 번호
	private int c_no; // 카테고리 번호
	private String c_name; // 카테고리 이름 
	private String name; // 음식점 이름(상호명)
	private String tel; // 음식점 전화번호
	private String address1; // 음식점 기본 주소
	private String address2; // 음식점 상세 주소
	private String hour; // 음식점 운영시간 
}