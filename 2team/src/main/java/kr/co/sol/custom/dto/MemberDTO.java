package kr.co.sol.custom.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
	private int mem_no; // 회원번호
	private String grade_name; // 회원등급
	private String mem_id; // 회원아이디
	private String mem_passwd; // 회원비밀번호
	private String mem_name; // 회원 이름
	private String mem_email; // 회원 이메일
	private String mem_phone; // 회원 핸드폰 번호
	private String mem_gender;
	private String mem_role; // 회원 역할 (관리자)
}
