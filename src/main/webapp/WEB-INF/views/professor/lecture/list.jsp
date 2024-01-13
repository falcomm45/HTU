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

/* 카드 스타일 */
.card-body {
	width: 60%;
	height: 10%;
}

.card .topic {
	position: relative;
	padding-top: 30px;
}

.free_topic {
	font-size: 30px;
	padding-bottom: 30px;
}

.FreeBoard_box .free_topic i {
	margin-left: 10px;
	color: #333333; /* 추가된 부분 */
}

.FreeBoard_box table {
	font-size: 14px;
	width: 168%;
}

.FreeBoard_box table tbody tr {
	cursor: pointer;
}

.FreeBoard_box table tbody tr td:nth-child(2) {
	text-align: left; /* 두 번째 열(제목)만 왼쪽 정렬 */
}

.FreeBoard_box table tbody tr td:not(:nth-child(2)) {
	text-align: center; /* 나머지는 가운데 정렬 */
}

/* Optional: If you want to center text in the first column vertically */
.FreeBoard_box table tbody tr td:nth-child(2) {
	vertical-align: middle;
}

.FreeBoard_box table tbody tr {
	height: 20px; /* 적절한 높이로 조절해주세요 */
	line-height: 20px; /* 적절한 높이로 조절해주세요 */
}

.table_title {
	font-size: 13px;
	border: 1px solid #d1d0d0;
	height: 32px;
	line-height: 32px;
	background-color: #f8f9fa;
	font-weight: bold; /* 글씨 굵게 */
}

/* 검색 폼 스타일 */
#searchForm {
	position: absolute;
	left: 37%;
	top: 14px;
	display: flex; /* 추가된 부분 */
}

#searchForm select, #searchForm input {
	margin-right: 5px; /* 추가된 부분 */
}

#searchForm button {
	margin-left: 5px; /* 추가된 부분 */
}

/* 페이지 네비게이션 스타일 */
.page.navigation {
	margin-top: 20px;
}

.pagination {
	display: flex;
	justify-content: center;
	list-style: none; /* 추가된 부분 */
	padding: 0; /* 추가된 부분 */
}

.FreeBoard_box table tbody tr td:first-child {
	font-weight: bold;
}

.pagination li {
	margin: 0 5px;
}

.pagination a {
	text-decoration: none;
	color: #333;
	font-weight: bold;
	padding: 5px 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	cursor: pointer;
}

.pagination .active a {
	background-color: #007bff;
	color: #fff;
}

/* 글쓰기 링크 스타일 */
.write-link {
	position: absolute;
	top: 50%;
	left: 80%;
}
</style>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>
<div class="FreeBoard_box" style="background-color: white; height:100%;">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				</br> </br>
				<div class="topic">
					</br> </br> </br>
					<div class="free_topic"
						style="position: absolute; left: 3%; top: 38%">
						강의목록<i class="fa-solid fa-circle-info"
							style="position: absolute; top: 1px;"></i>
					</div>
				</div>
				<div class="card-body">
					<div id="bootstrap-data-table_wrapper"
						class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
						<div class="row">
							<div class="col-sm-12">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered dataTable no-footer"
									role="grid" aria-describedby="bootstrap-data-table_info">
									<thead>
										<tr>
										<tr role="row" class="table_title">
											<th width="1%;" class="text-center"><b>No</b></th>
											<th width="60%;" class="text-center"><b>강의명</b></th>
											<th width="120px;" class="text-center"><b>개강상태</b></th>
										</tr>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${lectureVOList}" var="lectureVO"
											varStatus="stat">
												<tr role="row" class="odd" style="cursor: pointer;">
													<th style="padding-right: 2px;" class="text-center">${stat.count}</th>
													<td class="text-center" style="text-align: left;"><a class="detail" style="text-align: left;"
														href="/professor/lecture/detail?lecCd=${lectureVO.lecCd}&lecNm=${lectureVO.lectureApplyVO.lecaNm}"
														data-lecapp-code="${lectureVO.lectureApplyVO.lecaCd}">${lectureVO.lectureApplyVO.lecaNm}</a></td>
													<%-- 						<td>${lectureVO.lectureApplyVO.professorVO.userVO.userNm}</td>  --%>
													<c:if test="${lectureVO.lecStat == 0}">
														<td>개강</td>
													</c:if>
													<c:if test="${lectureVO.lecStat == 1}">
														<td>종강</td>
													</c:if>
													<c:if test="${lectureVO.lecStat == 2}">
														<td>폐강</td>
													</c:if>
												</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>

					</div>
				</div>
			</div>

		</div>

	</div>
</div>
<script>

</script>

