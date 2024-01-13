// timer
var totalSeconds = 60 * 60; // 초 단위로 설정

function updateTimer() {
  var minutes = Math.floor(totalSeconds / 60);
  var seconds = totalSeconds % 60;

  // 분과 초를 두 자리 숫자로 표시
  document.getElementById('minutes').textContent = minutes.toString().padStart(2, '0');
  document.getElementById('seconds').textContent = seconds.toString().padStart(2, '0');
}

function myTimerFunction() {
  if (totalSeconds > 0) {
    totalSeconds--;
    updateTimer();
  } else {
    clearInterval(intervalId);
    alert('타이머가 종료되었습니다!');
  }
}

// 1초마다 myTimerFunction 함수를 실행
var intervalId = setInterval(myTimerFunction, 1000);

// 초기화
updateTimer();

function addExtraTime() {
  // 추가할 시간 (여기선 5분을 추가하는 예제)
  var extraTime = 60 * 60;
  totalSeconds = extraTime;
  updateTimer();
}

//페이지내에서 어떤 버튼을 눌러도 시간리셋
document.addEventListener('click', function() {
  addExtraTime();
});

//weather
// const API_KEY = "dfae6f06f26d27a5b24a81783d154911";

// // position => GeolocationPosition Object
// function onGeoOk(position) {
//   const lat = position.coords.latitude;
//   const lon = position.coords.longitude;
//   const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`;
//   fetch(url)
//     .then((response) => response.json())
//     .then((data) => {
//       const weather = document.querySelector("#weather span:first-child");
//       const city = document.querySelector("#weather span:last-child");
//       city.innerText = data.name;
//       weather.innerText = `${data.weather[0].main} / ${data.main.temp}`
//       console.log(data);
//     });
//   // fetch() 가 브라우저로 가지 않고 url을 실행시켜줌
// }

// function onGeoError() {
//   alert("날씨정보를 이용하시려면 위치를 허용해주세요.");
// }

// // 2개의 argument (true function, false function)
// navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);

//메인메뉴 - 슬라이드
$(document).ready(function (){
    //$('.menu').hide();
    //$("#hambuger").click(
    //  function(){$('.menu').stop().slideToggle(300);
    //});

    $('.sub_menu ul li').mouseover(function(){
      const index = $(this).parent().index();
      $('.menu ul li').eq(index).addClass('effect');
  });

  $('.sub_menu ul li').mouseout(function(){
      const index = $(this).parent().index();
      $('.menu ul li').eq(index).removeClass('effect');
  });
});

