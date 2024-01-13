<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 결제 -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- <link rel="stylesheet" href="/resources/css/main.css"> -->
<style>
	/* 여기 스타일 전부 가져다가 복	붙하셔야해요  
	본인이 만든 페이지 내용 제일 바깥쪽에 div하나 만들고 "counsel_box" 이런식으로 특별한?클래스이름을 붙여주세요*/
	.list_box{width:100%; height:100%; padding:40px; background-color:#ffffff;}
	/* 상단에 있는 제목 (여기서는 상담내역) css입니다
	 그대로 복붙하시고 해당div에  .table_topic값 주세요*/
	.list_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.list_box .table_topic i{margin-left:10px;}
	/* table입니다 */
	.list_box table{font-size:14px; width:100%; text-align:center;}
	/* 테이블의 시작부분 타이틀입니다 */
	.table_title{font-size:13px; border-top:1px solid #d1d0d0; border-bottom:1px solid #d1d0d0; height:32px; line-height:32px;}
	
	/* /////////////////여기가 수정시작!!  */
	.list_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.list_box tr:first-child{background-color:#EEF1F6;}
	.list_box tr:hover{background-color:#f2f3f4;}
	.list_box tr:first-child:hover{background-color:#EEF1F6;}
	/* /////////////////여기가 수정끝!!  */
	
	.list_box tr{height:40px;}
	/* 각자 만든 td개수만큼만쓰고 총 합이 100이 되도록 잘 분배해서 쓰세요 이부분 제일 신경써서 해주세요*/
	.list_box tr td:nth-child(1){width:5%;}
	.list_box tr td:nth-child(2){width:15%;}
	.list_box tr td:nth-child(3){width:15%;}
	.list_box tr td:nth-child(4){width:10%;}
	.list_box tr td:nth-child(5){width:20%;}
	.list_box tr td:nth-child(6){width:11%;}
	.list_box tr td:nth-child(7){width:12%;}
	.list_box tr td:nth-child(8){width:12%;}
</style>
</style>
<%-- <p>${list[0].payYn}</p> --%>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>

<%-- <p>${data.content}</p> --%>
<div class="list_box" style="background-color: white;">

	<!-- 카테고리 표시 : 이거는 안에 스타일값 다 들어있으니까 통째로 복사하고 안에내용만 하드코딩하시면됩니다요 -->
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/dormitory/list">기숙사</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/dormitory/list">기숙사신청목록</a></span>
	</div>
	<div class="table_topic">기숙사신청목록<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
		
<form method="post" action="/kakaoPay">
	
	<!-- 반려, 승인 테이블 시작 -->
	<table>
		<tr class="table_title">
			<td>no</td>
			<td>신청일</td>
			<td style="text-align: center;">희망년도</td>
			<td style="text-align: center;">희망학기</td>
			<td>희망동</td>
			<td>호실</td>
			<!-- 기숙사 승인 이후에 써짐 -->
			<td>승인</td>
			<td>결제</td>
		</tr>
		<c:forEach var="dormitoryVO" items="${list}" varStatus="stat">
		<div id="dormitoryCdDiv_${stat.index}">
			<input type="hidden" id="dormitoryCd" value="${dormitoryVO.domCd}" />
		</div>
<%-- 		<c:if test="${userVO.userCd eq dormitoryVO.stuCd}"> --%>
<%-- 	<p>${list}</p> --%>
		<tr>

<%-- 			<td>${dormitoryVO.domCd}</td> --%>

			<td>${stat.count}</td>
			<td>
				<fmt:formatDate value="${dormitoryVO.approvalVO.appReg}"
										pattern="yyyy-MM-dd" />
			</td>
			
			<td style="text-align: center;">${dormitoryVO.domYear}</td>
			<td>${dormitoryVO.domSem}</td>
			<td>${dormitoryVO.commonDetailVO.comdNm}</td>
			<td>
	            <!-- roomCd에서 뒤의 3글자를 추출 -->
	            <c:if test="${dormitoryVO.approvalVO.appYn eq 1}">
	            <c:set var="roomSuffix" value="${fn:substring(dormitoryVO.roomCd, fn:length(dormitoryVO.roomCd) - 3, fn:length(dormitoryVO.roomCd))}" />
	            ${roomSuffix}
	            </c:if>
	             <c:if test="${dormitoryVO.approvalVO.appYn eq 0 or dormitoryVO.approvalVO.appYn eq 2}">
	             -
	             </c:if>
       		 </td>
			<!-- 승인여부 버튼 -->
			<td>
				<c:if test="${dormitoryVO.approvalVO.appYn eq 0}"><p>대기</p></c:if>
				<c:if test="${dormitoryVO.approvalVO.appYn eq 1}"><p>승인</p></c:if>
				<c:if test="${dormitoryVO.approvalVO.appYn eq 2}"><p>반려</p></c:if>
			</td>
			<!-- 결제여부따라 보여지는 버튼  -->
			<td>
<!-- 				<input type="hidden" id="dormitoryCd" value="" /> -->
				<c:if test="${dormitoryVO.approvalVO.appYn eq 1 and dormitoryVO.payYn eq 0}"><button type="button" class="btn-two mini blue" id="btn-kakaopay1" data-dom-cd="${dormitoryVO.domCd}">대기</button></c:if>
				<c:if test="${dormitoryVO.approvalVO.appYn eq 1 and dormitoryVO.payYn eq 1}"><p>완료</p></c:if>
				<c:if test="${dormitoryVO.approvalVO.appYn eq 2 and dormitoryVO.payYn eq 0}">-</c:if>
			</td>
		</tr>
		
	
<%-- 		</c:if> --%>
		</c:forEach>
	</table>
	<!-- 반려, 승인 테이블 -->
</form>
	<!-- 카카오페이로 결제완료시 결제여부 1로 업데이트해주기  -->
	<form id="paymentFrm" action="/student/dormitory/payment?${_csrf.parameterName}=${_csrf.token}" method="post">
			<input type="hidden" name="payYn" value="1"/>
			<input type="hidden" name="domCd" value=""/>
			<sec:csrfInput/>
	</form>
</div>

<script>
$("#btn-kakaopay1").click(function () {
	IMP.init('imp80673240'); 
	console.log("tt");
	var domCdVal = "";
//     $("[id^=dormitoryCdDiv_]").each(function (index) {
//     });
    domCdVal = $(this).data('domCd');
	console.log("@@", domCdVal);
	console.log("##", domCdVal);
    
	// 영수증 값 랜덤으로 생성
	function generateRandomString(length) {
	      const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
	      let result = '';
	      for (let i = 0; i < length; i++) {
	          result += characters.charAt(Math.floor(Math.random() * characters.length));
	      }
	      return result;
	  }
	
	  // 랜덤한 merchant_uid 생성
	  const randomMerchantUid = 'PAYM' + generateRandomString(6); // PAYM 다음에 6자리 랜덤 문자열
	
	IMP.request_pay({
		pg: 'TC0ONETIME',
		pay_method: 'card',
		merchant_uid: randomMerchantUid,
		/* 
		 *  merchant_uid에 경우 
// 		 *  https://docs.iamport.kr/implementation/payment
		 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		 */
		name: '주문명 : 기숙사등록비',
		// 결제창에서 보여질 이름
		// name: '주문명 : ${auction.a_title}',
		// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
		amount: 2000,
		// amount: ${bid.b_bid},
		// 가격 
		buyer_name: '이름',
		// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
		// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
		buyer_postcode: '123-456',
		
		
		}, function (rsp) {
			console.log(rsp);
		if (rsp.success) {
//		    alertSuccess('결제가 완료되었습니다.');
//			alert('결제 금액 : ' + rsp.paid_amount);
// 			alertSuccess('결제가 완료되었습니다.', '/student/dormitory/list');
			
			// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
			// 자세한 설명은 구글링으로 보시는게 좋습니다.
	
		// 클릭한 요소의 domCd값
            data = {
                "payYn": 1,
                "domCd": domCdVal
    			}
		
		$.ajax({
            type: "POST",
            url: "/student/dormitory/payment",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(data),
            beforeSend:function(xhr){
    				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
            },
            success: function (data) {
                //alertSuccess('결제가 완료되었습니다.');
                //alert('결제 금액 : ' + rsp.paid_amount);
                alertSuccess('결제가 완료되었습니다.', '/student/dormitory/list');
                // 추가적인 로직 수행
            },
            error: function (error) {
                alertError('AJAX 요청 중 에러가 발생했습니다.');
            } 
        });
    } else {
        alertError(rsp.error_msg);
    }
});
});
		// 폼태그에 넣어주기
//         $("#paymentFrm input[name='domCd']").val(domCdVal);
// 	        var msg = '결제가 완료되었습니다.';
// 			msg += '결제 금액 : ' + rsp.paid_amount;
// 			alertSuccess(msg, '/student/dormitory/list');
//             // 업데이트폼 서브밋
//             $("#paymentFrm").submit();
			
// 		} else {
// 			//alertError('결제에 실패하였습니다.');
// 			alertError(rsp.error_msg);
// 		}
// 		alert(msg);
// 	});
// });
</script>