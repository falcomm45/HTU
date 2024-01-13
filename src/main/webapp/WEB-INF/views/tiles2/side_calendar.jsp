<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
	.sub_menu a:hover{color:#333333;}
</style>

<sec:authentication property="principal.userVO" var="vo"/>
	<div class="flex-shrink-0 p-3 bg-white sub_menu">
    <a href="/academicCalendar/calendar" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom" style="margin-top:65px; margin-left:5px;">
      <span class="fs-5">일정관리</span>
    </a>
		<div class="submenu_menu" style="margin-top:25px;">
			<a href="/academicCalendar/calendar" class="sub_menu_a">학사일정</a>
			<a href="/myCalendar/calendar" class="sub_menu_a">개인일정</a>
		</div>
	</div>
  