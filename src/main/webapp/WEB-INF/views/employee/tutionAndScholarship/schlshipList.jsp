<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.scholarship_box{width:100%; height:100%; overflow-y:scroll; padding:40px; background-color:#ffffff; height: 100%;}
	.scholarship_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.scholarship_box .table_topic i{margin-left:10px;}
	.scholarship_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.scholarship_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.scholarship_box tr:first-child{background-color:#EEF1F6;}
	.scholarship_box tr:hover{background-color:#f2f3f4;}
	.scholarship_box tr td:nth-child(1){width:5%;}
	.scholarship_box tr td:nth-child(2){width:10%;}
	.scholarship_box tr td:nth-child(3){width:15%;}
	.scholarship_box tr td:nth-child(4){width:10%;}
	.scholarship_box tr td:nth-child(5){width:10%;}
	.scholarship_box tr td:nth-child(6){width:10%;}
	.scholarship_box tr td:nth-child(7){width:10%;}
	.scholarship_box tr td:nth-child(8){width:5%;}
	.scholarship_box tr td:nth-child(9){width:10%;}
	.scholarship_box tr td:nth-child(10){width:15%;}
	.schl_box{
		display: flex; 
		justify-content: center;
	    padding: 20px;
	    background-color: #EEF5FF;
	    border-radius: 10px;
	    margin-bottom: 20px;
	    align-items: center;
	}
	.schl_box select{
		border: 1px solid #9EB8D9;
		border-radius: 6px;
		width: 200px; font-size:14px;
	}
	.schl_box input:focus{outline:none;}
	.schlTotal {margin-bottom: 10px; font-size: 14px;}
</style>
<div class="scholarship_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">등록/장학</span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">장학</span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/schlship/schlshipList">장학생 조회</a></span>
	</div>
	<div class="table_topic">장학생 조회</div>
	<div class="schl_box">
		<div>장학년도
			<select id="sclYear">
				<option value="0">전체</option>
				<option value="2023">2023</option>
				<option value="2022">2022</option>
			</select>
		</div>
		<div style="margin: 0 20px 0 40px;">학기
			<select id="sclSem" name="sclSem">
				<option value="0">전체</option>
				<option value="1">1학기</option>
				<option value="2">2학기</option>
			</select>
		</div>
		<div>
			<button type="button" class="btn-two green mini" id="searchBtn">조회</button>		
		</div>
	</div>
	
	<div class="schlTotal">
		<span>장학금 총액 : </span><span id="schlSum" style="color: #0000d9"></span><span>원</span>
	</div>
	<table id="schlTbl">
		<tr class="table_title">
			<th>no</th>
			<th>단과대학</th>
			<th>학과</th>
			<th>학번</th>
			<th>학년</th>
			<th>이름</th>
			<th>장학년도</th>
			<th>학기</th>
			<th>장학구분</th>
			<th>장학금(원)</th>
		</tr>
		<c:forEach var="schlVO" items="${schlshipVOList}" varStatus="stat">
			<tr id="yubeen">
				<td>${stat.count}</td>
				<td>${schlVO.studentVO.colNm}</td>
				<td>${schlVO.studentVO.depNm}</td>
				<td>${schlVO.stuCd}</td>
				<td>${schlVO.studentVO.stuYear}학년</td>
				<td>${schlVO.studentVO.stuNm}</td>
				<td>${schlVO.sclYear}</td>
				<td>${schlVO.sclSem}</td>
				<td>${schlVO.sclNm}</td>
				<td><fmt:formatNumber value="${schlVO.sclSum}" type="number"></fmt:formatNumber></td>
				<td hidden="hidden">${schlVO.sclSum}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<script>
$(function(){
	
	// 장학금 총액 구하기
	const table = document.getElementById('schlTbl');
	
	let sum = 0;
	for(let i = 1; i < table.rows.length; i++)  {
		sum += parseInt(table.rows[i].cells[10].innerHTML);
	}
	
	console.log("sum : ", sum);
	
	const schlSum = sum.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	document.getElementById('schlSum').innerText = schlSum;
	
	$("#searchBtn").on("click", function(){
		
		let sclYear = $("#sclYear").val();
		let sclSem = $("#sclSem").val();
		
		console.log("sclYear : ", sclYear);
		console.log("sclSem : ", sclSem);
		
		//장학년도는 전체, 학기 선택 시 
		if(sclYear == 0 && sclSem != 0) {
			alertError("장학년도를 선택해 주세요.");
		//장학년도 선택 
		}else if(sclYear != 0){
			//전체 학기 선택 시
			if(sclSem == 0) {
		 		$.ajax({
		 			url:"/employee/schlship/searchYear",
		 			data:{
		 				"sclYear" : sclYear
		 			},
		 			type:"post",
		 			beforeSend:function(xhr){
		 				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		 			},
		 			success:function(res){
		 				console.log("res : ", res);
		 				
		 				const table = document.getElementById('schlTbl');
						let row = table.rows.length;
						console.log("row : ", row);
						
						for(let i = 1; i < row;){
							
							if(row == 1){
								return false;
							}else{
								table.deleteRow(i);
							}
							row--;
						};
						
						let sum2 = 0;
						
						$.each(res, function(index, item) {
							const newRow = table.insertRow();
							const newCell1 = newRow.insertCell(0);
							const newCell2 = newRow.insertCell(1);
							const newCell3 = newRow.insertCell(2);
							const newCell4 = newRow.insertCell(3);
							const newCell5 = newRow.insertCell(4);
							const newCell6 = newRow.insertCell(5);
							const newCell7 = newRow.insertCell(6);
							const newCell8 = newRow.insertCell(7);
							const newCell9 = newRow.insertCell(8);
							const newCell10 = newRow.insertCell(9);
							newCell1.innerText = index + 1;
							newCell2.innerText = item.studentVO.colNm;
							newCell3.innerText = item.studentVO.depNm;
							newCell4.innerText = item.stuCd;
							newCell5.innerText = item.studentVO.stuYear + "학년";
							newCell6.innerText = item.studentVO.stuNm;
							newCell7.innerText = item.sclYear;
							newCell8.innerText = item.sclSem;
							newCell9.innerText = item.sclNm;
							newCell10.innerText = item.sclSum.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							sum2 += parseInt(item.sclSum);
						});
						
						// 장학금 총액
						const schlSum2 = sum2.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						document.getElementById('schlSum').innerText = schlSum2;
		 			}
		 		});
		 	//학기 선택 시
			}else {
					
		 		$.ajax({
		 			url:"/employee/schlship/searchSem",
		 			data:{
		 				"sclYear" : sclYear,
						"sclSem" : sclSem
		 			},
		 			type:"post",
		 			beforeSend:function(xhr){
		 				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		 			},
		 			success:function(res){
						console.log("res : ", res);

						let row = table.rows.length;
						console.log("row : ", row);
						
						for(let i = 1; i < row;){
							
							if(row == 1){
								return false;
							}else{
								table.deleteRow(i);
							}
							row--;
						};
						
						let sum2 = 0;
						
						$.each(res, function(index, item) {
							const newRow = table.insertRow();
							const newCell1 = newRow.insertCell(0);
							const newCell2 = newRow.insertCell(1);
							const newCell3 = newRow.insertCell(2);
							const newCell4 = newRow.insertCell(3);
							const newCell5 = newRow.insertCell(4);
							const newCell6 = newRow.insertCell(5);
							const newCell7 = newRow.insertCell(6);
							const newCell8 = newRow.insertCell(7);
							const newCell9 = newRow.insertCell(8);
							const newCell10 = newRow.insertCell(9);
							newCell1.innerText = index + 1;
							newCell2.innerText = item.studentVO.colNm;
							newCell3.innerText = item.studentVO.depNm;
							newCell4.innerText = item.stuCd;
							newCell5.innerText = item.studentVO.stuYear + "학년";
							newCell6.innerText = item.studentVO.stuNm;
							newCell7.innerText = item.sclYear;
							newCell8.innerText = item.sclSem;
							newCell9.innerText = item.sclNm;
							newCell10.innerText = item.sclSum.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							sum2 += parseInt(item.sclSum);
						});
						
						// 장학금 총액
						const schlSum2 = sum2.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						document.getElementById('schlSum').innerText = schlSum2;
		 			}
		 		});
			}
		//전체 선택
		}else if(sclYear == 0 && sclSem == 0) {
			$.ajax({
	 			url:"/employee/schlship/searchAll",
	 			type:"get",
	 			beforeSend:function(xhr){
	 				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	 			},
	 			success:function(res){
					console.log("res : ", res);

					const table = document.getElementById('schlTbl');
					let row = table.rows.length;
					console.log("row : ", row);
					
					for(let i = 1; i < row;){
						
						if(row == 1){
							return false;
						}else{
							table.deleteRow(i);
						}
						row--;
					};
					
					let sum2 = 0;
					
					$.each(res, function(index, item) {
						const newRow = table.insertRow();
						const newCell1 = newRow.insertCell(0);
						const newCell2 = newRow.insertCell(1);
						const newCell3 = newRow.insertCell(2);
						const newCell4 = newRow.insertCell(3);
						const newCell5 = newRow.insertCell(4);
						const newCell6 = newRow.insertCell(5);
						const newCell7 = newRow.insertCell(6);
						const newCell8 = newRow.insertCell(7);
						const newCell9 = newRow.insertCell(8);
						const newCell10 = newRow.insertCell(9);
						newCell1.innerText = index + 1;
						newCell2.innerText = item.studentVO.colNm;
						newCell3.innerText = item.studentVO.depNm;
						newCell4.innerText = item.stuCd;
						newCell5.innerText = item.studentVO.stuYear + "학년";
						newCell6.innerText = item.studentVO.stuNm;
						newCell7.innerText = item.sclYear;
						newCell8.innerText = item.sclSem;
						newCell9.innerText = item.sclNm;
						newCell10.innerText = item.sclSum.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						sum2 += parseInt(item.sclSum);
					});
	 				  
					// 장학금 총액					
					const schlSum2 = sum2.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					document.getElementById('schlSum').innerText = schlSum2;
	 			}
	 		});
		}
	});
});
</script>