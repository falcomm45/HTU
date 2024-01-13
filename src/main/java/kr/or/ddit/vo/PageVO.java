package kr.or.ddit.vo;

import lombok.Data;

@Data
public class PageVO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri;
	private int totalPages;//전체페이지
	private int realEnd;
	
	public PageVO(Criteria _criteria, int _total) {
		this.cri = _criteria;
		this.total = _total;//20(전체글수)
		
		// 전체글 수 / 한 화면에 보여질 목록의 행 수 => 전체 페이지 수
		totalPages = total / 20;

		// 전체글 수 % 한 화면에 보여질 목록의 행 수
		// => 0이아니면. 나머지가 있다면, 페이지 1증가
		if (total % 20 > 0) {
			totalPages++;
		}
		
		this.startPage = _criteria.getPageNum() / 5 * 5 + 1;
		// 현재페이지 % 페이지크기 => 0일 때 보정
		if (_criteria.getPageNum() % 5 == 0) {
			// 페이지크기를 빼줌
			startPage -= 5;
		}
		
		// 종료페이지번호 = 시작페이지번호 + (페이지크기-1)
		this.endPage = this.startPage + 4;
		
		// 종료페이지번호 > 전체페이지수보다 클 때
		realEnd = this.startPage + 4;
		if (realEnd < this.totalPages) {//5 < 2
			realEnd = totalPages;
		}
		// 전체 데이터 수에 의해 영향을 받는 끝 번호에 대해 다시 계산하는 작업 
		realEnd = (int) (Math.ceil((_total * 1.0) / _criteria.getAmount()));
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
