// (function () {
//   'use strict'
//   var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
//   tooltipTriggerList.forEach(function (tooltipTriggerEl) {
//     new bootstrap.Tooltip(tooltipTriggerEl)
//   })
// })()

//해당 링크로 이동하면 active가 생김
$(document).ready(function () {
  $("ul li a").click(function () {
    $(this).addClass('active');
    $(this).parent().siblings().find('a').removeClass('active');
  });
});
