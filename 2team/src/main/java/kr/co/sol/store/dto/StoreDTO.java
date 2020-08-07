package kr.co.sol.store.dto;

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
	private String address;
	private String phone;
	private String time;
}
