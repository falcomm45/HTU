<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>



<sec:authentication property="principal.userVO" var="vo"/>
<div class="sub_menu">
  <div class="sub_title"><a href="/common/myportlet">포틀릿설정</a></div>
  <button class="sub_button" id="savePortlet">
    <a class="sub_text" href="#none">포틀릿 저장</a>
  </button>
  <div class="submenu_menu">
  </div>
</div>