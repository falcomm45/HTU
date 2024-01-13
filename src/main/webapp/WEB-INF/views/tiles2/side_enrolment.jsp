<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>



<sec:authentication property="principal.userVO" var="vo"/>
<div class="sub_menu">
	<div class="sub_title">수강신청</div>
	<button class="sub_button">
		<a class="sub_text" href="">ex.글쓰기</a>
	</button>
	<div class="submenu_menu">
		<a href="/student/enrolment/list" class="sub_menu_a">예비수강신청</a>
		<a href="/student/enrolment/app" class="sub_menu_a">수강신청</a>
	</div>
</div>