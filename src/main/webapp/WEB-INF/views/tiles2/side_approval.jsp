<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.userVO" var="vo"/>
<div class="flex-shrink-0 p-3 bg-white sub_menu">
    <a href="/employee/lectureapproval/list" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom" style="margin-top:65px; margin-left:5px;">
      <span class="fs-5">결재</span>
    </a>
    <div class="submenu_menu">
	      	<div class="sub_title2"><a href="/employee/lectureapproval/list">강의결재</a></div>
	      	<a href="/employee/lectureapproval/list" class="sub_menu_b">강의계획서 제출목록</a>
	    
	    	<div class="sub_title2" style="margin-top:30px;"><a href="/employee/stuadmin/recordApprovalList">학적관리</a></div>
			<a class="sub_menu_b"" href="/employee/stuadmin/recordApprovalList" style="margin-bottom: 20px;">학적변경신청내역</a>
	    
	    	<div class="sub_title2"><a href="/employee/dormitory/list">기숙사관리</a></div>
      		<a href="/employee/dormitory/list" class="sub_menu_b" style="margin-bottom: 20px;">기숙사 신청내역</a>
      	
      		<div class="sub_title2"><a href="/employee/crew/crewList"><a href="/employee/crew/crewList">동아리관리</a></div>
       		<a href="/employee/crew/crewList" class="sub_menu_b" style="margin-bottom: -7px;">동아리목록</a>
     		<a href="/employee/crew/crewAppList" class="sub_menu_b" style="margin-bottom: 20px;">동아리 개설 승인</a>
	    
      		<div><a href="/employee/postreport/list">커뮤니티관리</a></div>
      		<a href="/employee/postreport/list" class="sub_menu_b" style="margin-top: 5px;">게시글 신고 내역</a>
  </div>
  </div>