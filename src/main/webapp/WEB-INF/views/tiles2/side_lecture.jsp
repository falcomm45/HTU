<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>



<sec:authentication property="principal.userVO" var="vo"/>


<div class="sub_menu">
  <div class="sub_title"></div>
  <button class="sub_button">
    <a class="sub_text" href="/professor/lecture/list" class="app_btn" style="display:block;">강의목록</a>
  </button>
  <div class="submenu_menu">
<%--     <a href="/professor/weekplan/list?lecCd=${param.lecCd}" class="sub_menu_a">주차별계획</a> --%>
    <a href="/professor/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a">공지사항</a>
    <a href="/professor/task/list?lecCd=${param.lecCd}" class="sub_menu_a">과제</a>
    <a href="/professor/test/testList?lecCd=${param.lecCd}" class="sub_menu_a">시험</a>
    <a href="/professor/lectureAttendance?lecCd=${param.lecCd}" class="sub_menu_a">출결관리</a>
    <a href="/professor/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a">자료실</a>
    <a href="/professor/objection/list?lecCd=${param.lecCd}" class="sub_menu_a">성적이의신청</a>
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