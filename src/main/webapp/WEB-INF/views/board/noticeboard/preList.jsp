<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
	

/* 공통 스타일 */
/* .text-center { */
/* 	text-align: center; */
/* } */

/* /* 카드 스타일 */ */
/* .card-body { */
/* 	width: 60%; */
/* 	height: 10%; */
/* } */

/* .card .topic { */
/* 	position: relative; */
/* 	padding-top: 30px; */
/* } */

/* .notice_topic { */
/* 	font-size: 30px; */
/* 	padding-bottom: 30px; */
/* } */

/* .FreeBoard_box .notice_topic i { */
/* 	margin-left: 10px; */
/* 	color: #333333; /* 추가된 부분 */ */
/* } */

/* .FreeBoard_box table { */
/* 	font-size: 14px; */
/* 	width: 168%; */
/* } */

/* .FreeBoard_box table tbody tr { */
/*     cursor: pointer; */
/* } */

/* .FreeBoard_box table tbody tr td:nth-child(2) { */
/*     text-align: left; /* 두 번째 열(제목)만 왼쪽 정렬 */ */
/* } */

/* .FreeBoard_box table tbody tr td:not(:nth-child(2)) { */
/*     text-align: center; /* 나머지는 가운데 정렬 */ */
/* } */

/* /* Optional: If you want to center text in the first column vertically */ */
/* .FreeBoard_box table tbody tr td:nth-child(2) { */
/*     vertical-align: middle; */
/* } */

/* .FreeBoard_box table tbody tr { */
/* 	height: 20px; /* 적절한 높이로 조절해주세요 */ */
/* 	line-height: 20px; /* 적절한 높이로 조절해주세요 */ */
/* } */

/* .table_title { */
/* 	font-size: 13px; */
/* 	border: 1px solid #d1d0d0; */
/* 	height: 32px; */
/* 	line-height: 32px; */
/* 	background-color: #f8f9fa; */
/* 	font-weight: bold; /* 글씨 굵게 */ */
/* } */
/* .card { */
/* 	height: 102%; */
/* } */

/* 검색 폼 스타일링 */
/*  #searchForm {  */
/*      position: absolute;  */
/*      left: 76%;  */
/*      top: 40px;  */
/*      display: flex;  */
/*      align-items: center;  */
/*  }  */

/*  #searchForm select, #searchForm input, #searchForm button {  */
/*      height: 30px;  */
/*      margin-right: 5px;  */
/*  }  */

/*  #searchForm select {  */
/*      border: 1px solid #ccc;  */
/*      border-radius: 3px;  */
/*  }  */

/*  #searchForm input {  */
/*      border: 1px solid #ccc;  */
/*      border-radius: 3px;  */
/*      padding: 0 5px;  */
/*  }  */

/*  #searchForm button {  */
/*      border: 1px solid #000;  */
/*      color: #000;  */
/*      background-color: #fff;  */
/*      cursor: pointer;  */
/*  }  */

/*  /* 선택된 옵션의 스타일링  */ */
/*  #searchForm select option:checked {  */
/*      background-color: #007bff; /* 선택된 배경색 */  */
/*      color: #fff; /* 선택된 텍스트 색상 */  */
/*  } */ */

/* 페이지 네비게이션 스타일 */
.page.navigation {
	margin-top: 20px;
}

.pagination {
	display: flex;
	justify-content: center;
	list-style: none; /* 추가된 부분 */
	padding: 0; /* 추가된 부분 */
}


.pagination li {
	margin: 0 5px;
}

.pagination a {
	text-decoration: none;
	color: #333;
	font-weight: bold;
	padding: 5px 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	cursor: pointer;
}

.pagination .active a {
	background-color: #007bff;
	color: #fff;
}

/* 글쓰기 링크 스타일 */
.write-link {
	position: absolute;
	top: 50%;
	left: 80%;
}

.page-navigation {
  position: absolute; left: -8%;
  bottom: 1%;
  width: 100%;
  text-align: center;
}
</style>
<!-- 부트스트랩 시작 -->
<div class="notice_box" style="background-color: white;">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
			</br>
			</br>
				<div class="topic">
					</br>
					</br>
					</br>
					<div class="notice_topic"
						style="position: absolute; left: 3%; top: 38%">
						공지사항<i class="fa-solid fa-circle-info" style="position: absolute; top: 1px;"></i>
					</div>
					<!------- 검색기능 ------->
					<form id="searchForm" action="/common/board/notice/list" method="get"
						style="position: absolute; left: 75%; top: 40px;">
						<select name="type">
							<option value=""
								<c:out value='${pageMaker.cri.type == null? "selected": ""}'/>>선택</option>
							<option value="T"
								<c:out value='${pageMaker.cri.type eq "T"?"selected": "" }'/>>제목</option>
							<option value="C"
								<c:out value='${pageMaker.cri.type eq "C"?"selected": "" }'/>>내용</option>
							<option value="W"
								<c:out value='${pageMaker.cri.type eq "W"?"selected": "" }'/>>작성자</option>
						</select> 
						<input type="text" name="keyword" style="border: 1px solid #ccc;"
							value="<c:out value='${pageMaker.cri.keyword}'/>"> 
						<input type="hidden" name="pageNum"
							value="<c:out value='${pageMaker.cri.pageNum}'/>"> 
						<input type="hidden" name="amount"
							value="<c:out value='${pageMaker.cri.amount}' />">
						<button class="btn btn-default"
							style="border: 1px solid #000; color: #000; position: absolute; top: 0px; right: -66px;"><a style="position: relative; top: -8px;">검색</a></button>
					</form>
					<!------- 검색기능 끝------->

				</div>
				<c:if test="${userVO.comdCd eq 'USER03'}">
					<button class="btn-two" onclick="location.href='/common/board/notice/create'">글쓰기</button>
				</c:if>
				<div class="card-body">
					<div id="bootstrap-data-table_wrapper"
						class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
						<div class="row">
							<div class="col-sm-12">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered dataTable no-footer"
									role="grid" aria-describedby="bootstrap-data-table_info">
									<thead>
										<tr role="row" class="table_title">
											<th width="1%;" class="text-center"><b>No</b></th>
											<th width="60%;" class="text-center"><b>제목</b></th>
											<th width="120px;" class="text-center"><b>작성자</b></th>
											<th width="160px;" class="text-center"><b>작성일</b></th>
											<th width="120px;" class="text-center"><b>조회수</b></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="vo" items="${list}" varStatus="stat">
											<tr role="row" class="odd" style="cursor: pointer;">
												<td style="padding-right: 2px;" class="text-center">${vo.rn}</td>
												<td class="btnDetail" data-board-code="${vo.nbCd}">
													${vo.nbTitle}</td>
												<td>${vo.empCd}</td>
												<td><fmt:formatDate value="${vo.nbReg}"
														pattern="yyyy-MM-dd" /></td>
												<td class="text-center">${vo.nbCnt}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								
								<!-- 페이지 시작 -->
								<nav class="page-navigation">
									<ul class="pagination">
										<c:if test="${pageMaker.prev}">
											<li class="paginate_button previous"><a class="page-link" href="${pageMaker.startPage - 1}">이전</a></li>
										</c:if>
										<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
											<li class="paginate_button"><a class="page-link" href="${num}">${num}</a></li>
										</c:forEach>
										<c:if test="${pageMaker.next}">
											<li class="paginate_button next"><a class="page-link" href="${pageMaker.endPage + 1}">다음</a></li>
										</c:if>
									</ul>
								</nav>
								<!-- 페이지 끝 -->
								
								<!-- 페이지 폼 시작 -->
								<form id='actionForm' action="/common/board/notice/list" method="get">
									<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
									<input type="hidden" name="amount" value="${pageMaker.cri.amount}"> 
									<input type="hidden" name="type" value="<c:out value='${pageMaker.cri.type}'/>"> 
									<input type="hidden" name="keyword" value="<c:out value='${pageMaker.cri.keyword}'/>">
								</form>
								<!-- 페이지 폼 끝 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>