<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- style.css -->
<!-- <link href="/resources/css/counsel.css" rel="stylesheet" type="text/css"> -->
<style>
	.counsel_box{width:100%; height:100%; padding:40px; background-color:#ffffff;}
	.counsel_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.counsel_box .table_topic i{margin-left:10px;}
	.counsel_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.counsel_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.counsel_box tr:first-child{background-color:#EEF1F6;}
	.counsel_box tr:hover{background-color:#f2f3f4;}
	.counsel_box tr:first-child:hover{background-color:#EEF1F6;}
	.counsel_box tr td:nth-child(1){width:10%;}
	.counsel_box tr td:nth-child(2){width:15%;}
	.counsel_box tr td:nth-child(3){width:15%;}
	.counsel_box tr td:nth-child(4){width:15%;}
	.counsel_box tr td:nth-child(5){width:15%;}
	.counsel_box tr td:nth-child(6){width:15%;}
	.counsel_box tr td:nth-child(6){width:15%;}
	
	.counselcon:hover{color:#ffffff;}
</style>
<%-- <p>${data}</p> --%>
<div class="counsel_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/professor/counsel/counselProList">상담관리</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/professor/counsel/counselProList">상담신청내역</a></span>
	</div>
	<div class="table_topic">상담신청내역<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	<table>
		<tr class="table_title">
			<td>no</td>
			<td>상담신청일자</td>
			<td>희망일시</td>
			<td>신청인</td>
			<td>소속학과</td>
			<td>상담종류</td>
			<td>진행상태</td>
			<!-- 상담날짜 이후에 써짐 -->
		</tr>
		<c:forEach var="counselVO" items="${data}" varStatus="stat">
			
			<tr>
				<td>${stat.count}</td>
				<td> <fmt:formatDate value="${counselVO.cnslDt}" pattern="yyyy-MM-dd"/> </td>
				<td> <fmt:formatDate value="${counselVO.cnslDt}" pattern="HH:mm"/> </td>
				<td>${counselVO.userVO.userNm}</td>
				<td>${counselVO.departmentVO.depNm}</td> 
				<td>${counselVO.commonDetailVO.comdNm}</td>
				<td>
					<c:choose>
						<c:when test="${counselVO.approvalVO.appYn eq 0}"><button class="btn-two mini green app-btn" type="submit" data-app-cd="${counselVO.approvalVO.appCd}" data-stu-cd="${counselVO.stuCd}" data-cnsl-cd="${counselVO.cnslCd}">대기</button></c:when>
						<c:when test="${counselVO.approvalVO.appYn eq 1}"><p class="btn-two mini sky">승인</p></c:when>
						<c:when test="${counselVO.approvalVO.appYn eq 2}"><button class="btn-two mini orange">반려</button></c:when>
					</c:choose>
				</td>
<!-- 				<td><a href="#none" class="btn-two mini gray counselcon">상담내역올리기</a></td> -->
			</tr>
		</c:forEach>

	</table>
</div>
<script>
	$(".app-btn").each(function(){
		$(this).on("click",function(){
			const appCd= $(this).data("appCd");
			const stuCd = $(this).data("stuCd");
			const cnslCd = $(this).data("cnslCd");
			console.log("appcd =", appCd, stuCd);
			Swal.fire({
				/* title: '상담을 취소하시겠습니까?', */
				title: "상담을 승인 또는 반려하시겠습니까?",
				text: "한번 승인 또는 반려된 상담신청내역은 다시 되돌릴 수 없습니다.",
				icon: "info",
				/* warning,error,success,info,question */
				width: 600,
				/* padding: "4em", */
				position: "top",
				showCancelButton: true,
				showDenyButton: true,
				confirmButtonColor: "#3085d6",
				cancelButtonColor: "#555555",
				denyButtonColor:"#d33",
				confirmButtonText: "상담승인",
				cancelButtonText: "뒤로가기",
				denyButtonText: "상담반려",
				/* reverseButtons: true, */ // 버튼 순서 거꾸로
			}).then((result) => {
				console.log(result);
				if(result.isConfirmed){
								alertSuccess("상담신청이 승인되었습니다.");
					var PageUrl = "/professor/counsel/counselAppUpdate?appCd="+appCd+"&stuCd="+stuCd+"&cnslCd="+cnslCd; 
								window.location.href = PageUrl;
				}
				else if(result.isDenied){
					Swal.fire({
							text: "반려사유를 기입해주세요.",
							input: "text",
							inputAttributes: {
								autocapitalize: "off"
							},
							showCancelButton: true,
							confirmButtonText: "입력",
							cancelButtonText: "취소",
							confirmButtonColor: "#3085d6",
						cancelButtonColor: "#555555",
					}).then((result) => {
						if(result.isConfirmed){
							const enteredText = result.value;
							$.ajax({
								url: "/professor/counsel/counselAppUpdate",
								contentType: "application/json; charset=UTF-8",
								data: JSON.stringify({
									appCd: appCd,
									stuCd: stuCd,
									cnslCd: cnslCd,
									approvalVO: {
										appCd: appCd,
										appYn: 2,
										appRet: enteredText
									}
								}),
								type: "post",
								beforeSend:function(xhr){
									xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
								},
								success: res => {
									if (res > 1) {
										alertSuccess("상담신청이 반려되었습니다.", "/professor/counsel/counselProList");
									}
								}
							})
							
						}
					});
				}
			});
		})
		
	})
</script>