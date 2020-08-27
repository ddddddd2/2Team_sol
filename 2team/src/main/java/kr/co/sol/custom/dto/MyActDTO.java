package kr.co.sol.custom.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class MyActDTO {
	private int fcnt;  // 북마크(favorite) 개수
	private int rcnt;  // 리뷰 작성 개수
	private int bcnt;  // 예약 작성 개수 
}