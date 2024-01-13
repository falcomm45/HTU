<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
	.sub_menu a:hover{color:#333333;}
</style>
<sec:authentication property="principal.userVO" var="vo"/>
<div class="flex-shrink-0 p-3 bg-white sub_menu">
    <a href="/professor/counsel/counselProList" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom" style="margin-top:65px; margin-left:5px;">
      <span class="fs-5">상담관리</span>
    </a>
    <div class="submenu_menu">
      <a href="/professor/counsel/counselProList" class="sub_menu_a">상담신청내역</a>
      <a href="/professor/counsel/counselReportList" class="sub_menu_a">상담기록</a>
  </div>
  </div>