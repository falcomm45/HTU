<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
/* 공통 스타일 */
.text-center {
	text-align: center;
}

/* 글쓰기 링크 스타일 */
.write-link {
	position: absolute;
	top: 50%;
	left: 80%;
}

.FreeBoard_box {
	background-color: white;
	border: 1px solid #D8D8D8;
    display: inline-flex;
    flex-direction: column;
	gap: 10px; 
    justify-content: space-between;
	border-radius: 10px;
    width: 250px;
    height: 230px;
    flex: 1;	
    margin:20px;
}
.FreeBoard_box .top-section {
	background-color: #860A35; /* 태두리색과 동일하게 설정 */
	border: 1px solid #860A35; 
	border-top-left-radius:10px ;
	border-top-right-radius:10px ;
/*     border-radius: 16px; */
	height: 120px;
	width: 100%;
/* 	flex: 1; /* 높이를 동일하게 나누기 위한 설정  */
}

/* 아래 영역 스타일 */
.FreeBoard_box .bottom-section {
/*  	background-color: #f6f0f1; */
 	background-color: white;
 	border-radius: 16px #D8D8D8;
 	border-bottom-left-radius: 10px ;
 	border-bottom-right-radius: 10px;
 	height: 60px;
 	width: 100%;
}

.FreeBoard_box .top-section .fa-solid.fa-circle-info {
    display: inline-block;
    margin-top: 30px;
    margin-left: 20px;
}
.FreeBoard_box .top-section .clsSpan {
    display: block;
    margin-top:10px;
	padding: 0 20px;
    color: white;
    font-size: 0.8em; /* 원하는 글자 크기 설정 */
    position: absolute;
}

.top-section .spanA {
    width: 60%;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    padding-left: 0px;
    display: inline-block;
    color: white;
}

.top-section .spanB {
    width: 35%;
    overflow: hidden;
    white-space: nowrap;
/*     text-overflow: ellipsis; */
    display: inline-block;
    color: white;
}

</style>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>
<div> 
<c:forEach items="${enrolmentVOList}" var="enrolmentVO" varStatus="stat">
	<div class="FreeBoard_box" >
		<a class="top-section" href="/student/lecture/detail?lecCd=${enrolmentVO.lectureVO.lecCd}">
<!-- 			<i class="fa-solid fa-circle-info" style="color: white;"></i> -->
			<div
			style="color: white; font-size: 1.3em; width:100%; padding:30px 20px;">
			<span class="spanA">${enrolmentVO.lectureVO.lectureApplyVO.lecaNm}</span>
			<c:if test="${enrolmentVO.lectureVO.lectureApplyVO.lecaType == 0}"><span class="spanB">(전필)</span></c:if>
			<c:if test="${enrolmentVO.lectureVO.lectureApplyVO.lecaType == 1}"><span class="spanB">(전선)</span></c:if>
			<c:if test="${enrolmentVO.lectureVO.lectureApplyVO.lecaType == 2}"><span class="spanB">(교필)</span></c:if>
			<c:if test="${enrolmentVO.lectureVO.lectureApplyVO.lecaType == 3}"><span class="spanB">(교선)</span></c:if>
			</div>
			<span class="clsSpan">${enrolmentVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}</span>
        </a>
        <div class="bottom-section">
            <!-- 아래 영역의 내용 -->
            <ul class="clsUl" style="display:flex; font-size:13px; height:25px; line-height:25px; text-align:center; justify-content:space-between; margin-top:20px; width:250px; box-sizing:border-box;" >
            	<a href="/student/lecturenotice/list?lecCd=${enrolmentVO.lectureVO.lecCd}" style="flex:1; border-right:1px solid #888888;">
            	공지사항
            	</a>
            	<a href="/student/lecturedata/list?lecCd=${enrolmentVO.lectureVO.lecCd}" style="flex:1; border-right:1px solid #888888;">자료실</a>
            	<a href="/student/task/list?lecCd=${enrolmentVO.lectureVO.lecCd}" style="flex:1;">과제</a>
            </ul>
        </div>
	</div>
</c:forEach>
</div>	


<script>
$(function(){
	
	
	
});
</script>