<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>여러 개의 파일 업로드 결과</title>
	</head>
	<body>
	
		${originalFileNameList } 파일을 업로드 하였습니다.<br>
		/Library/springWorkspace/upload 폴더에서 확인하세요.<br><br>
			
		<c:forEach var="file"  items="${originalFileNameList}">
			${file }<br><br>	
		</c:forEach>
	</body>
</html>