package kr.co.sol.custom.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
	private int no; // 회원번호
	private String grade_name; // 회원등급
	private String id; // 회원아이디
	private String nick_name; // 회원 닉네임
	private String passwd; // 회원비밀번호
	private String name; // 회원 이름
	private String email; // 회원 이메일
	private String phone; // 회원 핸드폰 번호
	private String gender; //회원 성별 
	private String role; // 회원 역할 (관리자)
	private String createdate; // 회원 역할 (관리자)
	private String image; // 회원 이미지 첨부
}
