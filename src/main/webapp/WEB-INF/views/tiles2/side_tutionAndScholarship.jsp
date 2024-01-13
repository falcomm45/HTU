<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.userVO" var="vo"/>
<div class="flex-shrink-0 p-3 bg-white sub_menu">
    <a href="/employee/tuition/list" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom" style="margin-top:65px; margin-left:5px;">
      <span class="fs-5">등록/장학</span>
    </a>
    <a href="/employee/tuition/list" class="d-flex align-items-center text-decoration-none border-bottom">
      <span class="sub_title2" style="margin-left:10px; margin-top:20px; margin-bottom:10px; font-size:18px;">등록</span>
    </a>
    <ul class="list-unstyled ps-0" style="margin-bottom:10px;">
      <li class="mb-1">
        <a href="/employee/tuition/list" style="padding-top:10px; padding-bottom:5px;" class=" btn-toggle align-items-center rounded collapsed" data-bs-target="#home-collapse2" aria-expanded="true">
         	 <svg xmlns="http://www.w3.org/2000/svg" height="10" width="10" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#333333" d="M0 128C0 92.7 28.7 64 64 64H320c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z"/></svg>
         	 <span style="margin-left:3px;">등록금 관리</span>
         	 
        </a>
      </li>
    </ul>
    <div style="width:100%; height:1px; background-color:#ebebeb;"></div>
    <a href="/employee/schlship/awardSchlship" class="d-flex align-items-center text-decoration-none border-bottom">
      <span class="sub_title2" style="margin-left:10px; margin-top:30px; margin-bottom:10px; font-size:18px;">장학</span>
    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <a href="/employee/schlship/awardSchlship" style="padding-top:10px; padding-bottom:5px;" class="btn-toggle align-items-center rounded collapsed" data-bs-target="#home-collapse3" aria-expanded="true">
         	<svg xmlns="http://www.w3.org/2000/svg" height="10" width="10" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#333333" d="M0 128C0 92.7 28.7 64 64 64H320c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z"/></svg>
         	<span style="margin-left:3px;">장학금 수여</span>
        </a>
      </li>
      <li class="mb-1">
        <a href="/employee/schlship/schlshipList" style="padding-top:10px; padding-bottom:5px;" class="btn-toggle align-items-center rounded collapsed" data-bs-target="#home-collapse4" aria-expanded="true">
         	<svg xmlns="http://www.w3.org/2000/svg" height="10" width="10" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#333333" d="M0 128C0 92.7 28.7 64 64 64H320c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z"/></svg>
         	<span style="margin-left:3px;">장학생 조회</span>
        </a>
      </li>
      <li class="mb-1">
        <a href="/employee/tutionAndScholarship/recommendList" style="padding-top:10px; padding-bottom:5px;" class="btn-toggle align-items-center rounded collapsed" data-bs-target="#home-collapse4" aria-expanded="true">
         	<svg xmlns="http://www.w3.org/2000/svg" height="10" width="10" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#333333" d="M0 128C0 92.7 28.7 64 64 64H320c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z"/></svg>
         	<span style="margin-left:3px;">교수 추천 내역</span>
        </a>
      </li>
      
    </ul>
  </div>
   