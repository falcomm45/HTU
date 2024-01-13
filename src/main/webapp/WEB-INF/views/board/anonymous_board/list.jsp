<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>



<style>
/* 여기 스타일 전부 가져다가 복붙하셔야해요  
	본인이 만든 페이지 내용 제일 바깥쪽에 div하나 만들고 "anonymous_box" 이런식으로 특별한?클래스이름을 붙여주세요*/
.anonymous_box {
	width: 100%; height:calc(100% - 40px); overflow-y:scroll;
	padding: 40px;
	background-color: #ffffff;
}
/* 상단에 있는 제목 (여기서는 상담내역) css입니다
	 그대로 복붙하시고 해당div에  .table_topic값 주세요*/
.anonymous_box .table_topic {
	font-size: 20px;
	padding-bottom: 30px;
}

.anonymous_box .table_topic i {
	margin-left: 10px;
}
/* table입니다 */
.anonymous_box table {
	font-size: 14px;
	width: 100%;
	text-align: center;
	margin-left: -19px;
}
/* 테이블의 시작부분 타이틀입니다 */
.table_title {
	font-size: 13px;
	border-top: 1px solid #333333 !important;
	border-bottom: 1px solid #333333 !important;
	height: 32px;
	line-height: 32px;
}

/* /////////////////여기가 수정시작!!  */
.anonymous_box tr {
	height: 40px;
	border-bottom: 1px solid #ebebeb;
}

.anonymous_box tr:first-child {
	background-color: #EEF1F6;
}

.anonymous_box tbody tr:hover {
    background-color: #f2f3f4;
}

.anonymous_box tbody tr:first-child:hover {
    background-color: #EEF1F6;
}
/* /////////////////여기가 수정끝!!  */

/* 각자 만든 td개수만큼만쓰고 총 합이 100이 되도록 잘 분배해서 쓰세요 이부분 제일 신경써서 해주세요*/
.anonymous_box tr td:nth-child(1) {
	width: 5%;
}

.anonymous_box tr td:nth-child(2) {
	width: 32%;
}

.anonymous_box tr td:nth-child(3) {
	width: 11%;
}

.anonymous_box tr td:nth-child(4) {
	width: 10%;
}

.anonymous_box tr td:nth-child(5) {
	width: 42%;
}

/* 검색 폼 스타일링 */
.searchForm {
   background-color: #ffffff;
   border: 1px solid #ddd;
   border-radius: 100px;
   position: absolute;
   top: 100px;
   right: 50px;
   padding: 5px 15px 5px 15px;
}

.search {
   outline: none;
   font-size: 14px;
}

.searchBtn {
   width: 15px;
   height: 15px;
   border: 0;
}

.searchSelect {
   outline: none;
   height: 20px;
   margin-right: 5px;
   font-size: 14px;
   padding: 0 5px;
   border: none;
}

/* 선택된 옵션의 스타일링 */
#searchForm select option:checked {
   background-color: #007bff; /* 선택된 배경색 */
   color: #fff; /* 선택된 텍스트 색상 */
}

.page-navigation {
 height:40px; width:100%; position:relative; background-color:#ffffff;
}

/* 글쓰기 링크 스타일 */
.write-link {
   position: absolute;
   top: 50%;
   left: 80%;
}

.left-aligned-column {
        text-align: left;
    }
</style>

<sec:authentication property="principal.userVO" var="userVO" />

<!-- 부트스트랩 시작 -->
<div class="anonymous_box" style="background-color: white;">
<!-- 카테고리 표시 : 이거는 안에 스타일값 다 들어있으니까 통째로 복사하고 안에내용만 하드코딩하시면됩니다요 -->
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	
<c:if test="${userVO.comdCd == 'USER01'}">
	<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER02'}">		
	<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER03'}">		
	<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>
	
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/common/board/notice/list">커뮤니티</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/common/board/anonymous/list">익명게시판</a></span>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="card" style="width: 102%;">
				<div class="topic">
					<div class="table_topic">익명게시판<i class="fa-solid fa-circle-info" style="color: #333333; position: absolute; top: 2px; left: 94px;"></i></div>

					<!------- 검색기능 ------->
					<form class="searchForm" action="/common/board/anonymous/list"
						method="get" style="position: absolute; top: 17px; right: 35px;">
						<input type="text" name="keyword" class="search" value=""
							placeholder="게시글 검색"> <input type="hidden" name="pageNum"
							value="<c:out value='${pageMaker.cri.pageNum}'/>"> <input
							type="hidden" name="amount"
							value="<c:out value='${pageMaker.cri.amount}' />"> <input
							type="image" src="/resources/images/free-icon-search-149852.png"
							name="submit" class="searchBtn" value="검색"
							style="width: 15px; height: 15px;"> <select
							class="searchSelect" name="type">
							<option value="T"
								<c:out value='${pageMaker.cri.type eq "T"?"selected": "" }'/>>제목</option>
							<option value="C"
								<c:out value='${pageMaker.cri.type eq "C"?"selected": "" }'/>>내용</option>
							<option value="W"
								<c:out value='${pageMaker.cri.type eq "W"?"selected": "" }'/>>작성자</option>
						</select>
					</form>
					<!------- 검색기능 끝------->

				</div>
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
											<th width="1%;" class="text-center"><b>no</b></th>
											<th width="60%;" class="text-center"><b>제목</b></th>
<%-- 											<th width="120px;" class="text-center" <c:if test="${boardVO.userVO.userCd eq 'USER03'}">hidden</c:if>></th> --%>
											<th width="160px;" class="text-center"><b>작성일</b></th>
											<th width="120px;" class="text-center"><b>조회수</b></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="boardVO" items="${boardList}" varStatus="stat">
										    <c:if test="${boardVO.bdYn eq 1}">
										        <!-- bdYn이 1인 경우, 해당 게시물을 히든 처리 -->
										        <tr role="row" class="odd" style="display: none;">
										            <td>${stat.count}</td>
										            <td class="btnDetail left-aligned-column" data-board-code="${boardVO.bdCd}">
										                <a style="cursor: pointer;">${boardVO.bdTitle}</a>
										            </td>
<%-- 										            <td style="display: none;">${boardVO.userVO.userNm}</td> --%>
										            <td><fmt:formatDate value="${boardVO.bdReg}" pattern="yyyy-MM-dd" /></td>
										            <td class="text-center">${boardVO.bdCnt}</td>
										        </tr>
										    </c:if>
										    <c:if test="${boardVO.bdYn ne 1}">
										        <!-- bdYn이 1이 아닌 경우, 해당 게시물을 표시 -->
										        <tr role="row" class="odd">
										            <td>${stat.count}</td>
										            <td class="btnDetail left-aligned-column" data-board-code="${boardVO.bdCd}">
										                <a style="cursor: pointer;">${boardVO.bdTitle}</a>
										            </td>
<%-- 										            <td style="display: none;">${boardVO.userVO.userNm}</td> --%>
										            <td><fmt:formatDate value="${boardVO.bdReg}" pattern="yyyy-MM-dd" /></td>
										            <td class="text-center">${boardVO.bdCnt}</td>
										        </tr>
										    </c:if>
										</c:forEach>
									</tbody>
								</table>
								</br>
								

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 페이지 시작 -->
								<nav class="page-navigation">
									<ul class="pagination">
										<c:if test="${pageMaker.prev}">
											<li class="paginate_button previous"><a
												class="page-link" href="${pageMaker.startPage - 1}">이전
													페이지</a></li>
										</c:if>
										<c:forEach var="num" begin="${pageMaker.startPage }"
											end="${pageMaker.endPage }">
											<li class="paginate_button"><a class="page-link"
												href="${num}">${num}</a></li>
										</c:forEach>
										<c:if test="${pageMaker.next}">
											<li class="paginate_button next"><a class="page-link"
												href="${pageMaker.endPage + 1}">다음 페이지</a></li>
										</c:if>
									</ul>
								</nav>
								<!-- 페이지 끝 -->

								<!-- 페이지 폼 시작 -->
								<form id='actionForm' action="/common/board/anonymous/list"
									method="get">
									<input type="hidden" name="pageNum"
										value="${pageMaker.cri.pageNum}"> <input type="hidden"
										name="amount" value="${pageMaker.cri.amount}"> <input
										type="hidden" name="type"
										value="<c:out value='${pageMaker.cri.type}'/>"> <input
										type="hidden" name="keyword"
										value="<c:out value='${pageMaker.cri.keyword}'/>">
								</form>
								<!-- 페이지 폼 끝 -->
<!-- 부트스트랩 끝 -->

<script>
	$(".btnDetail").on("click", function (event) {
			
		const bdCd = $(this).data("boardCode")
			
		$.ajax({
			
			url: "/common/board/anonymous/count?bdCd="+bdCd,
			type: "get",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: (res) => {
				if (res != null) {
					location.href = "/common/board/anonymous/detail?bdCd="+bdCd;
				}
			}
		});
			
	})
	let actionForm = $('#actionForm'); 
	
	$('.paginate_button a').on('click', function(e) { e.preventDefault(); 
	//걸어둔 링크로 이동하는 것을 일단 막음 
	actionForm.find('input[name="pageNum"]').val($(this).attr('href')); 
	actionForm.submit(); 
	});
	
	let searchForm = $('#searchForm');
	$('#searchForm button').on('click', function(e) {
// 		if (!searchForm.find('option:selected').val()) {
// 			alert('검색종류를 선택하세요');
// 			return false;
// 		}
		if (!searchForm.find('input[name="keyword"]').val()) {
			alert('키워드를 입력하세요');
			return false;
		}
		e.preventDefault();
		searchForm.find('input[name="pageNum"]').val('1');
		searchForm.submit();
	});
</script>
