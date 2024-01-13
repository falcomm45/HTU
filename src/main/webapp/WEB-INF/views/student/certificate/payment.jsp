<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="/resources/js/jspdf.min.js"></script>
<script src="/resources/js/bluebird.min.js"></script>
<script src="/resources/jshtml2canvas.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
/* 추가한 스타일 부분 */
.btn-two {
	display: inline-block;
	padding: 12px 20px;
	margin: 10px 0;
	font-size: 18px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	border: none;
	border-radius: 4px;
}

.mini {
	font-size: 14px;
}

.sky {
	background-color: #3498db;
}

.blue {
	background-color: #007bff;
}

hr {
	margin: 20px 0;
	border: 0;
	border-top: 1px solid #ddd;
}

.card {
	margin-top: 55px;
	padding: 145px;
	margin-left: 55px;
	width: 44%;
}

.certificate_p{
 	background-image: url(/resources/images/prohibition.png); background-size: 500px;
    background-repeat: no-repeat; background-position:center;
    isolation: isolate; position: relative;
}
.certificate_p::after {
  content: '';
  position: absolute;
  background: white;
  z-index: -1;
  inset: 0;
  opacity: 0.8;
}

.certificate_p input{background-color:rgba( 255, 255, 255, 0);}
.certificate_p input:focus{outline:none;}

</style>

<!-- 	<div class="row"> -->
<!-- 		<div class="col-md-12"> -->
<!-- 			<div class="card"> -->
<!-- 				<div class="cardBody" -->
<!-- 					style="margin-left: -102px; margin-top: -93px;"> -->
<!-- 					<div class="free_topic" style="font-size: 25px;"> -->
<!-- 						증명서발급<i class="fa-solid fa-circle-info" -->
<!-- 							style="position: absolute; top: 52px; left: 177px;"></i> -->
<!-- 					</div> -->
<!-- 					<form method="post" action="/kakaoPay"> -->
<!-- 						<table class="list_box"> -->
<!-- 							<tr class="table_title"> -->
<!-- 								<td style="width: 819px;">재학증명서</td> -->
<!-- 								<td><button type="button" class="btn-two mini sky" style="width: 48px;" -->
<!-- 										id="btn-kakaopay1">결제</button></td> -->
<!-- 							</tr> -->
<!-- 							<hr> -->
<!-- 							<tr class="table_title"> -->
<!-- 								<td>졸업증명서</td> -->
<!-- 								<td><button type="button" class="btn-two mini sky" style="width: 48px;" -->
<!-- 										id="btn-kakaopay2">결제</button></td> -->
<!-- 							</tr> -->
<!-- 						</table> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
    String formattedDate = dateFormat.format(new Date());

    SimpleDateFormat dateFormaty = new SimpleDateFormat("yyyy");
    String formattedDate2 = dateFormaty.format(new Date());
%>
<sec:authentication property="principal.userVO" var="userVO"/>
	<div style="position:fixed;">
		<button type="button" class="btn-two mini bur" style=" width: 65px; height:40px; box-shadow:3px 3px 5px gray; font-size:14px; margin-left:795px;" id="btn-kakaopay1">결제</button>
	</div>
	<!-- 재학신청서 -->
	<div class="certificate_p" style="background-color: #fff; width:800px; height:1000px; border: 1px solid #ebebeb; padding:30px; box-sizing: border-box;">
	    <div style="font-size: 18px; font-family: 'BookkMyungjo-Bd'; display:flex; align-items:center;">제 <%= formattedDate2 %> &nbsp;- &nbsp;<span id="autenticationNo"></span> 호</div>
	    <div style="font-size: 30px; font-weight: 600; margin-top:50px; text-align: center; letter-spacing: 5px; font-family: 'BookkMyungjo-Bd'">재학증명서</div>
	    <div style="position: relative; right:0; text-align: right; margin-top:90px; font-size: 16px;">
<%-- 	      <div style="font-size: 16px;">주민등록번호&nbsp;:&nbsp;<input value="${userVO.userReg1} - ${userVO.userReg2}" style="width:140px; border:none; font-size: 16px;" readonly></div> --%>
	      <div style="font-size: 16px; margin-top: 5px;">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;:&nbsp;<input style="width:140px; border:none; font-size: 16px;" value="${userVO.userNm}" readonly></div>
	      <div style="font-size: 16px; margin-top: 5px;">생&nbsp; 년&nbsp; 월&nbsp; 일&nbsp;:&nbsp;<input style="width:140px; border:none; font-size: 16px;" value="${fn: substring(userVO.userReg1,0,2)}. ${fn: substring(userVO.userReg1,2,4)}. ${fn: substring(userVO.userReg1,4,6)}" readonly></div>
	    </div>
	    <fmt:formatDate value="${userVO.studentVO.stuAddt}" pattern="yyyy년 MM월 dd일" var="stuAddt"/>
	    <div style="margin-top: 100px;"><input value="${stuAddt}" style="width:160px; text-align: center; border: none; font-size: 16px;" readonly/>형택대학교 <input value="${userVO.studentVO.departmentVO.depNm}"  style="text-align: center; border: none; font-size: 16px; width:100px;" readonly/><input value="입학"  style="text-align: center; border: none; font-size: 16px; width:50px;" readonly/></div>
	    <div style="margin-top: 10px;"><input value="<%= formattedDate %>"  style="width:160px; text-align: center; border: none;  font-size: 16px;" readonly/>형택대학교 <input value="${userVO.studentVO.departmentVO.depNm}"  style="text-align: center; border: none;  font-size: 16px; width:100px;" readonly/><input value="재학"  style="text-align: center; border: none;  font-size: 16px; width:50px;" readonly/></div>
	    <div style="margin-top: 80px; margin-left: 15px; font-size: 18px;">위의 사실을 증명함</div>
	    <div style="text-align: center; margin-top: 170px; "><input style="font-size: 18px; width: 100%; text-align: center; border: none; " value="<%= formattedDate %>" readonly/></div>
	    <div style="text-align: center;  margin-top: 70px; "><input style="border: none; font-family: 'BookkMyungjo-Bd'; font-size: 25px; font-weight: 500; width: 100%; text-align: center;" value="형&nbsp;택&nbsp;대&nbsp;학&nbsp;교&nbsp;&nbsp;총&nbsp;장" readonly/></div>
	  	<img src="/resources/images/sign.png" alt="직인" style="width:80px; position:absolute; bottom:120px; right:235px; opacity:0.7;">
	  </div>


	<script>
	
		$(function() {
			let date = new Date().getTime();
			console.log("date",String(date).substr(8));
			$("#autenticationNo").text(String(date).substr(7));
		})
// 		function handlePayment(buttonId) {
// 			var isStudent = $
// 			{
// 				stuPrivacyInfoVO.stuGrdt != null
// 			}
// 			;
// 			var documentType = buttonId === 'btn-kakaopay1' ? '재학증명서' : '졸업증명서';

// 			if (isStudent) {
// 				alert('발급대상자가 아닙니다');
// 			} else {
// 				IMP.init('imp80673240');
// 				var randomMerchantUid = 'PAYM' + generateRandomString(6);

// 				IMP
// 						.request_pay(
// 								{
// 									pg : 'TC0ONETIME',
// 									pay_method : 'card',
// 									merchant_uid : randomMerchantUid,
// 									name : '주문명 : ' + documentType,
// 									amount : 2000,
// 									buyer_name : '이름',
// 									buyer_postcode : '123-456',
// 								},
// 								function(rsp) {
// 									console.log(rsp);
// 									if (rsp.success) {
// 										var msg = '결제가 완료되었습니다.';
// 										msg += '결제 금액 : ' + rsp.paid_amount;
// 										var redirectUrl = buttonId === 'btn-kakaopay1' ? '/student/enrollment/certificate/issued?stuCd=${stuPrivacyInfoVO.stuCd}'
// 												: '/student/graduate/certificate/issued?stuCd=${stuPrivacyInfoVO.stuCd}';
// 										alertSuccess(msg, redirectUrl);
// 									} else {
// 										var msg = '결제에 실패하였습니다.';
// 										msg += '에러내용 : ' + rsp.error_msg;
// 										alertError('폼 제출 실패');
// 									}
// 									alert(msg);
// 								});
// 			}
// 		}

// 		function generateRandomString(length) {
// 			const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
// 			let result = '';
// 			for (let i = 0; i < length; i++) {
// 				result += characters.charAt(Math.floor(Math.random()
// 						* characters.length));
// 			}
// 			return result;
// 		}
		
		$("#btn-kakaopay1").click(function () {
			
			if (${stuPrivacyInfoVO.stuGrdt != null}){
				alert('발급대상자가 아닙니다');
			}else{
			IMP.init('imp80673240'); 
			console.log("tt");
			
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
//		 		 *  https://docs.iamport.kr/implementation/payment
				 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				 */
				name: '주문명 : 재학증명서',
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
// 					var msg = '결제가 완료되었습니다.';
// 					msg += '결제 금액 : ' + rsp.paid_amount;
					alertSuccess('결제가 완료되었습니다.', '/student/emrolment/certificate/issued?stuCd=${stuPrivacyInfoVO.stuCd}');

					
				} else {
// 					var msg = '결제에 실패하였습니다.';
// 					msg += '에러내용 : ' + rsp.error_msg;
					alertError('결제가 취소되었습니다');
				}
				alert(msg);
			});
			}
		});

		$("#btn-kakaopay2").click(function () {
			if (${stuPrivacyInfoVO.stuGrdt == null}){
				alert('발급대상자가 아닙니다');
			}else{
			IMP.init('imp80673240'); 
			console.log("tt");
			
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
//		 		 *  https://docs.iamport.kr/implementation/payment
				 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				 */
				name: '주문명 : 졸업증명서',
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
// 					var msg = '결제가 완료되었습니다.';
// 					msg += '결제 금액 : ' + rsp.paid_amount;
					alertSuccess('결제가 완료되었습니다.', '/student/graduate/certificate/issued?stuCd=${stuPrivacyInfoVO.stuCd}');

					
				} else {
// 					var msg = '결제에 실패하였습니다.';
// 					msg += '에러내용 : ' + rsp.error_msg;
					alertError('결제가 취소되었습니다.');
				}
				alert(msg);
			});
			}
		});

</script>
