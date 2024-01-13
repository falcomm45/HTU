<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<sec:authentication property="principal.userVO" var="vo"/>

<div class="flex-shrink-0 p-3 bg-white sub_menu">

<input hidden="hidden" value="${vo.studentVO.stuCd}" id="stuCd">

    <a href="/student/academicAdmin/recordList" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom" style="margin-top:65px; margin-left:5px;">
      <span class="fs-5">학사행정</span>
    </a>
    <a href="/student/academicAdmin/recordList" class="d-flex align-items-center text-decoration-none border-bottom">
      <span class="sub_title2" style="margin-left:10px; margin-top:20px; margin-bottom:10px; font-size:18px;">학적관리</span>
    </a>
    <ul class="list-unstyled ps-0" style="margin-bottom:10px;">
      <li class="mb-1">
        <a href="/student/academicAdmin/recordList" style="padding-top:10px; padding-bottom:5px;" class="btn-toggle align-items-center rounded collapsed" data-bs-target="#home-collapse" aria-expanded="true">
         	 <svg xmlns="http://www.w3.org/2000/svg" height="10" width="10" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#333333" d="M0 128C0 92.7 28.7 64 64 64H320c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z"/></svg>
         	 <span style="margin-left:3px;">학적변경내역</span>
        </a>
        <div class="collapse show" id="home-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="/student/academicAdmin/recordList" class="link-dark rounded">&nbsp;&nbsp;&nbsp;학적변경내역</a></li>
<!--             <li><a href="#" class="link-dark rounded">Updates</a></li> -->
<!--             <li><a href="#" class="link-dark rounded">Reports</a></li> -->
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <a href="/student/academicAdmin/recordApp" style="padding-top:10px; padding-bottom:5px;" class=" btn-toggle align-items-center rounded collapsed" data-bs-target="#home-collapse2" aria-expanded="true">
         	 <svg xmlns="http://www.w3.org/2000/svg" height="10" width="10" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#333333" d="M0 128C0 92.7 28.7 64 64 64H320c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z"/></svg>
         	 <span style="margin-left:3px;">학적변경신청</span>
         	 
        </a>
        <div class="collapse show" id="home-collapse2">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
          
<%--           ${data.commonDetailVO.comdNm} --%>
<!--             <li> -->
<%--             	<c:choose> --%>
<%-- 	            	<c:when test="${data.commonDetailVO.comdNm eq '재학'}"> --%>
<!-- 	            		<a href="/student/academicAdmin/recordApp" class="link-dark rounded">&nbsp;&nbsp;&nbsp;휴학신청</a> -->
<%-- 	           		</c:when> --%>
<%-- 	           		<c:when test="${data.commonDetailVO.comdNm eq '휴학'}"> --%>
<!-- 	            		<a href="#none" class="link-dark rounded leave-record">&nbsp;&nbsp;&nbsp;휴학신청</a> -->
<%-- 	           		</c:when> --%>
<%--            		</c:choose>  --%>
<!--             </li> -->
<!--            <li> -->
<%-- 	           	<c:choose> --%>
<%-- 	            	<c:when test="${data.commonDetailVO.comdNm eq '재학'}"> --%>
<!-- 	            		<a href="#none" class="link-dark rounded return-record">&nbsp;&nbsp;&nbsp;복학신청</a> -->
<%-- 	           		</c:when> --%>
<%-- 	           		<c:when test="${data.commonDetailVO.comdNm eq '휴학'}"> --%>
<!-- 	            		<a href="/student/academicAdmin/recordApp2" class="link-dark rounded">&nbsp;&nbsp;&nbsp;복학신청</a> -->
<%-- 	           		</c:when> --%>
<%-- 	           	</c:choose>  --%>
<!--            </li> -->
            
            <li><a href="/student/academicAdmin/recordApp"  class="link-dark rounded leave-record">&nbsp;&nbsp;&nbsp;휴학신청</a></li>
            <li><a href="/student/academicAdmin/recordApp2" class="link-dark rounded return-record">&nbsp;&nbsp;&nbsp;복학신청</a></li>
            <li><a href="/student/academicAdmin/recordApp3" class="link-dark rounded">&nbsp;&nbsp;&nbsp;자퇴신청</a></li>
          </ul>
        </div>
      </li>
    </ul>
    <div style="width:100%; height:1px; background-color:#ebebeb;"></div>
    <a href="/student/tuition/myTuition" class="d-flex align-items-center text-decoration-none border-bottom">
      <span class="sub_title2" style="margin-left:10px; margin-top:30px; margin-bottom:10px; font-size:18px;">등록/장학</span>
    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <a href="/student/tuition/myTuition" style="padding-top:10px; padding-bottom:5px;" class="btn-toggle align-items-center rounded collapsed" data-bs-target="#home-collapse3" aria-expanded="true">
         	<svg xmlns="http://www.w3.org/2000/svg" height="10" width="10" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#333333" d="M0 128C0 92.7 28.7 64 64 64H320c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z"/></svg>
         	<span style="margin-left:3px;">등록</span>
        </a>
        <div class="collapse show" id="home-collapse3">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="/student/tuition/myTuition" class="link-dark rounded">&nbsp;&nbsp;&nbsp;등록금 내역</a></li>
<!--             <li><a href="#" class="link-dark rounded">Updates</a></li> -->
<!--             <li><a href="#" class="link-dark rounded">Reports</a></li> -->
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <a href="/student/schlship/mySchlship" style="padding-top:10px; padding-bottom:5px;" class="btn-toggle align-items-center rounded collapsed" data-bs-target="#home-collapse4" aria-expanded="true">
         	<svg xmlns="http://www.w3.org/2000/svg" height="10" width="10" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#333333" d="M0 128C0 92.7 28.7 64 64 64H320c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z"/></svg>
         	<span style="margin-left:3px;">장학</span>
        </a>
        <div class="collapse show" id="home-collapse4">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="/student/schlship/mySchlship" class="link-dark rounded">&nbsp;&nbsp;&nbsp;장학금 조회</a></li>
          </ul>
        </div>
      </li>
      
    </ul>
  </div>

<script>
// const stuCd=$('#stuCd').val();
// console.log(stuCd);
let stuStatus="";
$.ajax({
    url: "/student/academicAdmin/sideStatus",
    type: "get",
    contentType: "application/json; charset=UTF-8",
    beforeSend: function (xhr) {
        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    },
    success: function (res) {
    	console.log(res); 
    	stuStatus = res;
	},
	 error: function (xhr) {
         console.log(xhr);
     }
 })
 
$('.return-record').on('click',function(){
	if(stuStatus == "RECD01"){
		alertError("재학중인 학생은 복학신청이 불가합니다.");
		$(this).attr("href", "#none");
	}
});
$('.leave-record').on('click',function(){
	if(stuStatus == "RECD02"){
		alertError("휴학중인 학생은 휴학신청이 불가합니다.");
		$(this).attr("href", "#none");
	}
});
</script>