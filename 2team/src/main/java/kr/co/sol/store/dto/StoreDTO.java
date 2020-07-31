package kr.co.sol.store.dto;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

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
