package kr.co.sol.booking.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookingDTO {
	private int b_no;
	private int res_no;
	private int mem_no;
	private String b_date;
}
