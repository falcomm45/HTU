<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.tuition_box{width:100%; padding:40px; background-color:#ffffff;}
	.tuition_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.tuition_box .table_topic i{margin-left:10px;}
	.tuition_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.tuition_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.tuition_box tr:first-child{background-color:#EEF1F6;}
	.tuition_box tr:hover{background-color:#f2f3f4;}
	.tuition_box tr td:nth-child(1){width:10%;}
	.tuition_box tr td:nth-child(2){width:10%;}
	.tuition_box tr td:nth-child(3){width:10%;}
	.tuition_box tr td:nth-child(4){width:15%; text-align: right;}
	.tuition_box tr td:nth-child(5){width:15%; text-align: right;}
	.tuition_box tr td:nth-child(6){width:15%; text-align: right;}
	.tuition_box tr td:nth-child(7){width:12.5%;}
	.tuition_box tr td:nth-child(8){width:12.5%;}
	.billWrap {
		display: flex;
		border: 1px solid black; 
		height: 500px; 
		padding: 20px;
		margin-top: 30px;
		justify-content: center;
	}
	.billdiv {
		background-image: linear-gradient(
        rgba(255, 255, 255, 0.9),
        rgba(255, 255, 255, 0.8)
      ), url(/resources/images/logo_circle.png);
      	background-repeat: no-repeat;
      	background-size: 400px;
      	background-position: center center;
	}
	.billTbl {
/* 		width: 500px; */
    	height: 250px;
/*     	background-image: url(/resources/images/logo_circle.png); background-size: 500px; */
    	
	}
	.billTbl tr {
		height:30px;
	}
	.billTbl tr, .billTbl td {
		border: 1px solid black;
		text-align: center;
		font-size: 14px;
	}
	.billTbl input {
		outline: none;
		background-color: transparent;
		font-size: 14px;
	}
	.billHeader {
		text-align: center;
		margin: 20px 0;
	}
	.billFooter {
		text-align: center;
		margin: 45px 0;
	}
</style>
<div class="tuition_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/tuition/myTuition">학사행정</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/tuition/myTuition">등록/장학</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/tuition/myTuition">등록금 내역</a></span>
	</div>
	<div class="table_topic">등록금 내역</div>
	<table>
		<tr class="table_title">
			<th>no</th>
			<th>등록년도</th>
			<th>학기</th>
			<th>책정액(원)</th>
			<th>감면액(원)</th>
			<th>실납부액(원)</th>
			<th>납부여부</th>
			<th>등록금고지서</th>
		</tr>
		<c:forEach var="tuitVO" items="${tuitionVOList}" varStatus="stat">
			<tr>
				<td>${stat.count}</td>
				<td>${tuitVO.tutYear}</td>
				<td>${tuitVO.tutSem}학기</td>
				<td><fmt:formatNumber value="${tuitVO.tutSchl}" type="number"></fmt:formatNumber></td>
				<c:if test="${!empty tuitVO.tutTuition}">
					<td><fmt:formatNumber value="${tuitVO.tutTuition}" type="number"></fmt:formatNumber></td>
				</c:if>
				<c:if test="${empty tuitVO.tutTuition}">
					<td>-</td>
				</c:if>
				<td><fmt:formatNumber value="${tuitVO.tutPayment}" type="number"></fmt:formatNumber></td>
				<c:if test="${!empty tuitVO.tutDt}">
					<td>완납</td>
					<td>
						<button class="btn-two gray mini tubtn" data-tut-cd="${tuitVO.tutCd}">상세</button>
					</td>
				</c:if>
				<c:if test="${empty tuitVO.tutDt}">
					<td style="color: red;">미납</td>
					<td>
						<button class="btn-two bur mini tubtn" data-tut-cd="${tuitVO.tutCd}">상세</button>
					</td>
				</c:if>
			</tr>
		</c:forEach>
		
	</table>
</div>
<!-- 고지서 모달 -->
<div class="tuitmodal modal-bg" style="display:none; position:fixed; z-index: 999; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);">
	<div class="bill_box" style="overflow: auto; position:absolute; z-index: 999; width: 1100px; height: 600px; padding:30px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%); ">
		<button type="button" class="btn-two sky mini close_bt" id="pdfDownload" style="width: 59.22px; height: 25.92px; padding:5px 10px; margin-bottom:20px; margin-right: 0; position:fixed; z-index: 999; right: 100px; top:20px; transition:.3s;">저장</button>
		<button type="button" class="btn-two gray mini close_bt" onclick="closeModal()" style="padding:5px 10px; margin-bottom:20px; margin-right: 0; position:fixed; z-index: 999; right: 30px; top:20px; transition:.3s;">닫기 <i class="fa-solid fa-xmark" style="color: #ffffff;"></i></button>
		<div class="billWrap">
			<div class="billdiv">
				<div class="billHeader">
					<p style="font-size: 14px; margin-bottom: 10px;">[은행용]</p>
					<p style="font-size: 24px; font-weight: bold;">등록금 고지서</p>
				</div>
				<div>
					<table class="billTbl">
						<tr>
							<td colspan="4">등록금내역</td>
						</tr>
						<tr>
							<td>&nbsp;등록학기&nbsp;</td>
							<td class="sem"></td>
							<td>학과</td>
							<td class="depNm"></td>
						</tr>
						<tr>
							<td>학번</td>
							<td class="stuCd"></td>
							<td>성명</td>
							<td class="stuNm"></td>
						</tr>
						<tr>
							<td colspan="2">구분</td>
							<td>등록금①</td>
							<td>감면액②</td>
						</tr>
						<tr>
							<td colspan="2">입학금</td>
							<td style="text-align: right;">0</td>
							<td style="text-align: right;">0</td>
						</tr>
						<tr>
							<td colspan="2">수업료</td>
							<td>
								<input type="text" class="tutTuition" readonly="readonly" style="text-align: right;" />
							</td>
							<td>
								<input type="text" class="tutSchl" readonly="readonly" style="text-align: right;" />
							</td>
						</tr>
						<tr>
							<td colspan="2">합계</td>
							<td>
								<input type="text" class="tutTuition" readonly="readonly" style="text-align: right;" />
							</td>
							<td>
								<input type="text" class="tutSchl" readonly="readonly" style="text-align: right;" />
							</td>
						</tr>
						<tr>
							<td colspan="2">납부금액(①-②)</td>
							<td colspan="2" style="text-align: right;">
								<input type="text" class="total" readonly="readonly" style="text-align: right;" />
							</td>
						</tr>
						<tr>
							<td colspan="2">납부계좌</td>
							<td colspan="2">국민 2023064050001</td>
						</tr>
					</table>
				</div>
				<div class="billFooter">
					<p style="font-size: 24px; font-weight: bold;">형택대학교수입징수관<img alt="" src="/resources/images/sign.png" style="width: 70px; height: 70px;"></p>
				</div>
			</div>
			<div class="billdiv">
				<div class="billHeader">
					<p style="font-size: 14px; margin-bottom: 10px;">[학생용]</p>
					<p style="font-size: 24px; font-weight: bold;">등록금 고지서</p>
				</div>
				<div>
					<table class="billTbl">
						<tr>
							<td colspan="4">등록금내역</td>
						</tr>
						<tr>
							<td>&nbsp;등록학기&nbsp;</td>
							<td class="sem"></td>
							<td>학과</td>
							<td class="depNm"></td>
						</tr>
						<tr>
							<td>학번</td>
							<td class="stuCd"></td>
							<td>성명</td>
							<td class="stuNm"></td>
						</tr>
						<tr>
							<td colspan="2">구분</td>
							<td>등록금①</td>
							<td>감면액②</td>
						</tr>
						<tr>
							<td colspan="2">입학금</td>
							<td style="text-align: right;">0</td>
							<td style="text-align: right;">0</td>
						</tr>
						<tr>
							<td colspan="2">수업료</td>
							<td>
								<input type="text" class="tutTuition" readonly="readonly" style="text-align: right;" />
							</td>
							<td>
								<input type="text" class="tutSchl" readonly="readonly" style="text-align: right;" />
							</td>
						</tr>
						<tr>
							<td colspan="2">합계</td>
							<td>
								<input type="text" class="tutTuition" readonly="readonly" style="text-align: right;" />
							</td>
							<td>
								<input type="text" class="tutSchl" readonly="readonly" style="text-align: right;" />
							</td>
						</tr>
						<tr>
							<td colspan="2">납부금액(①-②)</td>
							<td colspan="2" style="text-align: right;">
								<input type="text" class="total" readonly="readonly" style="text-align: right;" />
							</td>
						</tr>
						<tr>
							<td colspan="2">납부계좌</td>
							<td colspan="2">국민 2023064050001</td>
						</tr>
					</table>
				</div>
				<div class="billFooter">
					<p style="font-size: 24px; font-weight: bold;">형택대학교수입징수관<img alt="" src="/resources/images/sign.png" style="width: 70px; height: 70px;"></p>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	
	$(".tubtn").on("click", function(){
		let tutCd = $(this).data("tutCd");
		console.log("tutCd : " + tutCd);
		
		$.ajax({
 			url:"/student/tuition/bill?tutCd="+tutCd,
 			dataType: 'json',
 			type:"get",
 			beforeSend:function(xhr){
 				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
 			},
 			success:function(res){
				console.log(res);
				 $(".sem").html(res.tutYear + "년 " + res.tutSem + "학기");
				 $(".depNm").html(res.depNm);
				 $(".stuCd").html(res.stuCd);
				 $(".stuNm").html(res.stuNm);
				$(".tutTuition").val(res.tutTuition.toString()
						  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
				$(".tutSchl").val(res.tutSchl.toString()
						  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
				$(".total").val(res.tutPayment.toString()
						  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
				$(".tuitmodal").fadeIn();
				
				$(".close_bt").on("click", function(){
		         	$(".tuitmodal").fadeOut();
		        });
 			}
 		});
	});
	
// 	$("#pdfDownload").on("click", function(){
// 		pdfPrint();
// 	});
	
// 	function pdfPrint() {
// 	    var element = document.querySelector('.billWrap'),
// 	    width = element.style.width,
// 	    height = element.style.height;

// 	    var parentElement = element.parentElement;

// 	    parentElement.removeChild(element);
// 	    document.body.appendChild(element);

// 	    var options = {
// 	        scrollX: window.scrollX,
// 	        scrollY: window.scrollY,
// 	        scale: window.devicePixelRatio
// 	    };

// 	    html2canvas(element, options).then(function (canvas) {
// 	        document.body.removeChild(element);
// 	        parentElement.appendChild(element);

// 	        var imgData = canvas.toDataURL('image/png');

// 	        var imgWidth = 210;
// 	        var pageHeight = imgWidth * 1.414;
// 	        var imgHeight = canvas.height * imgWidth / canvas.width;
// 	        var heightLeft = imgHeight;

// 	        var doc = new jsPDF('p', 'mm');
// 	        var position = 5;
// 	        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
// 	        heightLeft -= pageHeight;

// 	        while (heightLeft >= 20) {
// 	            position = heightLeft - imgHeight;
// 	            doc.addPage();
// 	            doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
// 	            heightLeft -= pageHeight;
// 	        }

// 	        // 파일 저장
// 	        doc.save('등록금 고지서.pdf');
// 	    });
// 	}
	
});
</script>