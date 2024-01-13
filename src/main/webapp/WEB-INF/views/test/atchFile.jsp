<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>

<form action="/test/file" method="post" enctype="multipart/form-data">
  
  <input type="file" name="uploadFiles" id="file" multiple>
  
  <input type="submit" name="btnSubmit">
  <sec:csrfInput/>
</form>