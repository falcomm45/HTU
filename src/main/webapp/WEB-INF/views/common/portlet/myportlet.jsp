<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/gridstack-all.js"></script>
<link rel="stylesheet" href="/resources/css/gridstack.min.css">

<style>

  .grid-stack {
    background-color: #EEF1F6;
  }

  .grid-stack-item {
    background-color: #EEF1F6;
/*     border: 1px solid #ebebeb; */
    padding: 40px;
  }

  /* 각각의 item에 패딩을 줌 */
 .grid-stack-item-content {
    padding:5px;
  }
  
  /* portletlock */
  .portletlock{
    cursor:pointer; position:absolute; z-index:999; right:-2px; top:-2px; width:23px; height:23px; display:flex; justify-content:center; align-items:center; border:1px solid #ebebeb; border-radius:3px; background-color:#ffffff;
  }
  
  /* portlettitle */
  .portlettitle{
     position:absolute; z-index:999; left:-2px; top:-2px; height:23px; display:flex; justify-content:start; align-items:center; border:1px solid #ebebeb; border-radius:3px; background-color:#ffffff;
  }
  .portlettitle a{
  	text-wrap:nowrap; font-size:12px; font-weight:600; color:#555555; display:block; padding:2px 15px;
  }
  
  /* portlet css */
  .main_portlet_wrap{
    background-color: #ffffff; width:100%; height:100%; padding:30px; position:relative;
  }
  .main_portlet_wrap input:focus{outline:none;}
  .pcalender, .pnotice, .palarm{
    font-size: 13px; font-weight: 500; border: 1px solid #dddddd; border-radius:3px 3px 0 0; padding:5px 10px; height:25px; text-wrap: nowrap; white-space: nowrap; background-color: #dddddd; z-index: 997; margin-top: 1px;
  }
  
  .palarm{border-radius:25px; margin: 0 5px; padding:5px 12px; border: 1px solid #dddddd!important;}

  .main_portlet_wrap .active{
    background-color: #ffffff; border-bottom: none;
  }

  .pcalendercon, .pnoticecon, .palarmcon{
    display: none;
    padding: 10px;
  }

  /* fullcalendar css*/
  .main_portlet_wrap .fc-toolbar-title {
    padding-top: 8px;
    font-size: 14px!important;
  }

  .main_portlet_wrap .fc .fc-col-header-cell-cushion{
    font-size: 14px!important;
  }

  .fc .fc-toolbar.fc-header-toolbar{margin-bottom: 5px!important;}
  
  .main_portlet_wrap .fc {width:100%; height: 100%; position: relative;}
  
  .main_portlet_wrap .fc-scrollgrid thead{width:100%; text-align: center;}
  .main_portlet_wrap .fc-scrollgrid .fc-scrollgrid-section-header table .fc-scrollgrid-sync-inner{width: 100%!important; text-align: center;}
  
  .main_portlet_wrap .fc-scrollgrid tbody .fc-scrollgrid-sync-inner{height: calc(100% / 6)!important;}
  .main_portlet_wrap .fc-scrollgrid tbody .fc-scrollgrid-sync-table td{height: calc(100% / 6)!important;}
  
  .main_portlet_wrap .fc-scrollgrid thead .fc-scroller-harness .fc-scroller-liquid-absolute{overflow-y: visible!important;}
  .main_portlet_wrap .fc-col-header{width:100%!important; height:20px!important;}
  .main_portlet_wrap .fc-col-header colgroup {width:calc(100% / 7)!important;}
  
  .main_portlet_wrap .fc-daygrid-day-number {
    font-size: 12px; text-wrap: nowrap;
  }

  .main_portlet_wrap .fc-scrollgrid tbody .fc-daygrid-body{width:100%!important; height:100%!important;}
  .main_portlet_wrap .fc-scrollgrid tbody .fc-daygrid-body table{width:100%!important; height:100%!important;}
  .main_portlet_wrap .fc-daygrid-block-event{
    padding: 3px;
    font-size: 10px;
    color: #ffffff;}
</style>

<div class="grid-stack"></div>

<script>
  const commonList = JSON.parse('${jsonPortCommonList}');
  console.log("commonList ==>", commonList);
  
  const jsonPortletList = JSON.parse('${jsonPortletList}');
  console.log("jsonPortletList ==>", jsonPortletList);
  
  const jsonUserVO = JSON.parse('${jsonUserVO}');
  console.log(jsonUserVO);
  
  
  function getForm(text) {
    return `
      <div class="main_portlet_wrap">
        <div class="portletlock">
          <svg xmlns="http://www.w3.org/2000/svg" height="13" width="12" viewBox="0 0 448 512"><path fill="#333333" d="M432 256c0 17.7-14.3 32-32 32L48 288c-17.7 0-32-14.3-32-32s14.3-32 32-32l352 0c17.7 0 32 14.3 32 32z"/></svg>
        </div>
        <div>\${text}</div>
      </div>
    `
  }
    
  let items = [
    {x: 0, y: 0, w: 3, h: 3, content: getForm("프로필포틀릿"), label:"PORT01"}, 
    {x: 3, y: 0, w: 4, h: 5, content: getForm("캘린더포틀릿"), label:"PORT03"},
    {x: 7, y: 0, w: 5, h: 2, content: getForm("커뮤니티포틀릿"), label:"PORT04"},
    {x: 0, y: 3, w: 3, h: 2, content: getForm("학점현황포틀릿"), label:"PORT02"}, 
    {x: 0, y: 6, w: 4, h: 3, content: getForm("알림포틀릿"), label:"PORT06"},
    {x: 7, y: 3, w: 5, h: 3, content: getForm("강의목록포틀릿"), label:"PORT05"},
    {x: 4, y: 5, w: 4, h: 3, content: getForm("상담포틀릿"), label:"PORT07"},
    {x: 8, y: 5, w: 4, h: 3, content: getForm("학적현황포틀릿"), label:"PORT08"},
    {x: 0, y: 9, w: 4, h: 3, content: getForm("성적관리포틀릿"), label:"PORT09"},
    {x: 4, y: 9, w: 4, h: 3, content: getForm("예약현황포틀릿"), label:"PORT10"},
    {x: 8, y: 9, w: 4, h: 3, content: getForm("시간표포틀릿"), label:"PORT11"},
  ];
  
  if (jsonPortletList.length > 0) {
    let txt = "";
    items = items.filter(item => {
      const matchingPortlet = jsonPortletList.find(jsonPortlet => item.label == jsonPortlet.comdCd);
      if (matchingPortlet) {
        item.x = matchingPortlet.porX;
        item.y = matchingPortlet.porY;
        item.w = matchingPortlet.porW;
        item.h = matchingPortlet.porH;
        return true;
      } else {
        txt += `
          <a href="#none" class="sub_menu_a">
            \${getComdNm(item.label)}
            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><path fill="#333333" d="M64 80c-8.8 0-16 7.2-16 16V416c0 8.8 7.2 16 16 16H384c8.8 0 16-7.2 16-16V96c0-8.8-7.2-16-16-16H64zM0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96zM200 344V280H136c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H248v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
          </a>
        `
        return false;
      }
    });
    $(".submenu_menu").html(txt);
    
    
    
  }
  
  function getComdNm(comdCd) {
    return (commonList.find(common => comdCd == common.comdCd)).comdNm;
  }
  
  const grid = GridStack.init({
    cellHeight: "7rem"
  });
  grid.load(items, true);
  
  
  
  $("#savePortlet").on("click", function() {
    
    const savePortletArr = [];
    
    $(".grid-stack-item").each((i, item) => {
      const comdNm = $($(item).children()[0]).find("div:last").text();
      let comdCd = "";
      commonList.forEach(commVO => {
        if (commVO.comdNm == comdNm) comdCd = commVO.comdCd;
      })
      savePortletArr.push({
        porX: $(item).attr("gs-x"),
        porY: $(item).attr("gs-y"),
        porW: $(item).attr("gs-w"),
        porH: $(item).attr("gs-h"),
        comdCd: comdCd,
      })
    })
    console.log(savePortletArr);
    
    $.ajax({
      url: "/common/appPortlet",
      type: "post",
      contentType: "application/json; charset=UTF-8",
      traditional: true,
      data: JSON.stringify(savePortletArr),
      beforeSend:function(xhr){
        xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
      },
      success: res => {
        if (jsonUserVO.comdCd == 'USER01') alertSuccess("포틀릿 설정을 완료했습니다.", "/student/mypage");
        else if (jsonUserVO.comdCd == 'USER02') alertSuccess("포틀릿 설정을 완료했습니다.", "/professor/mypage");
        else alertSuccess("포틀릿 설정을 완료했습니다.", "/employee/mypage");
      }
    })
    
    
  });
  
  $(document).on("click", ".portletlock", function() {
    
    const comdNm = $(this).next().text();
    const comdCd = (commonList.find(commonVO => commonVO.comdNm == comdNm)).comdCd;
    
    $.ajax({
      url: "/common/delPortlet?comdCd="+comdCd,
      type: "get",
      success: res => {
        if (res == 1) {
          $(".submenu_menu").append(`
          <a href="#none" class="sub_menu_a">
            \${comdNm}
            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><path fill="#333333" d="M64 80c-8.8 0-16 7.2-16 16V416c0 8.8 7.2 16 16 16H384c8.8 0 16-7.2 16-16V96c0-8.8-7.2-16-16-16H64zM0 96C0 60.7 28.7 32 64 32H384c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96zM200 344V280H136c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H248v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
            </a>
          `)
          items = items.filter(item => {
            if (item.label == comdCd) return false;
            else return true;
          })
          grid.removeAll();
          grid.load(items);
          }
        }
      })
      
      // $(this).parents()[2].remove();
    });
  
    $(document).on("click", ".sub_menu_a", function() {
      
      const comdNm = $(this).text().trim();
      const comdCd = (commonList.find(commonVO => commonVO.comdNm == comdNm)).comdCd;
      
      $.ajax({
      url: "/common/appPortlet?comdCd="+comdCd,
      type: "get",
      success: res => {
        if (res == 1) {
          $(this).remove();
          items.push({x:0, y:0, w:3, h:3, content:`\${getForm(comdNm)}`, label: comdCd});
          grid.removeAll();
          grid.load(items);
          }
        }
      })
      
  });
  
</script>