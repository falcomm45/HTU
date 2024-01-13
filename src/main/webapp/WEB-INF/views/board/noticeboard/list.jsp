<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
/* 여기 스타일 전부 가져다가 복붙하셔야해요  
	본인이 만든 페이지 내용 제일 바깥쪽에 div하나 만들고 "notice_box" 이런식으로 특별한?클래스이름을 붙여주세요*/
.notice_box {
	width: 100%;
	padding: 40px;
	background-color: #ffffff; height:calc(100% - 40px); overflow-y:scroll;
}
/* 상단에 있는 제목 (여기서는 상담내역) css입니다
	 그대로 복붙하시고 해당div에  .table_topic값 주세요*/
.notice_box .table_topic {
	font-size: 20px;
	padding-bottom: 30px;
}

.notice_box .table_topic i {
	margin-left: 10px;
}
/* table입니다 */
.notice_box table {
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
.notice_box tr {
	height: 40px;
	border-bottom: 1px solid #ebebeb;
}

.notice_box tr:first-child {
	background-color: #EEF1F6;
}

.notice_box tbody tr:hover {
	background-color: #f2f3f4;
}

.notice_box tbody tr:first-child:hover {
	background-color: #EEF1F6;
}

/* /////////////////여기가 수정끝!!  */

/* 각자 만든 td개수만큼만쓰고 총 합이 100이 되도록 잘 분배해서 쓰세요 이부분 제일 신경써서 해주세요*/
/*
 .notice_box tr td:nth-child(1) { 
 	width: 5%; 
 } 

 .notice_box tr td:nth-child(2) { 
 	width: 32%; 
 } 

 .notice_box tr td:nth-child(3) { 
 	width: 11%; 
 } 

 .notice_box tr td:nth-child(4) { 
 	width: 10%; 
 } 

 .notice_box tr td:nth-child(5) { 
 	width: 42%; 
 } 
*/

/* ------------------------------------- */

/*  .notice_box tr td:nth-child(1) {  */
/*  	width: 3%;  */
/*  }  */

/*  .notice_box tr td:nth-child(2) {  */
/*  	width: 3%;  */
/*  }  */

/*  .notice_box tr td:nth-child(3) {  */
/*  	width: 44%;  */
/*  }  */

/*  .notice_box tr td:nth-child(4) {  */
/*  	width: 12%;  */
/*  }  */

/*  .notice_box tr td:nth-child(5) {  */
/*  	width: 12%;  */
/*  }  */
/*  .notice_box tr td:nth-child(6) {  */
/*  	width: 26%;  */
/*  }  */

/* 검색 폼 스타일링 */
.searchForm {
	background-color: #ffffff;
	border: 1px solid #ddd;
	border-radius: 100px;
	position: absolute;
	top: 23px;
	right: 35px;
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


/* 글쓰기 링크 스타일 */
.write-link {
	position: absolute;
	top: 50%;
	left: 80%;
}

.left-aligned-column {
	text-align: left;
}

/* -------------------------팝업 모달창 스타일  시작------------------------- */
#myModal {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1;
}

#myModal2 {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1;
}

#myModal3 {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1;
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 35%;
	position: absolute;
	left: 38%; 
	
	}

.close-button {
    background-color: #4CAF50;
    color: white;
    padding: 5px 17px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: -5px;
    width: 80px;
    position: relative;
    left: 84%;
    transition: background-color 0.3s ease;
    font-size: 11px;
    width: 62px;
    bottom: -2px;
}

.close-button:hover {
	background-color: #45a049;
}

.checkToday {
	position: relative;
	bottom: -17px;
}

/* -------------------------팝업 모달창 스타일  끝 ------------------------- */

/* 일반 게시글과 상단에 고정된 게시글의 뒷배경을 차별화 */
.notice_box tr.top-pinned {
	background-color: #ffcccb; /* 원하는 배경색 지정 */
}

/* 선택된 행에 대한 스타일을 추가 (선택된 행이 상단에 고정된 게시글인 경우) */
.notice_box tr.top-pinned:hover {
	background-color: #ff9999; /* 원하는 호버 배경색 지정 */
}

.swal2-popup {
	font-size: 16px !important;
	font-weight: bold !important;
}

/* Set the button color for 'Confirm' button */
.swal2-confirm {
	background-color: blue !important; /* Blue color for fix operation */
}

/* Set the button color for 'Confirm' button when releasing */
.swal2-confirm.release {
	background-color: red !important;
	/* Red color for fixClear operation */
}
.page-navigation {
 height:40px; width:100%; position:relative; background-color:#ffffff;
}
</style>

<sec:authentication property="principal.userVO" var="userVO" />

<div class="notice_box">
	<div style="font-size: 12px; color: #888888; margin-bottom: 20px;">
	
<c:if test="${userVO.comdCd == 'USER01'}">
	<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER02'}">		
	<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER03'}">		
	<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>
		<span style="font-size: 12px; color: #888888;">></span> 
		<span style="font-size: 12px; color: #888888;"><a href="/common/board/notice/list">커뮤니티</a></span> 
		<span style="font-size: 12px; color: #888888;">></span> 
		<span style="font-size: 12px; color: #888888;"><a href="/common/board/notice/list">공지사항</a></span>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="card" style="width: 102%;">
				<div class="topic">

					<div class="table_topic">
						공지사항<i class="fa-solid fa-circle-info"
							style="color: #333333; position: absolute; top: 3px; left: 74px;"></i>
					</div>

					<!-- 검색기능 -->
					<form class="searchForm" action="/common/board/notice/list"
						method="get">
						<input type="text" name="keyword" class="search" value=""
							placeholder="게시글 검색"> <input type="hidden" name="pageNum"
							value="<c:out value='${pageMaker.cri.pageNum}'/>"> <input
							type="hidden" name="amount"
							value="<c:out value='${pageMaker.cri.amount}' />"> <input
							type="image" src="/resources/images/free-icon-search-149852.png"
							name="submit" class="searchBtn" value="검색"
							style="width: 15px; height: 15px;"> 
							<select class="searchSelect" name="type">
							<option value="T"
								<c:out value='${pageMaker.cri.type eq "T"?"selected": "" }'/>>제목</option>
							<option value="C"
								<c:out value='${pageMaker.cri.type eq "C"?"selected": "" }'/>>내용</option>
							<option value="W"
								<c:out value='${pageMaker.cri.type eq "W"?"selected": "" }'/>>작성자</option>
						</select>
					</form>

					<!-- 검색기능 끝-->
					<div class="card-body">
						<div id="bootstrap-data-table_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
							<div class="row">
								<div class="col-sm-12">

									<!-- 관리자 테이블 시작 -->
									<c:if test="${userVO.comdCd == 'USER03'}">
									<table id="bootstrap-data-table"
										class="table table-striped table-bordered dataTable no-footer"
										role="grid" aria-describedby="bootstrap-data-table_info">
										<thead>
											<tr role="row" class="table_title">
												<th width="3%;" class="text-center"><b><i class="far fa-square"></i></b></th>
												<th width="5%;" class="text-center"><b>no</b></th>
												<th width="56%;" class="text-center"><b>제목</b></th>
												<th width="12%;" class="text-center"><b>작성자</b></th>
												<th width="12%;" class="text-center"><b>작성일</b></th>
												<th width="12%;" class="text-center"><b>조회수</b></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="noticeVO" items="${list}" varStatus="stat">
												<tr role="row"
													class="odd ${noticeVO.nbYn eq '1' ? 'top-pinned' : ''}"
													<c:if test="${noticeVO.nbYn=='1'}">style="background-color: #E5E5E5; font-weight: bold;"</c:if>>
													<c:if test="${userVO.comdCd == 'USER03'}">
														<td>
															<!-- 상단고정이 되지 않은 경우에는 체크박스 유지 --> <c:if
																test="${noticeVO.nbYn ne '1'}">
																<input type="checkbox" class="checkbox"
																	data-nb-cd="${noticeVO.nbCd}">
															</c:if> <!-- 상단고정이 완료된 경우 클릭 가능한 아이콘 --> <c:if
																test="${noticeVO.nbYn eq '1'}">
																<a href="#" id="" class="toggle-pinned"
																	data-nb-cd="${noticeVO.nbCd}"> <i
																	class="fas fa-thumbtack"></i>
																</a>
															</c:if>
														</td>
													</c:if>
													<td>${stat.index + 1}</td>
													<td class="btnDetail left-aligned-column"
														data-board-code="${noticeVO.nbCd}">
														<!-- nbYn 값이 1인 경우에만 글씨 색상 변경 --> 
														<c:if test="${noticeVO.nbYn eq '1'}">
															<a style="cursor: pointer; color: #bc2649;">${noticeVO.nbTitle}</a>
														</c:if> <!-- nbYn 값이 0인 경우 --> <c:if
															test="${noticeVO.nbYn ne '1'}">
															<a style="cursor: pointer;">${noticeVO.nbTitle}</a>
														</c:if>
													</td>
													<td>${noticeVO.userNm}</td>
													<td><fmt:formatDate value="${noticeVO.nbReg}"
															pattern="yyyy-MM-dd" /></td>
													<td class="text-center">${noticeVO.nbCnt}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									</c:if>
									<!-- 관리자 테이블 끝 -->
									
									<!-- 학생/교수 테이블 시작 -->
									<c:if test="${(userVO.comdCd eq 'USER01' or userVO.comdCd eq 'USER02')}">
									<table id="bootstrap-data-table"
										class="table table-striped table-bordered dataTable no-footer"
										role="grid" aria-describedby="bootstrap-data-table_info">
										<thead>
											<tr role="row" class="table_title">
												<th width="5%;" class="text-center"><b>no</b></th>
												<th width="60%;" class="text-center"><b>제목</b></th>
												<th width="120px;" class="text-center"><b>작성자</b></th>
												<th width="160px;" class="text-center"><b>작성일</b></th>
												<th width="120px;" class="text-center"><b>조회수</b></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="noticeVO" items="${list}" varStatus="stat">
												<tr role="row"
													class="odd ${noticeVO.nbYn eq '1' ? 'top-pinned' : ''}"
													<c:if test="${noticeVO.nbYn=='1'}">style="background-color: #E5E5E5; font-weight: bold;"</c:if>>
													
													<td>${stat.index + 1}</td>
													<td class="btnDetail left-aligned-column"
														data-board-code="${noticeVO.nbCd}">
														<!-- nbYn 값이 1인 경우에만 글씨 색상 변경 --> 
														<c:if test="${noticeVO.nbYn eq '1'}">
															<a style="cursor: pointer; color: #bc2649;">${noticeVO.nbTitle}</a>
														</c:if> <!-- nbYn 값이 0인 경우 --> <c:if
															test="${noticeVO.nbYn ne '1'}">
															<a style="cursor: pointer;">${noticeVO.nbTitle}</a>
														</c:if>
													</td>
													<td>${noticeVO.userNm}</td>
													<td><fmt:formatDate value="${noticeVO.nbReg}"
															pattern="yyyy-MM-dd" /></td>
													<td class="text-center">${noticeVO.nbCnt}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									</c:if>
									<!-- 학생/교수 테이블 끝 -->
									

								</div>
							</div>
						</div>
					</div>
					<c:if test="${userVO.comdCd == 'USER03'}">
						<button class="btn-two mini green"
							style="position: absolute; left: -12px; top: 26px;">
							<a class="sub_text" href="/common/board/notice/create"
								style="color: white;">공지사항 등록</a>
						</button>
					</c:if>
					<c:if test="${userVO.comdCd == 'USER03'}">
						<button class="btn-two mini blue" id="updateYn_btn_fix"
							style="position: absolute; left: 113px; top: 26px;">
							<a href="#" class="sub_text" style="color: white;">게시글 고정</a>
						</button>
						<!-- 						<button class="btn-two mini orange" id="updateYn_btn_release" style="position: absolute; left: 172px; top: 26px;"> -->
						<!--     						<a href="#" class="sub_text" style="color: white;">해제</a> -->
						<!-- 						</button> -->
					</c:if>


				</div>
			</div>
		</div>
	</div>
	

</div>
	<!-------------------------------------------------------------------------------- 스크립트 시작 -------------------------------------------------------------------------------->
	
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

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
	$(".btnDetail").on("click", function (event) {
			
		const nbCd = $(this).data("boardCode")
			
		$.ajax({
			
			url: "/common/board/notice/count?nbCd="+nbCd,
			type: "get",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: (res) => {
				if (res != null) {
					location.href = "/common/board/notice/detail?nbCd="+nbCd;
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
		if (!searchForm.find('option:selected').val()) {
			alert('검색종류를 선택하세요');
			return false;
		}
		if (!searchForm.find('input[name="keyword"]').val()) {
			alert('키워드를 입력하세요');
			return false;
		}
		e.preventDefault();
		searchForm.find('input[name="pageNum"]').val('1');
		searchForm.submit();
	});
	
	

	// 버튼 클릭 이벤트 정의
    $("#updateYn_btn_fix").click(function() {
        // 스위트alert 대화상자 표시
        Swal.fire({
            title: '상단고정',
            text: '해당 게시글을 상단고정 하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            confirmButtonClass: 'swal2-confirm' // Apply blue color to 'Confirm' button
        }).then((result) => {
            if (result.isConfirmed) {
                let formData = new FormData();
                // 수정 함수 호출
                $(".checkbox").each(function(){
                    console.log($(this).is(":checked"));
                    if($(this).is(":checked")){
                        //data-nb-cd="NOBD000814
                        let nbCd = $(this).data("nbCd");
                        console.log("nbCd : " + nbCd);
                        formData.append("nbCd",nbCd);                    
                    }
                });

                $.ajax({
                    url: "/common/board/notice/fix",
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: "POST",
                    dataType: "json",
                    beforeSend: function(xhr){
                        xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
                    },
                    success: function (data) {
                        console.log("data : ", data);
                        // 스위트alert로 변경
                        Swal.fire({
                            icon: 'success',
                            title: '상단고정 완료',
                            text: '상단고정이 완료되었습니다.', // Empty text to maintain the size
                            showConfirmButton: false,
                            timer: 1500
                        }).then(() => {
                            // Reload the page
                            location.reload();
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error("AJAX Error:", textStatus, errorThrown);
                        // 스위트alert로 변경
                        Swal.fire({
                            icon: 'error',
                            title: '에러',
                            text: '게시글 선택 후, 고정버튼을 클릭하여주십시오.',
                            timer: 1500
                        });
                    }
                });
            }
        });
    });

    $("#updateYn_btn_release").click(function() {
        // 스위트alert 대화상자 표시
        Swal.fire({
            title: '상단고정 해제',
            text: '해당 게시글의 상단고정을 해제 하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            confirmButtonClass: 'swal2-confirm release' // Apply red color to 'Confirm' button for release operation
        }).then((result) => {
            if (result.isConfirmed) {
                let formData = new FormData();
                // 수정 함수 호출
                $(".checkbox").each(function(){
                    console.log($(this).is(":checked"));
                    if($(this).is(":checked")){
                        //data-nb-cd="NOBD000814
                        let nbCd = $(this).data("nbCd");
                        console.log("nbCd : " + nbCd);
                        formData.append("nbCd",nbCd);                    
                    }
                });

                $.ajax({
                    url: "/common/board/notice/fixClear",
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: "POST",
                    dataType: "json",
                    beforeSend: function(xhr){
                        xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
                    },
                    success: function (data) {
                        console.log("data : ", data);
                        // 스위트alert로 변경
                        Swal.fire({
                            icon: 'success',
                            title: '상단고정 해제',
                            text: '상단고정이 해제되었습니다.', // Empty text to maintain the size
                            showConfirmButton: false,
                            timer: 1500
                        }).then(() => {
                            // Reload the page
                            location.reload();
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error("AJAX Error:", textStatus, errorThrown);
                        // 스위트alert로 변경
                        Swal.fire({
                            icon: 'error',
                            title: '에러',
                            text: '게시글 선택 후, 해제버튼을 클릭하여주십시오.',
                            timer: 1500
                        }); 
                    }
                });
            }
        });
    });

    // 게시물 수정 함수
    function updateYn(nbCd) {
        console.log("nbCd : " + nbCd);
    }
	
    
 // 상단고정 해제 함수
    function releaseTopPinned(nbCd) {
        // 스위트alert 대화상자 표시
        Swal.fire({
            title: '상단고정 해제',
            text: '해당 게시글의 상단고정을 해제 하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            confirmButtonClass: 'swal2-confirm release' // Apply red color to 'Confirm' button for release operation
        }).then((result) => {
            if (result.isConfirmed) {
                let formData = new FormData();
                formData.append("nbCd", nbCd);

                $.ajax({
                    url: "/common/board/notice/fixClear",
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: "POST",
                    dataType: "json",
                    beforeSend: function(xhr){
                        xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
                    },
                    success: function (data) {
                        console.log("data : ", data);
                        // 스위트alert로 변경
                        Swal.fire({
                            icon: 'success',
                            title: '상단고정 해제',
                            text: '상단고정이 해제되었습니다.', // Empty text to maintain the size
                            showConfirmButton: false,
                            timer: 1500
                        }).then(() => {
                            // Reload the page
                            location.reload();
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error("AJAX Error:", textStatus, errorThrown);
                        // 스위트alert로 변경
                        Swal.fire({
                            icon: 'error',
                            title: '에러',
                            text: '게시글 선택 후, 해제버튼을 클릭하여주십시오.',
                            timer: 1500
                        }); 
                    }
                });
            }
        });
    }

    // 상단고정된 아이콘 클릭 시 상단고정 해제 함수 호출
    $(".toggle-pinned").on("click", function (event) {
        event.preventDefault();
        const nbCd = $(this).data("nbCd");
        releaseTopPinned(nbCd);
    });
</script>