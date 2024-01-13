
function openReportModal(bdCd, userCd) {
    // 모달 열기
    console.log("bdCd : ", bdCd);
    console.log("userCd : ", userCd);
    
    $("#modalBdCd").val(bdCd);
    $("#modalUserCd").val(userCd);

    $('#reportModal').modal('show');
}

function closeReportModal() {
    // 모달 닫기
    $('#reportModal').modal('hide');
}

//document.write('<script src="/resources/js/main.js"></script>');
function submitReport(bdCd, userCd) {
    // 여기에서 사용자가 입력한 신고 내용을 가져와서 처리하는 클라이언트 측 로직 추가
    let selectedReason = $("#prRsn").val();

    // 신고 사유를 선택하지 않은 경우
    if (!selectedReason || selectedReason.trim() === "") {
        alertError("신고 사유를 선택하세요.");
        return;
    }
    
	let data = {
			"bdCd":$("#bdCd").val(),
			"userCd":$("#userCd").val(),
			"prRsn":$("#prRsn").val(),
			"prDetail":$("#prDetail").val()
		};
		
		console.log('data=>>>>>', data);
		
		 const token = $("meta[name='_csrf']").attr("content");
    	 const header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
	      url: "/postReport",
	      contentType:"application/json;charset=utf-8",
	      data:JSON.stringify(data),
	      type: "post",
	      dataType:"json",
	      beforeSend:function(xhr){
	         xhr.setRequestHeader(header,token);
	      },
	      success: function (res) {
	        // 성공적으로 제출되었을 때의 로직을 처리합니다. 예: 리다이렉트 또는 메시지 표시
	        console.log("res : " + res);
	      	//if문..(기본키 데이터가 있다면(selectKey에 의해 생성된))
	      	if(res.result > 0){
	      		alertSuccess("신고가 접수되었습니다.");
	      	}
	      	else {
	      		alertErroe("신고접수에 실패하였습니다. 관리자에게 문의하여주십시오.");
	      	}
	      },
	       error:function(request,status,error){      
	         alertErroe("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);      
	        }
	});
	console.log("bdCd : ", bdCd);
	
    // 모달 창 닫기
    closeReportModal();
}
