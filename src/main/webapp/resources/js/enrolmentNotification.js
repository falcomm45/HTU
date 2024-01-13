"use strict";

let cnt = 0;
let enrolSocket = null;

$(function() {
  setTimeout(enrolConnectWS,500);
});

// 소켓
function enrolConnectWS() {
  let ws = new SockJS("http://localhost/enrol");
  enrolSocket = ws;
  
  ws.onopen = function(userCd) {
    console.log("연결 완료");
    sendMessageToServer("로그인사용자");
  }
  
  ws.onmessage = function(event) {
    cnt = JSON.parse(event.data);
    console.log(cnt);
  };
  
  ws.onclose = function() {
    console.log("소켓 연결 종료");
  };
};