package kr.co.sol.custom.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDTO {
	private int rev_no; // 리뷰 번호
	private int res_no; // 음식점 번호
	private int mem_no; // 회원 번호
	private String mem_id; // 회원 아이디
	private String rev_content; // 리뷰 내용
	private String rev_file; // 리뷰 업로드 파일
	private String rev_date; // 리뷰 날짜
	private int rev_rating; // 리뷰 점수
	private String path; // 업로드 파일 경로 
}
