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
<style type="text/css">

.certiDiv {
	background-color: white;
	position:absolute;
	top:0%;
	height: 23cm;
	width: 21cm;
	z-index: 1;
	font-weight : bold;
	
}

.title{ 
    font-size: 2em;
    text-align: center; 
    position: absolute;
    top: 5%; 
    left: 50%; 
    transform: translate(-50%, -50%);
     
}
.tr1, .tr2, .tr3, .tr4, .tr5, .tr6 , .tr7{
    font-size: 1.5em;
    position: absolute;
}
.tr1 { 
	top: 25%; 
    left: 15%; 
} 

.tr2 {
    top: 30%; 
    left: 15%; 
} 

.tr3 {
    top: 35%; 
    left: 15%; 
} 

.tr4 {
    top: 40%; 
    left: 15%; 
}

.tr5 {
    top: 45%; 
    left: 15%; 
}
.tr6 {
    top: 65%; 
    left: 50%; 
    transform: translate(-50%, -50%);
} 
.tr7 {
    top: 73%; 
    left: 50%; 
    transform: translate(-50%, -50%);
} 
.tr8 {
	position: absolute;
	font-size: 2.0em;
    top: 85%; 
    left: 50%; 
    transform: translate(-50%, -50%);
    z-index: 1;
} 
#logo {
    opacity: 0.4;
    position: absolute;
    top: 30%; 
    left: 50%;
    transform: translate(-50%);
    z-index: -1;
}
#stemp{
    opacity: 1;
    width: 100px;
    height: 100px;
    position: absolute;
    top: 79.5%; 
    left: 70.5%;
    transform: translate(-50%);
    z-index: -1;
}
#btnPdf{
	position: absolute;
    top: 0.5%;
    left: 48.5%;
	
}
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
 	background-image: url(/resources/images/logo_circle.png); background-size: 500px;
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
<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
    String formattedDate = dateFormat.format(new Date());
    
    SimpleDateFormat dateFormaty = new SimpleDateFormat("yyyy");
    String formattedDate2 = dateFormaty.format(new Date());
%>
<sec:authentication property="principal.userVO" var="userVO"/>
	<div style="position:fixed;">
		<button type="button" id="btnPdf" class="btn-two mini bur" style=" width: 65px; height:40px; box-shadow:3px 3px 5px gray; font-size:14px; margin-left:795px;" id="btn-kakaopay1">인쇄</button>
	</div>
	<!-- 재학신청서 -->
	<div class="certificate_p" style="background-color: #fff; width:800px; height:1000px; border: 1px solid #ebebeb; padding:30px; box-sizing: border-box;">
	     <div style="font-size: 18px; font-family: 'BookkMyungjo-Bd'; display:flex; align-items:center;">제 <%= formattedDate2 %> &nbsp;- &nbsp;<span id="autenticationNo"></span> 호</div>
	    <div style="font-size: 30px; font-weight: 600; margin-top:50px; text-align: center; letter-spacing: 5px; font-family: 'BookkMyungjo-Bd'">졸업증명서</div>
	    <div style="position: relative; right:0; text-align: right; margin-top:90px; font-size: 16px;">
	      <div style="font-size: 16px; margin-top: 5px;">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;:&nbsp;<input style="width:140px; border:none; font-size: 16px;" value="${userVO.userNm}" readonly></div>
	      <div style="font-size: 16px; margin-top: 5px;">생&nbsp; 년&nbsp; 월&nbsp; 일&nbsp;:&nbsp;<input style="width:140px; border:none; font-size: 16px;" value="${fn: substring(userVO.userReg1,0,2)}. ${fn: substring(userVO.userReg1,2,4)}. ${fn: substring(userVO.userReg1,4,6)}" readonly></div>
	    </div>
	    <fmt:formatDate value="${userVO.studentVO.stuAddt}" pattern="yyyy년 MM월 dd일" var="stuAddt"/>
	    <fmt:formatDate value="${userVO.studentVO.stuGrdt}" pattern="yyyy년 MM월 dd일" var="stuGrdt"/>
	    <div style="margin-top: 100px;"><input value="${stuAddt}" style="width:160px; text-align: center; border: none; font-size: 16px;" readonly/>형택대학교 <input value="${userVO.studentVO.departmentVO.depNm}"  style="text-align: center; border: none; font-size: 16px; width:100px;" readonly/><input value="입학"  style="text-align: center; border: none; font-size: 16px; width:50px;" readonly/></div>
	    <div style="margin-top: 10px;"><input value="${stuGrdt}" style="width:160px; text-align: center; border: none;  font-size: 16px;" readonly/>형택대학교 <input value="${userVO.studentVO.departmentVO.depNm}"  style="text-align: center; border: none;  font-size: 16px; width:100px;" readonly/><input value="재학"  style="text-align: center; border: none;  font-size: 16px; width:50px;" readonly/></div>
	    <div style="margin-top: 80px; margin-left: 15px; font-size: 18px;">위의 사실을 증명함</div>
	    <div style="text-align: center; margin-top: 170px; "><input style="font-size: 18px; width: 100%; text-align: center; border: none; " value="<%= formattedDate %>" readonly/></div>
	    <div style="text-align: center;  margin-top: 70px; "><input style="border: none; font-family: 'BookkMyungjo-Bd'; font-size: 25px; font-weight: 500; width: 100%; text-align: center;" value="형&nbsp;택&nbsp;대&nbsp;학&nbsp;교&nbsp;&nbsp;총&nbsp;장" readonly/></div>
	  	<img src="/resources/images/sign.png" alt="직인" style="width:80px; position:absolute; bottom:120px; right:235px; opacity:0.7;">
	  </div>
<%-- ${stuPrivacyInfoVO} --%>
<script type="text/javascript">
<!-- // logout = function() { -->
<!-- // 	$("#logoutForm").submit(); -->
<!-- // } -->
$(function() {
	let date = new Date().getTime();
	console.log("date",String(date).substr(8));
	$("#autenticationNo").text(String(date).substr(7));
})
	$("#btnPdf").on("click",function(){
		
		sweetConfirmDelete();
		
	});
	function sweetConfirmDelete() {
	    Swal.fire({
	        text: "증명서파일을 다운받으시겠습니까?",
	        icon: "question",
	        width: 300,
	        showCancelButton: true,
	        confirmButtonColor: "#3085d6",
	        cancelButtonColor: "#d33",
	        confirmButtonText: "네",
	        cancelButtonText: "아니오"
	    }).then((result) => {
	        console.log(result);
	        if (result.isConfirmed) {
	            // "네"를 클릭했을 때의 동작
	        	pdfPrint();
	        	alertSuccess("파일다운로드가 완료되었습니다." ,"/student/certificate/payment?stuCd=" + ${stuPrivacyInfoVO.stuCd});
	        } else {
	            // "아니오"를 클릭했을 때의 동작
	            alertError('파일다운로드를 취소했습니다.');
	        }
	    });
	}
	function pdfPrint() {
	    var element = document.querySelector('.certificate_p'),
	    width = element.style.width,
	    height = element.style.height;


	    var parentElement = element.parentElement;

	    parentElement.removeChild(element);
	    document.body.appendChild(element);

	    var options = {
	        scrollX: window.scrollX,
	        scrollY: window.scrollY,
	        scale: window.devicePixelRatio
	    };

	    html2canvas(element, options).then(function (canvas) {
	        document.body.removeChild(element);
	        parentElement.appendChild(element);

	        var imgData = canvas.toDataURL('image/png');

	        var imgWidth = 210;
	        var pageHeight = imgWidth * 1.414;
	        var imgHeight = canvas.height * imgWidth / canvas.width;
	        var heightLeft = imgHeight;

	        var doc = new jsPDF('p', 'mm');
	        var position = 10;
	        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
	        heightLeft -= pageHeight;

	        while (heightLeft >= 20) {
	            position = heightLeft - imgHeight;
	            doc.addPage();
	            doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
	            heightLeft -= pageHeight;
	        }

	        // 파일 저장
	        doc.save('${stuPrivacyInfoVO.userVO.userNm} 졸업증명서.pdf');
	    });
	}
    window.onload = function(){
        pdfPrint();
    }

</script>



