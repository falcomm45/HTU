<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="/resources/js/jquery.min.js"></script>
<style>
body{background-color:#F2F2F2;}
#home:hover{background-color:#000000; color:#ffffff;}
</style>
</head>
<body>
	<img src="/resources/images/404.jpg" style="position:absolute; top:50%; left:50%; transform:translate(-50%,-50%);"/>
	<div id="home" style="cursor:pointer; transition:.3s; border:4px solid #000000; border-radius:5px; padding:5px 15px; font-weight:600; font-size:20px; position:absolute; left:50%; top:75%; transform:translateX(-50%)">go back</div>
<script>
$("#home").on("click", function(){
	history.back();
});
</script>
</body>
</html>