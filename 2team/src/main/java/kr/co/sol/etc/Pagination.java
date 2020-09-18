package kr.co.sol.etc;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pagination {
	private int listSize = 10; // 한페이지당 보여줄 게시물 수
	private int rangeSize = 10; // 한 페이지 범위에 보여줄 페이지의 수
	private int page; // 현재 목록의 페이지 번호
	private int range; // 각 페이지 범위 시작 번호
	private int listCnt; // 전체 게시물의 수
	private int pageCnt; // 전체 페이지 범위의 개수
	private int startPage; // 각 페이지 범위 시작 번호
	private int startList; // 게시판 시작 번호 
	private int endPage; // 각 페이지 범위 끝 번호
	private boolean prev; // 이전 페이지 여부
	private boolean next; // 다음 페이지 여부
	
	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		
		// 전체 페이지 수
		this.pageCnt = (int) Math.ceil((double)listCnt/listSize);
		
		// 시작 페이지
		this.startPage = (range - 1)*rangeSize +1;
		
		// 끝페이지
		this.endPage = range*rangeSize;
		
		//게시판 시작 번호
		
		this.startList = (page -1)*listSize;
		
		// 이전 버튼 상태
		this.prev = range ==1?false : true;
		
		// 다음 버튼 상태
		this.next = pageCnt > endPage ? true : false;
		if(this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}

}
