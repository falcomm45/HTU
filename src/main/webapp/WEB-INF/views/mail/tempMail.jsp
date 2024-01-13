<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<style>
.divMailbox .mailHeaderName {
	font-size: 20px;
	padding: 30px;
	font-weight: 600;
}
input:focus {outline:none;}
input[type=file]::file-selector-button {
  width: 120px;
  height: 30px;
  color: #333333;
  background-color: transparent;
  border: 1px solid #dadada;
  border-radius: 10px;
  cursor: pointer;
}
input[type=file]::file-selector-button:hover {
    background-color: #dadada;
    color: #fff;
}
.mail_toolbar {
	margin-left: 25px;
	padding: 10px;
	webkit-box-flex: 0;
	-webkit-flex: 0 0 auto;
	flex: 0 0 auto;
	position: relative;
	top: auto;
	right: auto;
	left: auto;
	margin: 0 25px;
	-webkit-box-flex: 0;
	flex: 0 0 auto;
	position: relative;
	top: auto;
	right: auto;
	left: auto;
	-webkit-box-align: center;
	align-items: center;
	border-top: 1px solid #dadada;
	border-bottom: 1px solid #dadada;
	justify-content: space-between;
}

.mail_toolbar.type_write {
	font-size: 14px;
	display: flex;
	flex-wrap: wrap;
	height: 50px;
	margin-left: 0px;
	margin-right: 0px;
}

.button_group {
	display: flex;
	width: 350px;
}

.mail_toolbar_task .button_write_task {
	margin: 0 5px 0 9px;
	padding: 3px 10px;
	border: 1px solid #7e1717;
	border-radius: 5px;
	font-weight: bold;
	color: #7e1717;
	line-height: 20px;
	letter-spacing: 0;
}
button {
/* 	margin: 0; */
	margin: 0 5px 0 9px;
	padding: 3px 10px;
	outline: none;
	line-height: 20px;
	background-color: transparent;
 	cursor: pointer;
	touch-action: manipulation;
	border: 0;
}
.mail_toolbar_task .button_task:hover {
	border: 1px solid #dadada;
	border-radius: 5px;
}
.mail_toolbar_task .button_task_wrap {
	margin-right: 0;
	margin: 0 29px 0 0;
	font-weight: normal;
}
.mail_write_option {
    padding-top: 10px;
	font-size: 14px;
	font-weight: 600;
}
.mail_write_option_item_inner .title_area {
    align-items: center;
	width: 160px;
	padding: 5px 0 6px 11px;
}
.mail_write_option_item_inner .option_area {
    border-bottom: 1px solid #dadada;
    width: 100%;
}
.mail_write_option_item_inner {
	display: flex;
}
.editor_area {
    margin-top: 20px;
}
.mail_write_option_item_inner .user_input {
    padding: 2px 0;
	width: 100%;
	background-color: transparent;
}
.mail_write_option_item_inner .option_input {
	padding: 6px 0;
	width: 100%;
	background-color: transparent;
}
.mail_write_option_item.file .option_area {
    border-bottom: 0;
}
.mail_write_option_item_inner .blind {
	padding: 6px 0;
	width: 100%;
	background-color: transparent;
}
.cke_contents cke_reset {
	height: 500px;
}
.autocomplete > div {
  z-index: 999;
  background: #ffffff;
  padding: .2rem .6rem;
  height: 30px;
}
.autocomplete > div.active {
  background: #e0e5f6;
  color: #000;
}
.autocomplete{
  position: absolute;
  max-height: 90px;
  overflow: auto;
}
mark {
  background: #febf0090;
}
</style>
<div class="divMailbox" style="background-color: #ffffff;">
	<div class="mailHeader">
		<div class="mailHeaderName">
			임시 메일
		</div>
	</div>
	<!-- ----------------------------------------------------------------------------- -->
	<form name="frm" id="frm" action="/mail/sendTempMail?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<input name="umlCd" value="${univMailVO.umlCd}" hidden />
		<div class="mail_toolbar type_write">
			<div class="mail_toolbar_task">
				<div class="button_group">
					<button type="submit" id="btnSend" name="umlTemp" value="0" class="button_write_task">보내기</button>
					<div class="button_task_wrap">
						<button type="button" id="btnTemp" name="umlTemp" value="1" class="button_task">
							<span class="text">임시저장</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	<!-- ----------------------------------------------------------------------------- -->
		<div class="mail_write_option">
			<div class="mail_write_option_item recipient">
				<div class="mail_write_option_item_inner">
					<div class="title_area">
						<strong class="option_title"><label
							for="recipient_input_element">받는사람</label></strong>
					</div>
					<div class="option_area">
						<div class="user_list" id="recipient_input_element_list">
							<input type="text" id="search" class="user_input"
							 autocomplete="off" value="${univMailVO.receiverNm}">
							 <input type="hidden" name="umlReceiver" id="umlReceiver" value="">
						</div>
						<div class="autocomplete"></div>
					</div>
				</div>
			</div>
			<div class="mail_write_option_item subject">
				<div class="mail_write_option_item_inner">
					<div class="title_area">
						<strong class="option_title"><label for="subject_title">제목</label></strong>
					</div>
					<div class="option_area">
						<div class="option_input_cover">
							<input name="umlTitle" id="subject_title" type="text" value="${univMailVO.umlTitle}" class="option_input"
								tabindex="4" maxlength="180" required="required">
						</div>
					</div>
				</div>
			</div>
			<div class="mail_write_option_item file expanded">
				<div class="mail_write_option_item_inner">
					<div class="title_area">
						<strong class="option_title">파일첨부</strong>
					</div>
					<div class="option_area">
						<div class="file_upload">
							<label class="button_upload"><span class="blind">
									</span><input id="ATTACH_LOCAL_FILE_ELEMENT_ID" type="file"
								class="blind" name="uploadFiles" multiple="multiple"></label>
							<p class="description">
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="editor_area">
			<textarea rows="100" cols="30" id="umlCon" name="umlCon">${univMailVO.umlCon}</textarea>
		</div>
		<sec:csrfInput />
	</form>
</div>
<script type="text/javascript">
$(function(){
	
	CKEDITOR.replace('umlCon', {
		filebrowserUploadUrl:'/mail/fileuploadCK?${_csrf.parameterName}=${_csrf.token}',
		height: 600
	});
	CKEDITOR.config.allowedContent = true;
	
	//submit 시 잠시 거쳐가는 곳
	function copyContent(){
	   //textarea에 div 내용값을 넣어줌
	   $("#umlCon").html(window.editor.getData());
	   return true;
	}
   
// 	$("#umlReceiver").find("option").each(function(){
// 		if(this.value == "${univMailVO.umlSender}"){
// 			$(this).remove();
// 		}
// 	});
	
	// 검색어 리스트
    const jsonUserList = JSON.parse('${jsonUserList}');
    const userList = [];

    for (let i = 0; i < jsonUserList.length; i++) {
    	const user = {
		    userCd: jsonUserList[i].userCd,
		    userNm: jsonUserList[i].userNm
		  };
		  userList.push(user);
    }

    console.log(userList);

    const $search = document.querySelector("#search");
    const $autoComplete = document.querySelector(".autocomplete");
    const $umlReceiver = document.querySelector("#umlReceiver");

    $search.addEventListener("input", function() {
        const value = $search.value.trim();
        const user = jsonUserList.find(u => u.userNm === value);

        if (user) {
            $umlReceiver.value = user.userCd;
        }
    });

    let nowIndex = 0;

    $search.onkeyup = (event) => {
    	// 검색어
      	const value = $search.value.trim();

      	// 자동완성 필터링
      	const matchDataList = value
       	? userList.filter(user => user.userNm.includes(value) || user.userCd.includes(value))
	    : [];

      	switch (event.keyCode) {
        	// UP KEY
        	case 38:
	        nowIndex = Math.max(nowIndex - 1, 0);
	        break;

	       	// DOWN KEY
	       	case 40:
	        nowIndex = Math.min(nowIndex + 1, matchDataList.length - 1);
	        break;
	
	       	// ENTER KEY
	       	case 13:
	        document.querySelector("#search").value = matchDataList[nowIndex]?.userNm || "";
	
			// 초기화
			nowIndex = 0;
			matchDataList.length = 0;
			break;
	
			// 그외 다시 초기화
			default:
			nowIndex = 0;
			break;
		}
      	
      	const $autocomplete = document.querySelector(".autocomplete");

      	$autocomplete.addEventListener("click", (event) => {
      	  const selectedValue = event.target.textContent;

      	  document.querySelector("#search").value = selectedValue;
      	  $autocomplete.innerHTML = '';
      	});
		// 리스트 보여주기
		showList(matchDataList, value, nowIndex);
	};

    const showList = (data, value, nowIndex) => {
		console.log(value);
		const regex = new RegExp((value), "g");
		console.log(regex);
		console.log('Data:', data);
		console.log('nowIndex:', nowIndex);
		
		console.log(data[nowIndex]);
		
		$autoComplete.innerHTML = '';
		data.forEach((user, index) => {
// 		data.slice(0, 3).forEach((label, index) => {
	  	    console.log('Label:', user.userNm, 'Index:', index);
	   	 	console.log('Index:', index, 'NowIndex:', nowIndex);
	
	   	    const div = document.createElement('div');
			const labelText = user.userNm + ' ' + user.userCd;
    		console.log(labelText);
			  
			  div.textContent = labelText;


			div.classList.add('autocomplete-item');
			if (nowIndex === index) {
				div.classList.add('active');
			}
			$autoComplete.appendChild(div);
		});
	};
	
	$("#btnTemp").on("click", function(){
		$("#frm").attr("action", "/mail/tempMailUpdate?${_csrf.parameterName}=${_csrf.token}");
		$(this).attr("type", "submit");
	});
	
	$(".fileDeleteBtn").on("click", function(){
		let node = $(this).parent();
		let fileCd = $(this).data("fileCd");
		let fileSn = $(this).data("fileSn");
		
		let data = {
			"fileCd":fileCd,
			"fileSn":fileSn
		};
		
		console.log("data", data);

		$.ajax({
			url:"/mail/deleteFileUpdate",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(res){
				console.log("res : ", res);
				if(res > 0){
					node.remove();
				}
			}
		});
	});
	
	$("#btnList").on("click", function(){
		if(confirm("이 페이지를 벗어나면 수정된 내용은 저장되지 않습니다.")){
			location.href = "/mail/tempMailBox";
		}
	});
});
// window.onbeforeunload = function() {
// 	  return false;
// 	};	
</script>