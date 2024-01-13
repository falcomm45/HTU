<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
.wrap .contents{
	padding: 20px;
	border: 1px solid #dadada;
    border-radius: 5px;
	background-color: #ffffff;	
	box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
}
}
.text {
	font-family: 'Nanum Gothic', '맑은 고딕', '돋움', Dotum, sans-serif;
	line-height: 1.7;
	font-size: 40px;
	color: #fff;
	margin-top: -167px;
	padding: 0;
	border: 0;
}
.abo_slogan{
    color: #555;
    font-family: 'Nanum Gothic', '맑은 고딕', '돋움', Dotum, sans-serif;
    line-height: 2.7;
    margin-bottom: 20px; margin-top:50px;
    padding: 0 0 0 40px;
    font-size: 20px;
    font-weight: 700;
    letter-spacing: -1px;
}
.abo_slogan2{
    color: #333;
    font-family: 'Nanum Gothic', '맑은 고딕', '돋움', Dotum, sans-serif;
    line-height: 2.7;
    margin-bottom: 20px;
    padding: 0 0 0 40px;
    font-size: 15px;
    font-weight: 500;
    letter-spacing: -1px;
    background-image: url(/resources/images/logo_circle.png); background-size: contain;
    background-repeat: no-repeat; background-position:center;
    isolation: isolate; position: relative;
}
.abo_slogan2::after {
  content: '';
  position: absolute;
  background: white;
  z-index: -1;
  inset: 0;
  opacity: 0.8;
}
.body{
    font-size: 18px;
    color: #555;
    font-family: 'Nanum Gothic', '맑은 고딕', '돋움', Dotum, sans-serif;
    line-height: 1.7;
    margin: 0;
    padding: 0;
    border: 0;
}
.alignC{    
    font-size: 13px;
    color: #555;
    font-family: 'Nanum Gothic', '맑은 고딕', '돋움', Dotum, sans-serif;
    line-height: 1.7;
    text-align: center !important;
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: middle;
}
 
 .contanier{
 width: 90%;
 margin-left: auto;
 }
 
 
</style>

<div class="wrap">
    <!-- 로고 부분 -->
      <div class="contents">
		<div id="container">
			<div class="header" style="margin-top: 5px;">
<h1 class="text">
	<span id="cpain" style="font-size: 20px;">인사말</span>
</h1>
</div>
<hr>
<div class="body">
	<div class="greeting">

		<p class="abo_slogan">형택대학교 기숙사 인성교육관에 입사하신 여러분을 진심으로 환영합니다.</p>

		<p class="abo_slogan2">
		
<!-- 		<img src="/resources/images/logo_circle.png" alt="logo" style="width:250px; height:250px;"> -->
			변화된 환경 속에서 대학생활에 잘 적응할 수 있도록 숙식 및 편의 시설 등을 제공하고 공동체 생활을 통하여 건전한 인격형성과
			자기계발, 성실성을 함양하여 사회에 필요한 인재양성을 목표로 설립된 우리 인성교육관은 기존의 단순 기숙형 생활공간을 탈피하여
			다양한 인성, 문화, 교육, 그리고 체육프로그램을 제공함으로써 공동체 의식과 타인을 배려하는 자세를 지닌 사회적 인재를
			양성하고자 합니다.<br>
			<br> 이를 위해 관장을 비롯한 우리 인성교육관 전 직원들은 관생들의 안전과 가장 쾌적한 생활여건을 조성하고자
			불철주야 노력하고 있으며, 생활에 필요한 서비스를 효과적으로 지원하기 위해 최선을 다하고 있습니다.<br>
			<br>안락한 주거환경과 최상의 서비스 안에서 우리 관생들은 학업에 정진하고, 다양한 여가활동과 교우 관계를 통해
			평생의 우정을 쌓아가며, 장래의 아름다운 꿈을 키워나가시기 바랍니다. 아울러 인성교육관은 가족의 울타리를 벗어나 독립된
			인격체로서 공동체를 체험하며 자연스럽게 질서와 협동 그리고 절제를 배우는 훈련의 장이기도 합니다. 지성인으로서 건전한
			인격형성을 통해 제반 규정사항을 준수하고, 면학분위기 조성 및 관생 상호간에 기본 예의를 갖추어 품위 있는 기숙 생활을
			당부드립니다. <br>
			<br> 미래의 주역이 될 우리 관생들에게 인성교육관은 꿈의 산실이 되고, 인격수련의 도장이 되도록 최선을
			다하겠습니다. 앞으로도 여러분들을 위해 더욱 발전적으로 변모해 나갈 인성교육관에 큰 관심과 애정을 가져주시고, 아낌없는
			성원을 보내주시기 바랍니다.
			
		</p>


<!-- 		<p class="sign"> -->
<!-- 			<span class="name"></span> -->
<!-- 		</p> -->
	</div>
			</div>
		</div>
	</div>
</div>