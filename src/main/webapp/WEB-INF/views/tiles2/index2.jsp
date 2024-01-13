<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html class>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>HTU</title>
    <!-- font-awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- bootstrap.css -->
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <!-- simplebar.css / js -->
    <link rel="stylesheet" href="/resources/css/simplebar.css">
    <script src="/resources/js/simplebar.min.js"></script>
    <!-- aside.css -->
    <link href="/resources/css/sidebars.css" rel="stylesheet">
    <!-- reset.css -->
    <link rel="stylesheet" href="/resources/css/reset.css">
    <!-- button.css -->
    <link rel="stylesheet" href="/resources/css/button.css">
    <!-- main.css -->
    <!-- <link rel="stylesheet" href="/resources/css/main.css"> -->
    <link rel="stylesheet" href="/resources/css/main2.css">
    <!-- jquery -->
   <script src="/resources/js/jquery-3.6.3.min.js"></script>
   <!-- sweetalert -->
   <link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
   <!-- sockjs -->
   	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
   	<!-- jstree -->
   	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css"/>
    <!-- chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- npm/canvas.js -->
    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.9.2/dist/confetti.browser.min.js"></script>
  	<style>
	.content_wrap{width:100%;}
		/* sub_menu */
	.sub_menu{box-sizing: border-box; position:fixed; z-index:998; left:200px; top:0; width:250px; height: 100%; padding:25px; border-right: 1px solid #d1d0d0; background-color: #ffffff;}
	 header{width:calc(100% - 200px); position: fixed; z-index:997;}
	 .content{width: calc(100% - 250px); left:250px;}
	.sub_title{font-size: 22px; padding-top:55px; padding-bottom: 25px;}
	.sub_button{width:200px; height: 45px; margin-bottom: 30px; text-align: center; background-color: #ffffff; border-radius: 5px; border:1px solid #d1d0d0;}
	.sub_button:hover{ box-shadow: 0 2px 6px rgba(0,0,0,0.2); transition: all .2s; border: 1px solid #888888;}
	.sub_text{font-size: 15px;}
	.submenu_menu{padding:10px;}
	.sub_menu b:hover{color:#333333;}
	.sub_menu_b{display:block; font-size:16px; padding:15px 0 10px 10px;}
	.sub_menu_c{display:block; font-size:14px; padding:10px 0 5px 10px;}
	.submenu_menu ul{border-bottom:1px solid #ebebeb;}
	.submenu_menu ul:last-child{border-bottom:none;}
	.sub_title2{font-size:18px; color:#333333; margin-bottom:5px;}
	.sub_menu_a{font-size: 15px;letter-spacing: 1px; font-weight: 500; display: block; padding: 15px 0;}
	 header a{color:#333333!important; text-decoration:none!important;}
	 header a:hover{color:#333333!important; text-decoration:none!important;}
	 .content{padding:25px; overflow-x:hidden;}
	 /* BookkMyungjo-Bd 폰트변경*/
	@font-face {
	   font-family: 'BookkMyungjo-Bd';
	   src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/BookkMyungjo-Bd.woff2') format('woff2');
	   font-weight: 700;
	   font-style: normal;
	}

</style>
</head>
<body>
  <!--   class="sidebar-mini sidebar-closed sidebar-collapse" -->
  
  <div class="HTU-wrapper">
    
    <tiles:insertAttribute name="aside2" />
    
    <section class="body_container" style="background-color: #EEF1F6;">
      <tiles:insertAttribute name="header" />
      <div class="content_wrap">
        
        <tiles:insertAttribute name="side"/>
        
        <div id="content" class="content">
		        
          <tiles:insertAttribute name="body"/>
			    <tiles:insertAttribute name="footer" />
        </div>
      </div>
    </section>
    
    
  </div>
  
  <!-- fullcalendar api -->
	<script src="/resources/js/index.global.min.js"></script>
  <script src="/resources/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/js/sidebars.js"></script>
  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
 <!-- quickmenu swiper
    <script>
      var swiper = new Swiper(".quickSwiper", {
        direction: "vertical",
        slidesPerView: 4,
        navigation: {
          nextEl: ".quick_arrow",
        },
        loop: true,
      });
    </script> -->
    <!-- main.JS -->
    <script src="/resources/js/alarm.js"></script>
    <c:if test="${not empty alarm}">
      <script>
   		setTimeout(sendMessageToServer, 1500, '${alarm}')
   	  </script>
    </c:if>
    <script src="/resources/js/main.js"></script>
    <!--sweetalert-->
    <script src="/resources/js/sweetalert2.min.js"></script>
    <!-- daum 주소 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
  </body>
  </html>