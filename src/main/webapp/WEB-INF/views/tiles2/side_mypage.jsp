<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal.userVO" var="vo" />
<div class="sub_menu">
  <div class="sub_title"><a href="/common/mypage/profile">마이페이지</a></div>
  <div class="submenu_menu">
    <a href="/common/mypage/profile" class="sub_menu_a">내 정보</a>
    <a href="/common/mypage/profileEdit" class="sub_menu_a">정보수정</a>
    <a href="/common/mypage/passwordEdit" class="sub_menu_a">비밀번호변경</a>
    <a href="/common/mypage/myBoardList" class="sub_menu_a">내가 쓴 게시글</a>
    <a href="/common/mypage/myReportList" class="sub_menu_a">내 신고 내역</a>
  </div>
</div>
 