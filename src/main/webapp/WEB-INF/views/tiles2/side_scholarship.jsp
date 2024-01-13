<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal.userVO" var="vo"/>
<div class="flex-shrink-0 p-3 bg-white sub_menu">
    <a href="/professor/scholarshipRecommend/list" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom" style="margin-top:65px; margin-left:5px;">
      <span class="fs-5">장학관리</span>
    </a>
    <div class="submenu_menu">
      <a href="/professor/scholarshipRecommend/list" class="sub_menu_a">장학생추천</a>
      <a href="/professor/scholarshipRecommend/recommendApplyList" class="sub_menu_a">추천내역</a>
  </div>
  </div>