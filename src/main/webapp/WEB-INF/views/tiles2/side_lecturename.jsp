<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>



<sec:authentication property="principal.userVO" var="vo"/>

<div class="lectureName" style="display: none;"></div>
<div class="flex-shrink-0 p-3 bg-white sub_menu">
  <a href="/student/lecture/list" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom" style="margin-top:65px; margin-left:5px;">
      <span class="fs-5">내 강의실</span>
   </a>
  <div class="submenu_menu" style="margin-top:25px;" id="lectureListContainer">

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.userVO" var="userVO" />
	</sec:authorize>
  </div>
</div>
<script>
$(function(){
  $.ajax({
    url: "/common/getLectureName?lecCd=${param.lecCd}",
    type: "get",
    contentType: "application/json; charset=UTF-8",
    async: false,
    success: res => {
      $(".lectureName").text(res);
	  console.log("res ==> " , res);
    },
    error: xhr => {
      console.log(xhr);
    }
  })
  $.ajax({
      type: "GET",
      url: "/student/start/lectureList",
      dataType: "json",
      success: function(result) {
          console.log(result);

          for (var i = 0; i < result.length; i++) {
              var startLecCd = result[i].startLecCd;
              var startLecaNm = result[i].startLecaNm;
              console.log("lecCd: " + startLecCd + ", lecaNm: " + startLecaNm);
//               <a class="sub_menu_a" href="/student/lecture/detail?lecCd=${enrolmentVO.lectureVO.lecCd}">
//   	    	${enrolmentVO.lectureVO.lectureApplyVO.lecaNm}
//   		</a>
              var link = $('<a>').attr({
                  'href': '/student/lecture/detail?lecCd=' + startLecCd,
                  'class': 'sub_menu_a'}).text(startLecaNm);
              $('#lectureListContainer').append($('<div>').append(link));
          }
      },
      error: function(xhr, status, error) {
          console.error("error", xhr, error);
      }
  });
  });
</script>