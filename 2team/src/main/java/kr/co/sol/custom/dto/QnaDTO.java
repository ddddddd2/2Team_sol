package kr.co.sol.custom.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QnaDTO {
	private int no;
	private int mem_no;
	private String subject;
	private String contents;
	private String createdate;
	private String qnatype;
}
