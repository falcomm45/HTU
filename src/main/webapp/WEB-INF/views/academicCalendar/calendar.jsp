<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
.calendar_box{width:100%; height:100%; padding:40px; background-color:#ffffff;}
.calendar_box .table_topic{font-size: 20px;}
.calendar{height: 800px;}
.fc table {
    font-size: 13px;
    font-weight: 500;
}
.fc .fc-toolbar-title {
	font-size: 24px;
	font-weight: 500;
    margin-left: 155px;
}
.fc .fc-button-primary {
	background-color: #a1b1cb;
	border-color: #a1b1cb;
}
.fc .fc-button:hover {
	background-color: #516688;
	border-color: #516688;
}
.fc .fc-button-primary:disabled {
	background-color: #a1b1cb;
	border-color: #a1b1cb;
}
.fc-daygrid-block-event .fc-event-time, .fc-daygrid-block-event .fc-event-title {
    padding: 1px 8px;
}
.fc-h-event .fc-event-title {
    display: block;
    height: 17px;
    line-height: 16px;
    padding: 0 8px;
    left: 0px;
    max-width: 100%;
    overflow: hidden;
    right: 0px;
    vertical-align: top;
}
.fc-h-event .fc-event-title-container {
    flex-grow: 1;
    flex-shrink: 1;
    min-width: 0px;
    font-size: 12px;
    font-weight: bold;
    color: #333333;
}
.fc .fc-button .fc-icon {
    color: #ffffff;
}
</style>

<sec:authentication property="principal.userVO" var="userVO" />
<div class="calendar_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		
		<c:if test="${userVO.comdCd == 'USER01'}">
<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER02'}">		
<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER03'}">		
<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>
		
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/academicCalendar/calendar">일정관리</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/academicCalendar/calendar">학사일정</a></span>
	</div>
	<div class="table_topic">학사 일정</div>
    <div class="calendar"></div>
</div>
<script>
$(function() {
	
	console.log("${academicCalendarList}");
	
	let colorList = ['#F2E8E8', '#FFE9E9', '#F9E9D9', '#FFF8CC', '#F0F9CC', "#DAEFE6", "#DCEEF0"];
	
    let calendarEl = document.querySelector('.calendar');
    calendar = new FullCalendar.Calendar(calendarEl, {
    	locale : "ko",
        // 시작 Toolbar
        initialView : "dayGridMonth",
        // Toolbar
        headerToolbar : {
        left : "",
        center : "title",
        right : "prev,today,next",
        },
        contentHeight: 750,
        eventDisplay: "block",
        <c:if test="${comdCd == 'USER03'}">
        // 선택가능여부
        selectable: true,
        // 수정가능여부
        editable: true,
        droppable: true,
        dayMaxEvents: true,
        </c:if>
        // 일정 목록
        events: [
	        	<c:set var="cnt"><%= (int)Math.round(Math.random() * 4) %></c:set>
        		<c:forEach items="${academicCalendarList}" var="calendar">
        		{	
        			color: colorList['${cnt}'],
        			id: '${calendar.acCd}',
        			title: '${calendar.acTitle}',
        			start: '<fmt:formatDate value="${calendar.acStdt}" pattern="yyyy-MM-dd" />',
        			end: '<fmt:formatDate value="${calendar.acEddt}" pattern="yyyy-MM-dd" />'
        		},
                <c:set var="cnt" value="${cnt + 1}"/>
        		</c:forEach>
        ],
        eventDataTransform: function(event) {                                                                                                                                
        	  if(event.allDay) {                                                                                                                                               
        	    event.end = moment(event.end).add(1, 'days')                                                                                                                 
        	  }
        	  return event;  
   	},  
        allDaySlot: false,
        <c:if test="${comdCd == 'USER03'}">
        select: function (arg) { // 드래그로 이벤트 생성
        	
        	let numList = ['0', '1', '2', '3', '4', '5'];
        	let randomColor = numList[Math.floor(Math.random() * numList.length)];
        	
					Swal.fire({
						text: "일정을 입력해주세요.",
						input: "text",
						inputAttributes: {
							autocapitalize: "off"
						},
						showCancelButton: true,
						confirmButtonText: "입력",
						cancelButtonText: "취소",
						confirmButtonColor: "#3085d6",
						cancelButtonColor: "#555555",
						}).then((result) => {
							if(result.isConfirmed){
								const title = result.value;
								if (title.length < 1) {
									alertError("일정을 입력해주세요.");
									return;
								}
								
								if (title) {
                calendar.addEvent({
                	color: colorList[randomColor],
                    title: title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay,
                });
                
                let data = {
    	    			"acTitle" : title,
    	    			"acStdt" : arg.start,
    	    			"acEddt" : arg.end
   	    		}
                
                console.log("data : ", data);
                
                $.ajax({
                    url: "/academicCalendar/insertCalendar",
                    contentType:"application/json;charset=utf-8",
                    data: JSON.stringify(data),
                    type: "post",
                    dataType: "json",
                    beforeSend:function(xhr){
    					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    				},
    				success:function(res){
    				}
                });
                alertSuccess('일정이 등록되었습니다.');
                calendar.unselect();
            }
            calendar.unselect();
								
							}
						});
        },
        eventClick: function (info){
        	console.log("info : ", info);
        	
        	let data = {
	    			"acCd" : info.event._def.publicId,
	    			"acTitle" : info.event._def.title,
	    			"acStdt" : info.event._instance.range.start,
	    			"acEddt" : info.event._instance.range.end
    		}
        	
        	console.log("data : ", data);
        	
        	Swal.fire({
     	        text: "["+ info.event.title +"] 일정을 삭제하시겠습니까?",
     	        icon: "question",
     	        width: 300,
     	        showCancelButton: true,
     	        confirmButtonColor: "#3085d6",
     	        cancelButtonColor: "#d33",
     	        confirmButtonText: "확인",
     	        cancelButtonText: "취소"
     	    }).then((str) => {
     	        console.log(str);
     	        if (str.isConfirmed) {
     	        	info.event.remove();
     	        	
     	        	$.ajax({
                        url: "/academicCalendar/deleteCalendar",
                        contentType:"application/json;charset=utf-8",
                        data: JSON.stringify(data),
                        type: "post",
                        dataType: "json",
                        beforeSend:function(xhr){
        					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        				},
        				success:function(res){
        				}
                    });
                    alertSuccess('일정이 삭제되었습니다.');
     	        } 
     	    });
            
        },
        eventDrop: function (info){
            console.log(info);
            
            let data = {
	    			"acCd" : info.event._def.publicId,
	    			"acTitle" : info.event._def.title,
	    			"acStdt" : info.event._instance.range.start,
	    			"acEddt" : info.event._instance.range.end
    		}
        	
        	console.log("data : ", data);
            
            Swal.fire({
     	        text: "["+ info.event.title +"] 일정을 수정하시겠습니까?",
     	        icon: "question",
     	        width: 300,
     	        showCancelButton: true,
     	        confirmButtonColor: "#3085d6",
     	        cancelButtonColor: "#d33",
     	        confirmButtonText: "확인",
     	        cancelButtonText: "취소"
     	    }).then((str) => {
     	        console.log(str);
     	        if (str.isConfirmed) {
     	        	$.ajax({
                        url: "/academicCalendar/updateCalendar",
                        contentType:"application/json;charset=utf-8",
                        data: JSON.stringify(data),
                        type: "post",
                        dataType: "json",
                        beforeSend:function(xhr){
        					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        				},
        				success:function(res){
        				}
                    });
	            	alertSuccess('일정이 수정되었습니다.');
     	        } else {
	                location.reload();
     	        }
     	    });
        },
        </c:if>
   	})
   	calendar.render();
});
</script>
