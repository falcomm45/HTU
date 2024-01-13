<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
  .jstree-search {
	/* js트리는 search를 이용해 찾은 요소에 italic이 적용돼있는데 구려서 적용해제시킴 */
/*   		font-style: normal !important; */
  		/* 일단 예시로 빨간색을 줘봤는데 알아서 바꾸세용 */
  		color: #333333;
   }
  .keyword{border:1px solid #888888; width:180px; font-size:13px; padding:5px;}
  .registModal input {
    font-size: 14px;
    width: 120px;
    margin-left: 5px;
    display: inline-block;
    color: #000 !important;
  }

  .registModal .input_width {
    width: 170px;
  }

  .registModal .input_border {
    border-right: 1px solid #ebebeb;
  }

  .registModal input:focus {
    outline: none;
  }

  .registModal td {
    display: flex;
    border: 1px solid #ebebeb;
    box-sizing: border-box;
    height: 30px;
  }

  .registModal .th_span {
    font-size: 13px;
    box-sizing: border-box;
    padding: 10px;
    color: #555;
    border-right: 1px solid #ebebeb;
    display: inline-block;
    width: 90px;
    height: 100%;
    text-wrap: nowrap;
  }
  
  .registModal .table_topic {
      font-size: 20px;
      padding-bottom: 30px;
  }

  .registModal .table_topic i {
      margin-left: 10px;
  }

  .close_bt:hover {
    background-color: #333;
  }

  select[readonly] {
    pointer-events: none;
  }

  select {
    width: 120px;
    margin-left: 5px;
    padding: 3px;
    border: none;
    font-size: 14px;
    -webkit-appearance: none;
    /* 크롬 화살표 없애기 */
    -moz-appearance: none;
    /* 파이어폭스 화살표 없애기 */
    appearance: none;
    /* 화살표 없애기 */
  }
  .registModal select{
    text-align-last: center;
    text-align: center;
  }
  /* input number 화살표 없애기 */
  input[type="number"]::-webkit-outer-spin-button, 
  input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
  }
  .registFilehover {
    transition: .3s;
    cursor: pointer;
  }

  .registFilehover:hover {
    position: relative;
    transition: .3s;
    cursor: pointer;
  }

  .registFilehover:hover::before {
    content: "";
    transition: .3s;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
  }

  .registFilehover:hover::after {
    content: "이미지 변경";
    transition: .3s;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 12px;
    text-wrap: nowrap;
    font-weight: 500;
    color: #ffffff;
    border: 1px solid #fff;
    border-radius: 5px;
    padding: 5px;
    position: absolute;
  }
  .longTable input, .longTable select{
    width: 155px;
    
  }
  .inputLong{
  	width: 350px!important;
  }
</style>

<sec:authentication property="principal.userVO" var="vo"/>
<div class="flex-shrink-0 p-3 bg-white sub_menu">
    <a href="/employee/proadmin/proinfo" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom" style="margin-top:65px; margin-left:5px;">
      <span class="fs-5">교수관리</span>
    </a>
	<button class="sub_button" id="registStudentBtn">
		<a class="sub_text" href="#none">교수등록</a>
	</button>
	<input type="text" placeholder="검색어를 입력하세요." name="keyword" id="keyword" class="keyword">
	<div id="tree"></div>
	<div class="submenu_menu">
<!-- 	<a href="#none" class="sub_menu_a">장학금조회</a> -->
<!-- 	<a href="#none" class="sub_menu_a">성적조회</a> -->
	</div>
</div>

<input type="file" id="excelUpload">
<input type="file" id="regStuFile">


<div class="registModal" style="display: none;">
  <div class="reg-modal-bg" style="position: fixed; z-index: 998; top: 0; left: 0; background: rgba(0, 0, 0, 0.4); width: 100%; height: 100%; overflow-y: hidden;"></div>
  <div class="registModal" style="position: absolute; padding: 30px; padding-top: 60px; z-index: 999; width: 800px; height: 600px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%);">
    <button type="button" class="btn-two gray mini close_bt" onclick="closeRegistModal()" style="padding:5px 10px; margin-bottom:20px; margin-right: 0; position:fixed; z-index: 999; right: 30px; top:20px; transition:.3s;">닫기 <i class="fa-solid fa-xmark" style="color: #ffffff;"></i></button>
    <div style="width: 600px; height: 100%; margin: 0 auto">
      <div style="height:100%; width:100%; overflow-y: scroll; margin: 0 auto;">
        <div class="table_topic">학생 정보 등록</div>
        <div style="font-size:15px; padding-bottom:10px; display:flex; align-items:center;">
          <svg xmlns="http://www.w3.org/2000/svg" height="18" width="18" viewBox="0 0 512 512"><path fill="#751c35" d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336h24V272H216c-13.3 0-24-10.7-24-24s10.7-24 24-24h48c13.3 0 24 10.7 24 24v88h8c13.3 0 24 10.7 24 24s-10.7 24-24 24H216c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
          <span style="margin-left:5px;">인적정보</span>
        </div>
        <div style="display:flex;">
          <div class="registFilehover">
            <img src="/resources/images/unknownperson.jpg" style="min-width:145px; max-width:145px; height:152px; object-fit: cover;" id="registFile" class="registFile"/>
          </div>
          <table>
            <tr>
              <td>
                <div class="th_span">이름</div>
                <input required id="regUserNm" name="regUserNm" type="text" />
              </td>
              <td>
                <div class="th_span">영문이름</div>
                <input required id="regUserNme" name="regUserNme" type="text" />
              </td>
            </tr>
            <tr>
              <td>
                <div class="th_span">주민등록번호</div>
                <div style="display: flex; align-items: center;">
                  <input type="text" id="regUserReg1">
                  <span>-</span>
                  <input type="password" id="regUserReg2">
                </div>
              </td>
              <td>
                <div class="th_span">전화번호</div>
                <input type="number" id="regUserTel">
              </td>
              <td>
                <div class="th_span">메일</div>
                <div id="mailBox" style="display: flex; align-items: center;">
                  <input type="text" id="regUserMail">
                  <span>@</span>
                  <select id="selectMail">
                    <option value="">--</option>
                    <option value="1">직접입력</option>
                    <option value="naver.com">naver.com</option>
                    <option value="daum.net">daum.net</option>
                  </select>
                </div>
              </td>
            </tr>
          </table>
        </div>
        <table class="longTable">
          <tr>
            <td>
              <div style="display: flex; align-items: center;">
                <div class="th_span">우편번호</div>
                <input type="text" id="zipCode">
                <button class="btn-two mini green" onclick="sample6_execDaumPostcode()">주소검색</button>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="th_span">주소</div>
              <input class="inputLong" type="text" id="address">
            </td>
            <td>
              <div class="th_span">상세주소</div>
              <input class="inputLong" type="text" id="address2">
              <input type="text" id="address3" style="display: none;">
            </td>
          </tr>
          <tr>
            <td>
              <div class="th_span">은행명</div>
              <input type="text" id="regUserBank">
              <div class="th_span">예금주</div>
              <input type="text" id="regUserDepo">
            </td>
          </tr>
          <tr>
            <td>
              <div class="th_span">계좌번호</div>
              <input class="inputLong" type="text" id="regUserAcc">
            </td>
          </tr>
        </table>
        <div style="font-size:15px; padding-bottom:10px; display:flex; align-items:center; margin-top: 40px;">
          <svg xmlns="http://www.w3.org/2000/svg" height="18" width="18" viewBox="0 0 512 512"><path fill="#751c35" d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336h24V272H216c-13.3 0-24-10.7-24-24s10.7-24 24-24h48c13.3 0 24 10.7 24 24v88h8c13.3 0 24 10.7 24 24s-10.7 24-24 24H216c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
          <span style="margin-left:5px;">학적정보</span>
        </div>
        <table class="longTable">
          <tr>
            <td>
              <div class="th_span">단과대학</div>
              <select id="regComdCd">
                <c:forEach items="${coleCommonList}" var="collegeVO">
                  <c:if test="${collegeVO.comdCd != 'COLE09' and collegeVO.comdCd != 'COLE99'}">
                    <option value="${collegeVO.comdCd}">${collegeVO.comdNm}</option>
                  </c:if>
                </c:forEach>
              </select>
              <div class="th_span">전공학과</div>
              <select id="regDepCd">
                <option value="">단과대를 선택하세요.</option>
              </select>
            </td>
          </tr>
          <tr>
            <td>
              <div class="th_span">학년</div>
              <select id="regStuYear">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
              </select>
              <div class="th_span">학기</div>
              <select id="regStuSem">
                <option value="1">1</option>
                <option value="2">2</option>
              </select>
            </td>
          </tr>
          <tr>
            <td>
              <div class="th_span">입학일자</div>
              <input type="date" id="regStuAddt">
            </td>
          </tr>
        </table>
        <button class="btn-two mini sky" id="registStudent" style="width: 110px; height: 30px; margin-left: 0px; margin-top: 50px; font-size: 13px;">정보 등록</button>
      </div>
      
    </div>
  </div>
</div>

<input type="text" id="jsonDepartmentList2" value='${jsonDepartmentList}' style="display: none;">
<script>
  
  const jsonDepartmentList = JSON.parse($("#jsonDepartmentList2").val());
  
  $("#registStudent").on("click", function() {
    
    const formData = new FormData();
    formData.append('file', $("#regStuFile")[0].files[0]);
    let userMail = "";
    if ($("#mailBox").children(':last').prop("nodeName") == "INPUT") {
      userMail = $("#regUserMail").val() + "@" + $("#regUserMail2").val();
    } else {
      userMail = $("#regUserMail").val() + "@" + $("#selectMail").val();
    }
    const userData = {
      userNm: $("#regUserNm").val(),
      userNme: $("#regUserNme").val(),
      userReg1: $("#regUserReg1").val(),
      userReg2: $("#regUserReg2").val(),
      userTel: $("#regUserTel").val(),
      userMail: userMail,
      userZip: $("#zipCode").val(),
      userAddr1: $("#address").val(),
      userAddr2: $("#address2").val(),
      userBank: $("#regUserBank").val(),
      userDepo: $("#regUserDepo").val(),
      userAcc: $("#regUserAcc").val(),
      studentVO: {
        depCd: $("#regDepCd").val(),
        stuYear: $("#regStuYear").val(),
        stuSem: $("#regStuSem").val(),
        stuAddt: $("#regStuAddt").val(),
      }
    }
    
    console.log(userData);
    
    formData.append("userVO", new Blob([JSON.stringify(userData)], {type: "application/json"}));
    
    $.ajax({
      url: "/employee/stuadmin/registStudent",
      type: "post",
      processData: false,
      contentType: false,
      data: formData,
      beforeSend: function (xhr) {
        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      },
      success: res => {
        if (res != "") {
          $(".registModal").hide();
          $("#"+res.substr(0,6)+"_anchor").dblclick();
          $("#"+res+"_anchor").click();
        }
      }
    })
    
  });
  
  $(".registFilehover").on("click", function() {
    $("#regStuFile").click();
  })
  
  $("#regStuFile").on("change", function(event) {
    let files = event.target.files;
    let fileArr = Array.prototype.slice.call(files);
    fileArr.forEach(function(f) {
      let reader = new FileReader();
      reader.onload = function(event) {
        const fileArr = $(".registFile");
        $(fileArr[fileArr.length-1]).attr("src", event.target.result);
      }
      reader.readAsDataURL(f);
    })
  })
  
  $("#regComdCd").on("change", function() {
    const colCd = $(this).val();
    let txt = "";
    jsonDepartmentList.forEach(dep => {
      if (dep.colCd == colCd) {
        txt += `<option value="\${dep.depCd}">\${dep.depNm}</option>`
      }
    });
    $("#regDepCd").html(txt);
  });
  
  function closeRegistModal() {
    $(".registModal").hide();
  }
  
  $(".reg-modal-bg").on("click", function() {
    closeRegistModal();
  })
  
  $("#selectMail").on("change", function() {
    const result = $(this).val()
    if (result == 1) {
      $(this).remove();
      $("#mailBox").append($("<input type='text' id='regUserMail2'>"));
    }
  })
  
  // 학생등록 여부 확인
  $("#registStudentBtn").on("click", function() {
    Swal.fire({
      title: "학생등록",
      icon: "question",
      /* warning,error,success,info,question */
      width: 600,
      /* padding: "4em", */
      position: "top",
      showCancelButton: true,
      showDenyButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#555555",
      denyButtonColor:"#A1EEBD",
      confirmButtonText: "개별등록",
      cancelButtonText: "뒤로가기",
      denyButtonText: "일괄등록",
      /* reverseButtons: true, */ // 버튼 순서 거꾸로
    }).then((result) => {
      console.log(result);
      if(result.isConfirmed){
        // 개별등록 모달 꾸미기
        $(".registModal").show();
      }
      else if(result.isDenied){
        $("#excelUpload").click();
      }
    });
  });
  
  $("#excelUpload").on("change", function() {
    const formData = new FormData();
    formData.append("file", $("#excelUpload")[0].files[0]);
    
    $.ajax({
      url: "/employee/stuadmin/excelUpload",
      type: "post",
      contentType: false,
      processData: false,
      data: formData,
      beforeSend: function (xhr) {
        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      },
      success: res => {
        if (res == "") {
          alertError("확장자가 .xlsx인 엑셀 파일을 첨부해주세요.")
        } else {
          const cnt = res.stuCoc / 2;
          $("#"+res.depCd.substr(0,6)+"_anchor").dblclick();
          $("#"+res.depCd+"_anchor").click();
          alertSuccess(cnt + "명의 학생이 등록되었습니다.")
        }
      },
      error: xhr => {
        console.log(xhr);
        
      }
    })
  })
  
  
</script>
