<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="/resources/js/jquery.min.js"></script>

<style>
	/* 여기 스타일 전부 가져다가 복붙하셔야해요  
	본인이 만든 페이지 내용 제일 바깥쪽에 div하나 만들고 "counsel_box" 이런식으로 특별한?클래스이름을 붙여주세요*/
	.reservation_box{width:100%; height:100%; overflow-y:scroll; padding:40px; background-color:#ffffff;}
	/* 상단에 있는 제목 (여기서는 상담내역) css입니다
	 그대로 복붙하시고 해당div에  .table_topic값 주세요*/
	.reservation_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.reservation_box .table_topic i{margin-left:10px;}
	/* table입니다 */
	.reservation_box table{font-size:14px; width:100%; text-align:center;}
	/* 테이블의 시작부분 타이틀입니다 */
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	
	/* /////////////////여기가 수정시작!!  */
	.reservation_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.reservation_box tr:first-child{background-color:#EEF1F6;}
	.reservation_box tr:hover{background-color:#f2f3f4;}
	.reservation_box tr:first-child:hover{background-color:#EEF1F6;}
	/* /////////////////여기가 수정끝!!  */
	
	/* 각자 만든 td개수만큼만쓰고 총 합이 100이 되도록 잘 분배해서 쓰세요 이부분 제일 신경써서 해주세요*/
	.reservation_box tr td:nth-child(1){width:10%;}
	.reservation_box tr td:nth-child(2){width:15%;}
	.reservation_box tr td:nth-child(3){width:15%;}
	.reservation_box tr td:nth-child(4){width:16%;}
	.reservation_box tr td:nth-child(5){width:12%;}
	.reservation_box tr td:nth-child(6){width:12%;}
	.reservation_box tr td:nth-child(7){width:10%;}
	.reservation_box tr td:nth-child(8){width:10%;}
</style>
<!-- Modal1 -->

<sec:authentication property="principal.userVO" var="userVO" />

<div class="modal fade" id="resDetailModal" tabindex="-1"
	aria-labelledby="roomResListModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="resDetailModalLabel">Modal
					title</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" id="resDetailModalBody"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"
					data-bs-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<div class="reservation_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
<c:if test="${userVO.comdCd == 'USER02'}">		
<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER01'}">
<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/reservation/list">시설예약</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/reservation/list">예약내역</a></span>
	</div>
	<div class="table_topic">예약내역<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	<table>
		<tr class="table_title">
			<td>no</td>
			<td>건물</td>
			<td>호실</td>
			<td>예약일</td>
			<td>시작시간</td>
			<td>종료시간</td>
			<td>상세내역</td>
			<td>비고</td>
		</tr>
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
		<c:forEach items="${reservationList}" varStatus="cnt" var="resVO">
			<fmt:formatDate value="${resVO.resEddt}" pattern="yyyy-MM-dd"
				var="endDate" />
			<tr>
				<td>${cnt.count}</td>
				<td>${resVO.commonDetailVO.comdNm}</td>
				<td>${fn:substring(resVO.roomCd, 6, 9)}</td>
				<td><fmt:formatDate value="${resVO.resStdt}" pattern="yy-MM-dd" /></td>
				<td><fmt:formatDate value="${resVO.resStdt}" pattern="HH:mm" /></td>
				<td><fmt:formatDate value="${resVO.resEddt}" pattern="HH:mm" /></td>
				<td>
					<p class="btn-two mini gray resDetailBtn"
						data-res-cd="${resVO.resCd}" style="cursor:pointer;">상세</p> 
				</td>
				<td>
					<c:if
						test="${endDate > today }">
						<p class="btn-two mini orange resCancelBtn"
							data-res-cd="${resVO.resCd}" style="cursor:pointer;">취소</p>
					</c:if>
				</td>
				
			</tr>
		</c:forEach>
	</table>
	<!-- 페이지 시작 -->
<!-- 	<nav class="page-navigation"> -->
<!-- 		<ul class="pagination"> -->
<%-- 			<c:if test="${pageMaker.prev}"> --%>
<!-- 				<li class="paginate_button previous"><a class="page-link" -->
<%-- 					href="${pageMaker.startPage - 1}">이전</a></li> --%>
<%-- 			</c:if> --%>
<%-- 			<c:forEach var="num" begin="${pageMaker.startPage }" --%>
<%-- 				end="${pageMaker.endPage }"> --%>
<%-- 				<li class="paginate_button"><a class="page-link" href="${num}">${num}</a></li> --%>
<%-- 			</c:forEach> --%>
<%-- 			<c:if test="${pageMaker.next}"> --%>
<!-- 				<li class="paginate_button next"><a class="page-link" -->
<%-- 					href="${pageMaker.endPage + 1}">다음</a></li> --%>
<%-- 			</c:if> --%>
<!-- 		</ul> -->
<!-- 	</nav> -->
	<!-- 페이지 끝 -->

	<!-- 페이지 폼 시작 -->
	<form id='actionForm' action="/common/board/free/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="type"
			value="<c:out value='${pageMaker.cri.type}'/>"> <input
			type="hidden" name="keyword"
			value="<c:out value='${pageMaker.cri.keyword}'/>">
	</form>
	<!-- 페이지 폼 끝 -->
</div>

<script>
	
	$(".resDetailBtn").on("click", function() {
		
		const resCd = $(this).data("resCd");
		
		$.ajax({
			url: "/reservation/detail?resCd="+resCd,
			type: "get",
			dataType: "json",
			success: res => {
				console.log(res);
				$("#resDetailModalLabel").text("예약 상세 보기")
				
				let txt = `
					<div class="form-group">
						<div class="row">
							<div class="col-md-6">
								<label for="buildingName">건물명</label>
								<div class="form-control-plaintext" id="buildingName">\${res.commonDetailVO.comdNm}</div>
							</div>
							<div class="col-md-6">
								<label for="buildingZip">우편번호</label>
								<div class="form-control-plaintext" id="buildingZip">\${res.roomVO.buildingVO.bldZip}</div>
							</div>
						</div>
						<hr/>
						<div class="row">
							<div class="col-md-6">
								<label for="buildingAddr1">주소</label>
								<div class="form-control-plaintext" id="buildingAddr1">\${res.roomVO.buildingVO.bldAddr1}</div>
							</div>
							<div class="col-md-6">
								<label for="buildingAddr2">상세주소</label>
								<div class="form-control-plaintext" id="buildingAddr2">\${res.roomVO.buildingVO.bldAddr2} \${res.roomCd.substr(6)}호</div>
							</div>
						</div>
						<hr/>
						<div class="row">
							<div class="col-md-4">
								<label for="resDate">예약일</label>
								<div class="form-control-plaintext" id="resDate">\${res.resDate}</div>
							</div>
							<div class="col-md-4">
								<label for="startTime">시작시간</label>
								<div class="form-control-plaintext" id="startTime">\${res.startTime}</div>
							</div>
							<div class="col-md-4">
								<label for="endTime">종료시간</label>
								<div class="form-control-plaintext" id="endTime">\${res.endTime}</div>
							</div>
						</div>
						<hr/>
						<div class="row">
							<div class="col-md-12">
								<label for="resReson">예약사유</label>
								<div class="form-control-plaintext" id="resReson">\${res.resRsn}</div>
							</div>
						</div>
					</div>
				`
				$("#resDetailModalBody").html(txt);
				
				$("#resDetailModal").modal("show");
			}
		})
	})
	
	
	$(".resCancelBtn").on("click", function() {
		const resCd = $(this).data("resCd");
		
		Swal.fire({
			/* title: '상담을 취소하시겠습니까?', */
			text: "예약을 취소하시겠습니까?",
			icon: "question",
			/* warning,error,success,info,question */
			width: 300,
			/* padding: "4em", */
			position: "top",
			showCancelButton: true,
			confirmButtonColor: "#3085d6",
			cancelButtonColor: "#d33",
			confirmButtonText: "예약취소",
			cancelButtonText: "뒤로가기",
			/* reverseButtons: true, */ // 버튼 순서 거꾸로
		}).then((result) => {
			console.log(result);
			if (result.isConfirmed) {
				$.ajax({
					url: "/reservation/delete?resCd="+resCd,
					type: "get",
					success: res => {
						if (res == 1) {
							alertSuccess("예약이 취소되었습니다.")
							$(this).closest('tr').remove();
						}
					}
				})
			}
		});
	})
</script>









