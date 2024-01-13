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
  	<style>
  		.content{padding:25px;}
  	</style>
  </head>
  <body class="sidebar-mini sidebar-closed sidebar-collapse">
    
    
    <div class="wrapper">
    	
    	<tiles:insertAttribute name="aside2" />
	    <section class="body_container" style="background-color: #EEF1F6;">
	      <tiles:insertAttribute name="header" />
	      <div id="content" class="content">

	       	<tiles:insertAttribute name="body"/>
    	    <%@include file="../loading.html" %>
		    <tiles:insertAttribute name="footer" />
	      </div>
	    </section>
    
    
    </div>
    
   <!-- fullcalendar api -->
	<script src="/resources/js/index.global.min.js"></script>
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
   	<script src="/resources/js/sidebars.js"></script>
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <!-- <!-- quickmenu swiper
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
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/5c4949cf19.js" crossorigin="anonymous"></script>
    <script>
      
    </script>
  </body>
</html>