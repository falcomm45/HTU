<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
	.sub_menu a:hover{color:#333333;}
	
	.confetti-container {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 998; 
  }
	
  .confetti-text {
  position:absolute; z-index:999; top:50%; left:60%; transform:translate(-50%,-50%);
    font-size: 18px; background-color:#333; border-radius:5px; padding:10px 15px; line-height:25px;
    color: #ffffff; /* Set the text color */
  }
.confetti-text:before{content:""; background-color:#ffffff;}

</style>

<sec:authentication property="principal.userVO" var="vo"/>
<div class="flex-shrink-0 p-3 bg-white sub_menu" >
  <a href="/common/board/notice/list" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom" style="margin-top:65px; margin-left:5px;">
      <span class="fs-5">커뮤니티</span>
   </a>
    <button class="sub_button">
      <a class="sub_text" href="/common/board/free/create" style="display:block; height:45px; line-height:45px; ">글쓰기</a>
    </button>
    <div class="submenu_menu">
      <a href="/common/board/notice/list" class="sub_menu_a">공지사항</a>
      <a href="/common/board/free/list" class="sub_menu_a">자유게시판</a>
      <a href="/common/board/anonymous/list" class="sub_menu_a">익명게시판</a>
      <a href="/common/board/publicize/list" class="sub_menu_a">홍보게시판</a>
      
       <c:choose>
	        <c:when test="${vo.commonDetailVO.comdDesc eq 'ROLE_EMPLOYEE'}"> <div class="btn_confetti" style="position:absolute; right:10px; bottom:10px; cursor:pointer; font-size:12px; border:1px solid #333333; width:80px; text-align:center; height:20px; line-height:20px; border-radius:3px; ">The End</div></c:when>
	    </c:choose>
  </div>
  </div>
   <script>
  //폭죽!!!!!
    $('.btn_confetti').on('click', function () {
      // 시작점으로 설정할 요소 가져오기
      const canvas = $('.btn_confetti')[0];

      // Canvas 요소의 위치 정보를 가져오기
      const canvasRect = canvas.getBoundingClientRect();
      
   // Create a container for the confetti
      const confettiContainer = document.createElement('div');
      confettiContainer.classList.add('confetti-container');
      document.body.appendChild(confettiContainer);

      // Create a text element
      const confettiText = document.createElement('div');
      confettiText.classList.add('confetti-text');
      confettiText.innerText = '8개월간 고생 많으셨습니다! \n모두 취뽀하시고 행복하시고,, 적게일하고,, 많이버시고,, \n다들 보고싶을거에요 🥹';

      // Append the text element to the confetti container
      confettiContainer.appendChild(confettiText);

      // Canvas Confetti 라이브러리를 사용하여 효과 적용
      confetti({
        particleCount: 500,
        spread: 360,
        origin: {
//           x: (canvasRect.left + canvasRect.width / 2) / window.innerWidth,
//           y: (canvasRect.top + canvasRect.height / 2) / window.innerHeight
			x:0.6,
			y:0.5
        }
      });
    });
    </script>