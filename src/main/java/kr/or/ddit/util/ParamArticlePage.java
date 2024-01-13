package kr.or.ddit.util;

import java.util.List;

import kr.or.ddit.vo.BoardVO;

//페이징 관련 정보 + 게시글 정보
public class ParamArticlePage<T> {
	// 전체글 수
	private int total;
	// 현재 페이지 번호
	private int currentPage;
	// 전체 페이지 수
	private int totalPages;
	// 블록의 시작 페이지 번호
	private int startPage;
	// 블록의 종료 페이지 번호
	private int endPage;
	//검색어
	private String keyword = "";
	//요청URL
	private String url;
	// 데이터
	private List<T> content;

	// 생성자(Constructor) : 페이징 정보를 생성
	public ParamArticlePage(int total, int currentPage, int size, List<T> content) {
		// size : 한 화면에 보여질 목록의 행 수
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;

		// 전체글 수가 0이면?
		if (total == 0) {
			totalPages = 0; // 전체 페이지 수
			startPage = 0; // 블록 시작번호
			endPage = 0; // 블록 종료번호
		} else {// 글이 있다면
			// 전체글 수 / 한 화면에 보여질 목록의 행 수 => 전체 페이지 수
			totalPages = total / size;

			// 전체글 수 % 한 화면에 보여질 목록의 행 수
			// => 0이아니면. 나머지가 있다면, 페이지 1증가
			if (total % size > 0) {
				totalPages++;
			}

			//페이지 블록  시작페이지를 구하는 공식!
			// 시작페이지 = 현재페이지 / 페이지크기 * 페이지크기 + 1
			startPage = currentPage / 5 * 5 + 1;

			// 현재페이지 % 페이지크기 => 0일 때 보정
			if (currentPage % 5 == 0) {
				// 페이지크기를 빼줌
				startPage -= 5;
			}

			// 종료페이지번호 = 시작페이지번호 + (페이지크기-1)
			endPage = startPage + 4;

			// 종료페이지번호 > 전체페이지수보다 클 때
			if (endPage > totalPages) {
				endPage = totalPages;
			}

		}
	}//end 생성자

	public ParamArticlePage(int total2, int currentPage2, int i, int j, List<BoardVO> list) {
		// TODO Auto-generated constructor stub
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public List<T> getContent() {
		return content;
	}

	public void setContent(List<T> content) {
		this.content = content;
	}
	
	//전체 글의 수가 0인가?
	public boolean hasNoAriticles() {
		return this.total == 0;
	}
	
	//데이터가 있니?
	public boolean hasArticles() {
		return this.total > 0;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	//페이징 블록을 자동화
	public String getPagingArea() {
		String pagingArea = "";
		
		pagingArea +="<div class='col-sm-12 col-md-7'>";					
		pagingArea +="<div class='dataTables_paginate paging_simple_numbers' id='dataTable_paginate'>";
		pagingArea +="<ul class='pagination'>";
		pagingArea +="<li class='paginate_button page-item previous ";
		if(this.startPage<6) {
			pagingArea += "disabled";
		}
		pagingArea +="' id='dataTable_previous'>";
		pagingArea +="<a href='"+this.url+"&keyword="+this.keyword+"&currentPage="+(this.startPage-5)+"'";
		pagingArea +="aria-controls='dataTable' data-dt-idx='0' tabindex='0'";
		pagingArea +="class='page-link'>&lt</a></li>";
		
		for(int pNo=this.startPage;pNo<=this.endPage;pNo++) {
			pagingArea +="<li class='paginate_button page-item ";
				if(this.currentPage==pNo) {
					pagingArea +="active";
				}
			pagingArea +="'>";
			pagingArea +="<a href='"+this.url+"&keyword="+this.keyword+"&currentPage="+pNo+"' ";
			pagingArea +="aria-controls='dataTable' data-dt-idx='1' tabindex='0' ";
			pagingArea +="class='page-link'>"+pNo+"</a></li>";
		}
		pagingArea +="<li class='paginate_button page-item next ";
			if(this.endPage>=this.totalPages) {
				pagingArea +="disabled";
			}
		pagingArea +="' id='dataTable_next'><a href='"+this.url+"&keyword="+this.keyword+"&currentPage="+(this.startPage+5)+"' "; 
		pagingArea +="aria-controls='dataTable' data-dt-idx='7' tabindex='0' ";
		pagingArea +="class='page-link'>&gt</a></li></ul></div></div>";
		
		return pagingArea;
	}
}






