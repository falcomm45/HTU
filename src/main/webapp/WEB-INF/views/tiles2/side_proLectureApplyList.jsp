<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
	.sub_menu b:hover{color:#333333;}
	.sub_menu_b{display:block; padding:10px 0 15px 15px; font-size:14px;}
	.submenu_menu ul{border-bottom:1px solid #ebebeb; margin-bottom:20px;}
	.sub_title2{font-size:16px; color:#333333; margin-bottom:5px;}
</style>

<sec:authentication property="principal.userVO" var="vo"/>
<div class="sub_menu">
    <div class="lectureName" style="display: none;"></div>
    <div class="sub_title"><a href="/professor/lecture/list">강의</a></div>
    <div class="submenu_menu">
        <ul id="lectureListContainer">
            <div class="sub_title2" style="margin-bottom: 26px;"><a href="/professor/lecture/list" class="sub_title2">현재학기강의</a></div>
        </ul>
    </div>
    <div class="submenu_menu2">
     <ul id="lectureListContainer2">
        <div class="sub_menu_b"><a href="/professor/endlecture/list" class="sub_title2">이전학기강의</a></div>
      </ul>
    </div>
</div>
  
  
<script type="text/javascript">
$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: "/professor/start/lectureList",
        dataType: "json",
        success: function(result) {
            console.log(result);

            for (var i = 0; i < result.length; i++) {
                var startLecCd = result[i].startLecCd;
                var startLecaNm = result[i].startLecaNm;
                console.log("lecCd: " + startLecCd + ", lecaNm: " + startLecaNm);

                var link = $('<a>').attr({
                    'href': '/professor/lecture/detail?lecCd=' + startLecCd + '&lecNm=' + startLecaNm,
                    'class': 'sub_menu_b'}).text(startLecaNm);
                $('#lectureListContainer').append($('<div>').append(link));
            }
        },
        error: function(xhr, status, error) {
            console.error("error", xhr, error);
        }
    });
//     $.ajax({
//         type: "GET",
//         url: "/professor/end/lectureList",
//         dataType: "json",
//         success: function(result) {
//             console.log(result);

//             for (var i = 0; i < result.length; i++) {
//                 var endLecCd = result[i].endLecCd;
//                 var endLecaNm = result[i].endLecaNm;
//                 console.log("lecCd: " + endLecCd + ", lecaNm: " + endLecCd);

//                 var link = $('<a>').attr({
//                     'href': '/professor/lecture/detail?lecCd=' + endLecCd + '&lecNm=' + endLecaNm,
//                     'class': 'sub_menu_b'}).text(endLecaNm);
//                 $('#lectureListContainer2').append($('<div>').append(link));
//             }
//         },
//         error: function(xhr, status, error) {
//             console.error("error", xhr, error);
//         }
//     });
  $.ajax({
    url: "/common/getLectureName?lecCd=${param.lecCd}",
    type: "get",
    contentType: "application/json; charset=UTF-8",
    async: false,
    success: res => {
      $(".lectureName").text(res);
    },
    error: xhr => {
      console.log(xhr);
    }
  });
});
</script>