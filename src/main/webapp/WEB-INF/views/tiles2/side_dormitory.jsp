<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
	.sub_menu a:hover{color:#333333;}
</style>

<sec:authentication property="principal.userVO" var="vo"/>
<div class="flex-shrink-0 p-3 bg-white sub_menu">
    <a href="/student/dormitory/list" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom" style="margin-top:65px; margin-left:5px;">
      <span class="fs-5">기숙사</span>
    </a>
    <button class="sub_button" onclick="location.href='/student/dormitory/apply'">
      <a class="sub_text" style="display:block;">기숙사신청</a>
    </button>
    <div class="submenu_menu">
      <a href="/student/dormitory/home" class="sub_menu_a">인사말</a>
      <a href="/student/dormitory/list" class="sub_menu_a">기숙사신청목록</a>
  </div>
  </div>