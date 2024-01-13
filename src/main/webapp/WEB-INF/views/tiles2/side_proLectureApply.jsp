<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.userVO" var="vo"/>
<div class="flex-shrink-0 p-3 bg-white sub_menu">
    <a href="/professor/lecture/list" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom" style="margin-top:65px; margin-left:5px;">
      <span class="fs-5">강의</span>
    </a>
    <button class="sub_button">
      <a class="sub_text" href="/professor/lectureapply/create" class="app_btn" style="display:block; height: 45px; line-height:45px;">강의계획신청</a>
    </button>
    <div class="submenu_menu">
      <a href="/professor/lectureapply/list?appYn=0" class="sub_menu_a">대기목록</a>
      <a href="/professor/lectureapply/list?appYn=1" class="sub_menu_a">승인목록</a>
      <a href="/professor/lectureapply/list?appYn=2" class="sub_menu_a">반려목록</a>
    </div>

  </div>