package kr.co.sol.custom.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RestaurantDTO {
	private int res_no; // 음식점 번호
	private int c_no; // 카테고리 번호
	private String res_name; // 음식점 이름(상호명)
	private String res_phone; // 음식점 전화번호
	private String res_address; // 음식점 주소
	private String res_time; // 음식점 운영시간 
}
