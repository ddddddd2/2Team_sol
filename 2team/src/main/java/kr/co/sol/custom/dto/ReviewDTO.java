package kr.co.sol.custom.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDTO {
	private int no; // 리뷰 번호
	private int res_no; // 음식점 번호
	private int mem_no; // 회원 번호
	private String mem_id; // 회원 아이디
	private String content; // 리뷰 내용
	private byte[] file1; // 리뷰 업로드 파일
	private String date1; // 리뷰 작성 날짜
	private int rating; // 리뷰 점수
	private String path; // 업로드 파일 경로 
	private int like_cnt; // 좋아요 개수 
	private int like_on = 0; // 리뷰에 좋아요 했는지 안했는지 구분할라고 만든 변수 
}
