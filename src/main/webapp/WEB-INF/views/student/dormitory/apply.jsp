<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- <script src="/resources/js/jquery.min.js"></script> -->

<style>
.dormitory_wrap {
height:100%; height:100%; overflow-y:scroll;}

.dormitory_wrap .contents {
  padding: 50px;
  background-color: #ffffff;
  border: 1px solid #dadada;
  border-radius: 5px;
  box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
}

#form__wrap {
  font-size: 14px;
  width:90%; margin:0 auto; 
}

#form__wrap .terms__check__all {
  display: flex;
  margin-bottom: 35px;
}

#form__wrap .terms__check__all label {
  margin-left: 3px;
  text-decoration: underline;
}

.terms__list .terms__box {
  margin: 20px 0;
}

.contents label {
  font-weight: 700;
}

label.required::after {
  margin-left: 4px;
  font-size: 13px;
  font-weight: 400;
  line-height: 24px;
  color: #0086ff;
  content: "(필수)";
}

.terms__list .terms__content {
  height: 88px;
  overflow: auto;
  margin-top: 8px;
  padding: 12px;
  border: 1px solid #dadada;
  background: #fff;
  font-size: 12px;
}

.next-button {
  width: 100%;
  height: 40px;
  outline: none;
  cursor: pointer;
  background-color: #242222;
  color: #ffffff;
  border: none;
  border-radius: 5px;
  transition-duration: 0.2s;
  margin-top: 20px;
}

.next-button:hover:enabled {
  background-color: #a3a2a2;
}

.next-button:disabled {
  opacity: 0.2;
  cursor: not-allowed;
}

#studentInfo label {
    display: block;
    margin-top: 10px;
  }

  #studentInfo input {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    margin-bottom: 15px;
    margin-top: 10px;
  }
  /* 스타일 추가: 선택 드롭다운 스타일링 */
  #studentInfo select {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    margin-bottom: 15px;
    margin-top: 10px;
  }
  .input__check{display:flex; align-items:center;}
  .input__check label{margin-left:2px;}
 </style>

    <div class="dormitory_wrap">
      <div class="contents">
      <!-- 신청 양식 폼 -->
        <form action="/" method="POST" id="form__wrap">
    <!-- 로고 부분 -->
    <div style="font-size:12px; color:#888888; margin-bottom: 20px; position: relative; left: -68px; top: -3px;">
	<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/dormitory/list">기숙사</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/dormitory/apply">기숙사신청</a></span>
	</div>
	      <div style="display:flex; justify-content:center; margin-right:40px;">
	      <img src="/resources/images/logo.png" alt="logo" style="width:180px;">
	      </div>
          <ul class="terms__list">
            <li class="terms__box">
              <div class="input__check">
                <input
                  type="checkbox"
                  name="agreement"
                  id="termsOfService"
                  value="termsOfService"
                  required
                />
                <label for="termsOfService" class="required"
                  >형택관 이용약관 동의</label
                >
              </div>
              <div class="terms__content">
                여러분을 환영합니다. 형택관 서비스 및 제품(이하 ‘서비스’)을 이용해
                주셔서 감사합니다. 본 약관은 다양한 형택관 서비스의 이용과 관련하여
                형택관 서비스를 제공하는 형택관과 이용하는
                형택관 서비스 학생(이하 ‘학생’) 
                아울러 여러분의 형택관 서비스 이용에 도움이 될 수 있는 유익한
                정보를 포함하고 있습니다. 형택관 서비스를 이용하시거나 형택관 서비스
                회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을
                확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐
                주시기 바랍니다.
              </div>
            </li>
            <li class="terms__box">
              <div class="input__check">
                <input
                  type="checkbox"
                  name="agreement"
                  id="privacyPolicy"
                  value="privacyPolicy"
                  required
                />
                <label for="privacyPolicy" class="required"
                  >개인정보 수집 및 이용 동의</label
                >
              </div>
              <div class="terms__content">
                개인정보보호법에 따라 형택관에 회원가입 신청하시는 분께 수집하는
                개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및
                이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내
                드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.1. 수집하는
                개인정보 이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등
                대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다.
                이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제
                서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스
                이용을 위해 필요한 최소한의 개인정보를 수집합니다.
              </div>
            </li>
            
          </ul>
         <!-- 이용약관 전체 동의 부분 -->
          <div class="terms__check__all">
            <input type="checkbox" name="checkAll" id="checkAll"" />
            <label for="checkAll"
              >형택관 이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</label
            >
          </div>
          <!-- 학생 정보 입력 칸 -->
          <div id="studentInfo" style="display: none;">
<!--             <h4>학생 정보 입력</h4> -->
<!--             <label for="studentName">이름(필수)</label> -->
<!--             <input type="text" id="studentName" name="studentName" required /> -->
<!--             <label for="studentId">학번(필수)</label> -->
			<!-- 여기 주석처리하면 아이디값이 안들어가요.....돈땃지 -->
             <input type="hidden" id="studentId" name="studentId" value="${stuCd}" readonly /> 
            
            <label for="applicationYear">신청년도(필수)</label>
			  <select id="applicationYear" name="applicationYear" required>
			    <option value="2024">2024년</option>
<!-- 			    <option value="2025">2025년</option> -->
			  </select>
			
			  <!-- 추가: 신청학기 선택 -->
			  <label for="applicationSemester">신청학기(필수)</label>
			  <select id="applicationSemester" name="applicationSemester" required>
			    <option value="1">1학기</option>
			    <option value="2">2학기</option>
			  </select>
			  
			  <label for="applicationBuilding">기숙사동(필수)</label>
			  <select id="applicationBuilding" name="applicationBuilding" required>
			    <option value="BULD10">A동</option>
			    <option value="BULD11">B동</option>
			  </select>
          </div>

          <button type="button" class="next-button" id="submitForm" >신청</button>
        </form>
      </div>
    </div>
<script type="text/javascript" src="/resources/js/main.js"></script>

<script>
	//필요한 변수들 초기화
  	const form = document.querySelector('#form__wrap'); // 데이터를 전송하는 Form 
	const checkAll = document.querySelector('.terms__check__all input'); // 모두 동의 체크박스
	const checkBoxes = document.querySelectorAll('.input__check input'); // 모두 동의를 제외한 2개의 체크박스
  	const studentInfo = document.querySelector("#studentInfo"); // 학생 정보 
  	const submitButton = document.querySelector("button"); // 확인버튼

  const agreements = {
    termsOfService: false,
    privacyPolicy: false,
  };
	
  //폼 제출 방지
  form.addEventListener("submit", (e) => e.preventDefault());
  //각 체크박스에 이벤트 리스너 추가
  checkBoxes.forEach((item) => item.addEventListener("input", toggleCheckbox));

//체크박스 토글 함수
  function toggleCheckbox(e) {
    const { checked, id } = e.target;
    agreements[id] = checked;
    this.parentNode.classList.toggle("active");
    checkAllStatus();
    //toggleSubmitButton();
  }
      //전체 동의 상태 확인 함수
  function checkAllStatus() {
    const { termsOfService, privacyPolicy } = agreements;
 // 하나라도 체크되면 전체 동의 체크
    if ((termsOfService && privacyPolicy)) {
      checkAll.checked = true;
      showStudentInfo();
    } else {
      checkAll.checked = false;
      hideStudentInfo();
    }
  }
//확인 버튼 활성/비활성화 함수
//   function toggleSubmitButton() {
//     const { termsOfService, privacyPolicy } = agreements;
//     if (termsOfService && privacyPolicy) {
//       submitButton.disabled = false;
//     } else {
//       submitButton.disabled = true;
//     }
//   }
  // 학생 정보 입력 칸 보이기 함수
  function showStudentInfo() {	
    studentInfo.style.display = "block";
  }
  // 학생 정보 입력 칸 숨기기 함수
  function hideStudentInfo() {
    studentInfo.style.display = "none";
  }
//전체 동의 체크박스 이벤트 리스너
  checkAll.addEventListener("click", (e) => {
    const { checked } = e.target;
 // 전체 동의 시 각 체크박스 활성화
    if (checked) {
      checkBoxes.forEach((item) => {
        item.checked = true;
        agreements[item.id] = true;
        item.parentNode.classList.add("active");
      });
      showStudentInfo();
    } else {
    	// 전체 동의 해제 시 각 체크박스 비활성화
      checkBoxes.forEach((item) => {
        item.checked = false;
        agreements[item.id] = false;
        item.parentNode.classList.remove("active");
      });
      hideStudentInfo();
    }
    //toggleSubmitButton();
  });
  
//확인 버튼 클릭 시 폼 제출 처리
  $("#submitForm").on("click", function () {
// 	  $("#form__wrap").submit(); // 함수명을 변경한 부분
	  submitForm();
  });

  function submitForm() { 

  	var data = {
	    //studentName: $("#studentName").val(),
	    stuCd: $("#studentId").val(),
	    domYear: $("#applicationYear").val(),
	    domSem: $("#applicationSemester").val(),
	    bldCd: $("#applicationBuilding").val(),
	  };
	  
  		console.log("data : ", data);
  
  	// 서버에 중복 확인 요청
  	    $.ajax({
  	        url: '/student/dormitory/checkDuplicate',
  	        contentType: "application/json;charset=utf-8",
  	        data: JSON.stringify(data),
  	        type: 'POST',
  	        dataType: "json",
  	        beforeSend: function (xhr) {
  	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
  	        },
  	        success: function (result) {
  	        	console.log("result@@@@", result);
  	        	
  	            // 중복이면 알림 표시
  	            if (result.duplicated) {
  	                alertError("중복된 신청정보입니다. <br/> 기숙사신청목록을 확인해 주세요.");
  	            }else{
  	            	successFnc(data);
  	            }
  	        },
  	        error: function () {
  	            alertError('중복 확인 실패');
  	        }
  	    });
  	}
  		
  		
    // 폼 데이터를 서버에 전송
    function successFnc(data){
    	
    $.ajax({
      url: '/student/dormitory/applyPost',
      contentType:"application/json;charset=utf-8",
      data:JSON.stringify(data),
      type: 'POST',
      dataType:"json",
      beforeSend:function(xhr){
 	     xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
 	  },
      success: function (result) {
        // 폼 제출이 성공하면 리다이렉트 또는 성공 처리를 수행하세요.
        
        alertSuccess('신청이 접수 되었습니다', '/student/dormitory/list');
      },
      error: function () {
        // 폼 제출이 실패한 경우 에러를 처리하세요.
        alertError('신청서 제출 실패');
      }
    });
    }
</script>