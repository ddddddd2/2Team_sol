package kr.co.sol.common.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookingDTO {
	private int no;
	private int res_no;
	private int mem_no;
	private String date1;
	private String date2;
	private String content;
	private String price;
	private String status;
	private String menu;
	
}