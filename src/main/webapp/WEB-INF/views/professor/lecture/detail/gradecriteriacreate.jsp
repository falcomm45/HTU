<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<style>
.FreeBoard_box {
    display: inline-flex;
    background-color: white;
    flex-direction: row;
	gap: 10px; 
    justify-content: space-around;
	width: 100%;
	height: 50px;
}

/* 수정된 스타일 */
.FreeBoard_box input {
    width: 150px;
    text-align: center;
    height: 30px; /* 조절 필요한 높이로 변경 */
    margin-top: 10px;
}

/* 추가된 스타일 */
.form-control {
    height: 30px; /* 조절 필요한 높이로 변경 */
}
</
</style>


<%-- <p>${param.lecCd}@</p> --%>
<%-- <p>${lectureVO}@</p> --%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>
<div class="row" style="margin-bottom:20px; margin-left:1px;">
  <div class="col-lg-12">
    <h1 class="page-header">성적처리기준</h1>
	<hr>
  </div>
</div>
<form id="" action="/professor/gradecriteria/create?${_csrf.parameterName}=${_csrf.token}" method="post">
<div class="FreeBoard_box" >
	<input class="form-control" type="number" name="crtrMp" id=""  placeholder="중간고사비율"/>
	<input class="form-control" type="number" name="crtrFp" id=""  placeholder="기말고사비율"/>
	<input class="form-control" type="number" name="crtrTp" id=""  placeholder="과제비율"/>
	<input class="form-control" type="number" name="crtrAp" id=""  placeholder="출결비율"/>
	<input class="form-control" type="hidden" name="lecCd" id="" value="${param.lecCd}"/>
</div>
<button type="submit">등록</button>
</form>
