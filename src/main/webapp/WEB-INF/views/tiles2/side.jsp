<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>



<sec:authentication property="principal.userVO" var="vo"/>
   <div class="sub_menu">
    <div class="sub_title">카테고리명</div>
    <button class="sub_button">
      <a class="sub_text" href="">ex.글쓰기</a>
    </button>
    <div class="submenu_menu">
      <a href="#none" class="sub_menu_a">게시판1</a>
      <a href="#none" class="sub_menu_a">게시판2</a>
      <a href="#none" class="sub_menu_a">게시판3</a>
      <a href="#none" class="sub_menu_a">게시판4</a>
  </div>
  </div>