<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
	.sub_menu a:hover{color:#333333;}
</style>

<sec:authentication property="principal.userVO" var="vo"/>
   <div class="sub_menu">
    <div class="sub_title"><a href="/employee/crew/crewList">동아리</a></div>
    <div class="submenu_menu">
      <a href="/employee/crew/crewList" class="sub_menu_a">동아리 관리</a>
      <a href="/employee/crew/crewAppList" class="sub_menu_a">동아리 개설 승인</a>
  </div>
  </div>