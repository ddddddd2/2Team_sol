package kr.co.sol.common.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StoreDTO {
	private int no;
	private int c_no;
	private String name;
	private String address1;
	private String tel;
	private String hour;
}
