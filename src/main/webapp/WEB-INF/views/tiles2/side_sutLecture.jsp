<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>



<sec:authentication property="principal.userVO" var="vo"/>
<div class="sub_menu">
	<div class="sub_title"></div>
	<button class="sub_button">
		<a class="sub_text" href="">강의목록</a>
	</button>
	<div class="submenu_menu">
		<a href="/student/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a">공지사항</a>
		<a href="/student/task/list?lecCd=${param.lecCd}" class="sub_menu_a">과제</a>
		<a href="/student/test/testList?lecCd=${param.lecCd}" class="sub_menu_a">시험</a>
		<a href="/student/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a">자료실</a>
		<a href="#none" class="sub_menu_a">질문게시판</a>
	</div>
</div>
  
  
<script>
  $.ajax({
    url: "/common/getLectureName?lecCd=${param.lecCd}",
    type: "get",
    contentType: "application/json; charset=UTF-8",
    async: false,
    success: res => {
      $(".sub_title").text(res);
    },
    error: xhr => {
      console.log(xhr);
    }
  })
</script>