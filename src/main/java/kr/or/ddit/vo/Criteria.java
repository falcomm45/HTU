package kr.or.ddit.vo;

import lombok.Data;

@Data
public class Criteria {
	private int pageNum;
	private int amount;	//한 화면에 보여질 행의 개수
	
	private String type;	//검색
	private String keyword;	//검색
	private int currentPage; //현재페이지
	
	public Criteria(){
		this(1,20);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
