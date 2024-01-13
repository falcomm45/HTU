<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
	header a:hover {
	color: #333333;
}
.myPage_modal>a{
	display: block;
	padding: 10px;
	font-size: 13px;
	text-align: center;
	color: #888888 !important;
}
.myPage_modal>a:hover{
	color: #333333 !important;
}
.myPage_modal .logout:hover{color: #333333 !important;}

/* css도 챙겨 ! */
.clickActive{background-color: #ebebeb; color:#ffffff;}
.alarmcategory a{display: block; margin-right: 5px; padding: 7px 12px; font-size: 14px; line-height: 10px; border: 1px solid #ebebeb; border-radius: 20px;}
.alarm_box{position: relative; z-index: 999;}
.alarm_box::before{content: "";width: 0;
      height: 0;
      border-left: 30px solid transparent;
      border-right: 30px solid transparent;
      border-bottom:60px solid #ffffff; position: absolute; right:0; top:-15px; z-index: 998; 
}
.myPage_modal::before{content: "";width: 0;
      height: 0;
      border-left: 10px solid transparent;
      border-right: 10px solid transparent;
      border-bottom:20px solid #ffffff; position: absolute; right:10px; top:-15px; z-index: 998;}
.alarm_box li.d-flex{cursor:pointer; padding:10px; border-bottom:1px solid #ebebeb; transition: .3s;}
.alarm_box li.d-flex:hover{background-color: #ebebeb;}
.alarm_box a{color:#333333;}
.alarm_box a:hover{color:#333333;}

</style>
<sec:authentication property="principal.userVO" var="vo"/>

<!-- ///////////////////////////////header시작///////////////////////////////////-->
<header>
	<div class="time">
		<!-- timer -->
		<div id="timer">
			<span id="minutes"> 60</span> : <span id="seconds">00</span>
		</div>
		<button onclick="addExtraTime()" class="time_btn" style="padding:4px 7px;">
		<svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#ffffff" d="M464 256A208 208 0 1 1 48 256a208 208 0 1 1 416 0zM0 256a256 256 0 1 0 512 0A256 256 0 1 0 0 256zM232 120V256c0 8 4 15.5 10.7 20l96 64c11 7.4 25.9 4.4 33.3-6.7s4.4-25.9-6.7-33.3L280 243.2V120c0-13.3-10.7-24-24-24s-24 10.7-24 24z"/></svg>
		<span style="margin-top:2px; color:#ffffff;">시간연장</span></button>
	</div>
	<div class="header_right_box">
		<a href="/mail/inbox" class="mailAlarm" style="position: relative; margin-right:13px;">
          <svg xmlns="http://www.w3.org/2000/svg" height="24" width="24" viewBox="0 0 512 512"><path fill="#555555" d="M64 112c-8.8 0-16 7.2-16 16v22.1L220.5 291.7c20.7 17 50.4 17 71.1 0L464 150.1V128c0-8.8-7.2-16-16-16H64zM48 212.2V384c0 8.8 7.2 16 16 16H448c8.8 0 16-7.2 16-16V212.2L322 328.8c-38.4 31.5-93.7 31.5-132 0L48 212.2zM0 128C0 92.7 28.7 64 64 64H448c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z"/></svg>
				<path fill="#555555" d="M224 0c-17.7 0-32 14.3-32 32V51.2C119 66 64 130.6 64 208v25.4c0 45.4-15.5 89.5-43.8 124.9L5.3 377c-5.8 7.2-6.9 17.1-2.9 25.4S14.8 416 24 416H424c9.2 0 17.6-5.3 21.6-13.6s2.9-18.2-2.9-25.4l-14.9-18.6C399.5 322.9 384 278.8 384 233.4V208c0-77.4-55-142-128-156.8V32c0-17.7-14.3-32-32-32zm0 96c61.9 0 112 50.1 112 112v25.4c0 47.9 13.9 94.6 39.7 134.6H72.3C98.1 328 112 281.3 112 233.4V208c0-61.9 50.1-112 112-112zm64 352H224 160c0 17 6.7 33.3 18.7 45.3s28.3 18.7 45.3 18.7s33.3-6.7 45.3-18.7s18.7-28.3 18.7-45.3z" />
        </a>
		<a href="#none" class="alarm" data-bs-toggle="dropdown" aria-expanded="false">
			<svg xmlns="http://www.w3.org/2000/svg" height="24" width="20" viewBox="0 0 448 512">
				<path fill="#555555" d="M224 0c-17.7 0-32 14.3-32 32V51.2C119 66 64 130.6 64 208v25.4c0 45.4-15.5 89.5-43.8 124.9L5.3 377c-5.8 7.2-6.9 17.1-2.9 25.4S14.8 416 24 416H424c9.2 0 17.6-5.3 21.6-13.6s2.9-18.2-2.9-25.4l-14.9-18.6C399.5 322.9 384 278.8 384 233.4V208c0-77.4-55-142-128-156.8V32c0-17.7-14.3-32-32-32zm0 96c61.9 0 112 50.1 112 112v25.4c0 47.9 13.9 94.6 39.7 134.6H72.3C98.1 328 112 281.3 112 233.4V208c0-61.9 50.1-112 112-112zm64 352H224 160c0 17 6.7 33.3 18.7 45.3s28.3 18.7 45.3 18.7s33.3-6.7 45.3-18.7s18.7-28.3 18.7-45.3z" />
			</svg>
		</a>
			<!-- //////////////////////////////새로만든알람화면 -->
			<div class="alarm_box dropdown-menu" style="padding:20px; position: absolute; top:55px; right:40px; border-radius: 10px; width:350px; height: 600px; background-color: #ffffff; border: 1px solid #f2f3f4;">
				<div style="font-size: 16px; font-weight: 500; padding-bottom: 10px; color: #333; border-bottom: 1px solid #ebebeb;">알림</div>
				<div style="width:100%; overflow-x: scroll; margin-top: 15px;">
					<div class="alarmcategory" style="width: 600px; display: flex; padding: 5px;">
					<a class="clickActive" id="alarmAll"  href="#none">전체</a>
					<a id="mailAlarm" href="#none">메일</a>
					<a id="academicAlarm" href="#none">강의</a>
					<a id="commentAlarm" href="#none">댓글</a>
					<a href="#none">학적</a>
					<a id="counselAlarm" href="#none">상담</a>
					<a id="etcAlarm" href="#none">기타</a>
					</div>
				</div>
				<div style="margin-top:10px; border: 1px solid #ebebeb; height: 450px;" data-simplebar="init" class="nav nav-pills simplebar-content-wrapper">
					<ul>
						<ol id="notificationList" style="height: 100%;">
							
						</ol>
					</ul>
				</div>
			</div>
			<!-- //////////////////////////////새로만든알람화면 -->

		<a class="myPage_btn" style="position: relative; cursor: pointer;">
			<svg xmlns="http://www.w3.org/2000/svg" height="24" width="24"
				viewBox="0 0 512 512">
				<path fill="#555555"
					d="M406.5 399.6C387.4 352.9 341.5 320 288 320H224c-53.5 0-99.4 32.9-118.5 79.6C69.9 362.2 48 311.7 48 256C48 141.1 141.1 48 256 48s208 93.1 208 208c0 55.7-21.9 106.2-57.5 143.6zm-40.1 32.7C334.4 452.4 296.6 464 256 464s-78.4-11.6-110.5-31.7c7.3-36.7 39.7-64.3 78.5-64.3h64c38.8 0 71.2 27.6 78.5 64.3zM256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-272a40 40 0 1 1 0-80 40 40 0 1 1 0 80zm-88-40a88 88 0 1 0 176 0 88 88 0 1 0 -176 0z" /></svg>
		</a>
		<div class="myPage_modal"
			style="display:none; position: absolute; top: 55px; right: 15px; text-wrap: nowrap; text-align: center; background-color: #ffffff; border-radius: 10px;">
			<a href="/common/mypage/profile">마이페이지</a>
			<form action="/logout" method="post" id="logoutForm"> 
      	<button class="logout" type="submit" style="font-size:13px; color: #888888; border:none; background-color:#ffffff; padding:10px;">
      	로그아웃
      	</button>
      	<sec:csrfInput/>
      </form>
		</div>
	</div>
</header>
<script>
	$(document).ready(function() {
		$('.myPage_btn').click(function() {
			$('.myPage_modal').fadeToggle();
		});
		$('.alarm_btn').click(function() {
			$('.alarm_box').fadeToggle();
		});
		$(".alarmcategory a").click(function () {
    $(this).addClass('clickActive');
    $(this).siblings().removeClass('clickActive');
  	});
		
	})
</script>