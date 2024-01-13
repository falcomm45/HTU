<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>

	.confirmButton{position:absolute; right:10px; bottom:10px; height:25px; font-size:12px; background-color:#333333!important;}
</style>
<sec:authentication property="principal.userVO" var="vo"/>
<div class="flex-shrink-0 p-3 bg-white sub_menu">
    <a href="/student/certificate/payment" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom" style="margin-top:65px; margin-left:5px;">
      <span class="fs-5">증명서발급</span>
    </a>
    <div class="submenu_menu" style="margin-top:25px;">
	<a href="/student/certificate/payment" class="sub_menu_a">재학증명서</a>
	<a class="sub_menu_a" href="/student/certificate/paymentGraduation" >졸업증명서</a>
	<a class="sub_menu_a" href="#none" >재적증명서</a>
	<a class="sub_menu_a" href="#none" >성적증명서</a>
	</div>
</div>
