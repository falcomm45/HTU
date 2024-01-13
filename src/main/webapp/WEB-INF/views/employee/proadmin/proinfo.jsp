<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <sec:authentication property="principal.userVO" var="userVO" /> --%>
<style>
/* 교수리스트 css */
.proadmin_box {
	width: 100%;
	padding: 40px;
	background-color: #ffffff; height:100%;
}

.proadmin_box .table_topic {
	font-size: 20px;
	padding-bottom: 5px;
}

.proadmin_box .table_topic i {
	margin-left: 10px;
}

.proadmin_box table {
	font-size: 14px;
	width: 100%;
	text-align: center;
}

.table_title {
	font-size: 13px;
	border-top: 1px solid #d1d0d0;
	border-bottom: 1px solid #d1d0d0;
	height: 32px;
	line-height: 32px;
}

.proadmin_box tr{height:40px; border-bottom:1px solid #ebebeb;}
.proadmin_box tr:first-child{background-color:#EEF1F6;}
.proadmin_box tr:hover{background-color:#f2f3f4;}
.proadmin_box tr:first-child:hover{background-color:#EEF1F6;}

.proadmin_box tr {
	height: 40px;
}

.proadmin_box tr td:nth-child(1) {
	width: 10%;
}

.proadmin_box tr td:nth-child(2) {
	width: 15%;
}

.proadmin_box tr td:nth-child(3) {
	width: 15%;
}

.proadmin_box tr td:nth-child(4) {
	width: 15%;
}

.proadmin_box tr td:nth-child(5) {
	width: 15%;
}

.proadmin_box tr td:nth-child(6) {
	width: 15%;
}

.proadmin_box tr td:nth-child(7) {
	width: 15%;
}

.proadmin_box .table_topic {
	font-size: 20px;
	padding-bottom: 30px;
	margin-top: 40px;
}
/* modal열렸을 때 css */
.customModal .table_topic {
	font-size: 20px;
	padding-bottom: 30px;
	margin-top: 40px;
}

.proinfodetailTable {
	border: 1px solid #333;
}

.customModal input {
	font-size: 14px;
	width: 120px;
	margin-left: 5px;
	display: inline-block;
	color: #000 !important;
}

.customModal .input_width {
	width: 180px;
}

.customModal .userAddr2 {
	width: 395px !important;
}

.customModal .input_border {
	border-right: 1px solid #ebebeb;
}

.customModal input:focus {
	outline: none;
}

.customModal td {
	display: flex;
	border: 1px solid #ebebeb;
	box-sizing: border-box;
	height: 30px;
}

.customModal .th_span {
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
/* 프로필이미지 변경 css */
.filehover {
	transition: .3s;
	cursor: pointer;
}

.filehover:hover {
	position: relative;
	transition: .3s;
	cursor: pointer;
}

.filehover:hover::before {
	content: "";
	transition: .3s;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
}

.filehover:hover::after {
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
</style>
<!-- 노드를 클릭하여 해당내역출력폼 -->
<div id="updateForm" style="height:100%; background-color:#ffffff; overflow-y:scroll;"></div>
<!-- 파일변경 -->
<input type="file" id="inputFile" style="display: none;" />
<!-- 단과대리스트출력 -->
<input type="text" value='${jsonColeCommonList}' id="jsonColeCommonList"
	style="display: none;" />
<!-- 학과리스트출력 -->
<input type="text" value='${jsonDepartmentList}' id="jsonDepartmentList"
	style="display: none;" />

<script type="text/javascript">
    // 첫화면 로딩시 전체노드출력
    $(document).ready(function () {
        setTimeout(function () {
            $("#COLE_anchor").click();
        }, 100);
    });
    
    //모달 내 수정버튼 클릭시 발생 이벤트
    $(document).on("click", ".modify_btn", function () {
        $("input").removeAttr("readonly");
        $("select").removeAttr("readonly");
        $("select").css("border", "1px solid #ebebeb");
        $("input").css("border", "1px solid #ebebeb");
        $("select").css("border-radius", "3px");
        $("input").css("border-radius", "3px");
        $(this).hide();
        $(".submit_btn").show();
        $(".cancle_btn").show();
        $(".addr_btn").show();
        $("#proRet").prop('type', "date");
        $(".first_select").css("color", "#888888");
    });

    //모달 내 취소버튼 클릭시 발생 이벤트
    $(document).on("click", ".cancle_btn", function () {
        $("input").attr("readonly", true);
        $("select").attr("readonly", true);
        $("select").css("border", "none");
        $("input").css("border", "none");
        $(this).hide();
        $(".submit_btn").hide();
        $(".addr_btn").hide();
        $(".modify_btn").show();
    });

    //프로필이미지를 감싸고 있는 td(.filehover)를 클릭하면 파일선택input이 뜨도록
    $(document).on("click", ".filehover", function (event) {
        $("#inputFile").click()
    });

    //파일내용이 바뀌면 발생하는 이벤트
    $("#inputFile").on("change", function (e) {

        const formData = new FormData();
        formData.append('file', $("#inputFile")[0].files[0]);
        /* 해당하는 학번(=userCd)을 같이 ajax로 보내기 위함*/
        const proCdArr = $(".proCd_only");
        /* 클릭할 때마다 변하는 학번 중 제일 마지막 학번에 해당하는 파일 내용을 변경하기 위함 */
        const proCd = $(proCdArr[proCdArr.length - 1]).val();
        formData.append("userCd", proCd);

        // console.log(formData);

        //사진변경
        $.ajax({
            url: "/employee/proadmin/upload",
            type: "post",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            //파일변경 성공시 변경된 사진을 미리보기로 보여줌
            success: res => {
                // console.log(res);
                let files = e.target.files;
                // console.log(files);

                //이미지 오브젝트 배열
                let fileArr = Array.prototype.slice.call(files);

                //fileArr : 파일들 -> f : 파일
                fileArr.forEach(function (f) {

                    let reader = new FileReader();

                    //e : 리더가 이미지 읽을 때 이벤트
                    reader.onload = function (e) {
                        const fileArr = $(".uploadFiles");
                        $(fileArr[fileArr.length - 1]).attr("src", e.target.result);
                    }
                    reader.readAsDataURL(f);
                });
            },
            error: xhr => {
                console.log(xhr);
            }
        });
    });

    //수정완료버튼 클릭시
    $(document).on("click", ".submit_btn", function (event) {
        //각 아이디에 해당하는 내용의 value를 담음
        const data = {
            "userCd": $("#proCd").val(),
            "userNm": $("#userNm").val(),
            "userNme": $("#userNme").val(),
            "userReg1": $("#userReg1").val(),
            "userReg2": $("#userReg2").val(),
            "userBank": $("#userBank").val(),
            "userAcc": $("#userAcc").val(),
            "userZip": $("#userZip").val(),
            "userAddr1": $("#userAddr1").val(),
            "userAddr2": $("#userAddr2").val(),
            "userTel": $("#userTel").val(),
            "userMail": $("#userMail").val(),
            //userVO안에 professorVO를 보낼때에는 이런식으로 표현
            professorVO: {
                "comdCd": $("#comdCd option:selected").val(),
                "depCd": $("#selectDept").val(),
                "roomCd":$("#roomCd").val(),
                "proJoin": $("#proJoin").val(),
                "proRet": $("#proRet").val(),
                
            }
        }

        //update내용 ajax로 보냄
        $.ajax({
            url: "/employee/proadmin/update",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(data),
            type: "post",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (res) {
                //update한 내용(userVO, professorVO) 모두 업데이트완료시 해당 내용으로 모달창내역 변경
                if (res == 2) {
                    $("#userNm").val(data.userNm);
                    $("#userNme").val(data.userNme);
                    $("#userReg1").val(data.userReg1);
                    $("#userReg2").val(data.userReg2);
                    $("#userBank").val(data.userBank);
                    $("#userAcc").val(data.userAcc);
                    $("#userZip").val(data.userZip);
                    $("#userAddr1").val(data.userAddr1);
                    $("#userAddr2").val(data.userAddr2);
                    $("#userTel").val(data.userTel);
                    $("#userMail").val(data.userMail);

                    $("#comdCd").val(data.professorVO.comdCd);
                    $("#selectDept").val(data.professorVO.depCd);
                    $("#roomCd").val(data.professorVO.roomCd);
                    $("#proJoin").val(data.professorVO.proJoin);
                    $("#proRet").val(data.professorVO.proRet);

                    //변경되어야할 css
                    $("input").attr("readonly", true);
                    $("select").attr("readonly", true);
                    $("select").css("border", "none");
                    $("input").css("border", "none");
                    $(".submit_btn").hide();
                    $(".cancle_btn").hide();
                    $(".modify_btn").show();
                    //sweatalert
                    alertSuccess("정보수정이 완료되었습니다.");
                }
            },
            error: function (xhr) {
                console.log(xhr);
                alertError("정보수정이 실패했습니다.");
            },
        })
    });

    // 주소 api
    function proinfo_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ""; // 주소 변수
                var extraAddr = ""; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === "R") {
                    // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else {
                    // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === "R") {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== "" && data.apartment === "Y") {
                        extraAddr +=
                            extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== "") {
                        extraAddr = " (" + extraAddr + ")";
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //<input type="text" id="address3" style="display: none;"> --> 이 내용 jsp에 붙여넣기
                    document.getElementById("userAddr3").value = extraAddr;
                } else {
                    document.getElementById("userAddr3").value = "";
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("userZip").value = data.zonecode;
                document.getElementById("userAddr1").value = addr;
                // 기존의 상세주소를 지우고 커서를 상세주소 필드로 이동한다.
                document.getElementById("userAddr2").value = '';
                document.getElementById("userAddr2").focus();
            },
        }).open();
    }

    //모달 출력시 닫기버튼 또는 배경을 누르면 모달닫힘
    function closeModal() {
        $(".customModal").fadeOut();
        $(".modal-bg").fadeOut();
    }
    function modalBgClick() {
        $(".customModal").fadeOut();
        $(".modal-bg").fadeOut();
    }

    //모달 내 수정버튼을 누른 후 단과대 선택시 colCd가 같은 학과만 출력
    function handleChange(event) {
        const colCd = $(event.target).val();
        let appendText = '';
        appendText += `<option value="none"></option>`;
        const jsonDepartmentList = JSON.parse($("#jsonDepartmentList").val());
        jsonDepartmentList.forEach(dept => {
            if (dept.colCd == colCd) {
                appendText += `<option value="\${dept.depCd}">\${dept.depNm}</option>`
            }
        })
        $("#selectDept").html("");
        $("#selectDept").append(appendText);
    }

    //노드트리
    $(function () {
        // 노드정보를 저장하기 위한 변수
        var data = [];

        // 페이지 로딩시 tree구조 화면에 랜더링
        renderTree();

        //
        let proArr = [];

        // 트리구조를 비동기통신 방식으로 서버에서 받아온 후 설정해주는 함수
        function renderTree() {
            $.ajax({
                url: "/employee/proadmin/list",
                contentType: "text/html; charset=UTF-8",
                dataType: "json",
                type: "get",
                // 통신 성공시
                success: (res) => {

                    // 일단 가져온값 찍음
                    console.log("renderTree()의 ajax의 return값 : ", res);

                    // List로 가져와서 OrganizationChartVO의 개수만큼 반복
                    $.each(res, function (idx, chart) {

                        // 트리뷰 한 줄에대한 정보를 tempObj에 저장
                        let tempObj = {
                            // id에 자신의 코드 저장
                            id: chart.organizationCode,
                            // parent에 부모의 코드 저장
                            parent: chart.organizationParentCode,
                            // text에 이름을 저장
                            text: chart.organizationDescription == null ? chart.organizationName : chart.organizationName + "(" + chart.organizationDescription + ")",
                            // 노트의 유형을 저장하는 부분
                            // 아래에서 type을 설정한다음 값을 줄 수 있음
                            // 아이콘 외에도 노드의 자식수 등 다양한 설정가능
                            type: "file"
                        };

                        // 만약 부모가 최상위 노드이면(DB에서 organizationCode의 이름참고)
                        if (tempObj.parent == "#") {
                            tempObj.state = {
                                // 노드를 열어놓을지 닿아놓을지
                                opened: true,
                                // 노드를 활성화할지 비활성화할지
                                disabled: false,
                                // 노드가 선택된 상태일지 아닐지
                                selected: true,
                                // 노드가 체크된 상태일지 아닐지
                                checked: false,
                            };
                            tempObj.type = "folder";
                        }

                        // 노드를 추가할 때, 노드의 이름을 get방식으로 보내게 되는데
                        // 서버에서 이 이름을 addAttribute로 그대로 다시 돌려준다
                        // 만약 insertName이 있다는건 노드를 추가한 상태라는 말이고
                        // 방금 추가된 노드를 오픈상태로 만들기 위해 아래 코드를 작성한 것
                        //                             const insertName = "${nodeName}";
                        //                             if (tempObj.text == insertName) {
                        //                                 data.forEach(item => {
                        //                                     if (item.id == tempObj.parent) {
                        //                                         item.state = {opened : true};
                        //                                     }
                        //                                 });
                        //                             }

                        // 이렇게 설정된 노드1개의 정보를 위에서 선언한 data배열에 추가
                        data.push(tempObj);
                    });
                    
                    console.log("data ==>", data);
                    // foreach문 끝

                    // jstree에서 사용되는 플러그인 및 유형을 설정하여 트리를 초기화
                    // 즉, 위에서 설정된 각각의 노드 1줄의 정보들의 배열인 data를 이용해 트리구조 생성
                    $("#tree").jstree({
                        core: {
                            data: data,
                            // 드래그 앤 드롭을 지원하기 위한 콜백함수
                            check_callback: true
                        },
                        // 트리에 적용할 플러그인을 설정
                        // dnd : 드래그 앤 드롭
                        // contextmenu : 우클릭시 메뉴바 활성화
                        // search : 검색
                        // checkbox : 체크박스 활성화
                        // types : 특정 노드의 유형을 커스터마이칭?처럼 설정할 수 있게하는듯
                        // wholerow : 트리 노드 전체 행에 대한 이벤트 처리 및 스타일링 제공
                        // unique : 각 노드에 고유한 ID를 부여하고 중복된 ID를 방지
                        // 등등 다양한 플러그인이 있으며 그 외의 설정과 자세한 설명은 https://www.jstree.com/plugins/ 여기 있음
                        plugins: ["search", "types"],
                        types: {
//                             'folder': {
//                                 "icon": "/resources/images/icon-folder.png",
//                             },
                            'file': {
                                "icon": "fa fa-file text-secondary",
                            },
                            'folder': {
                           	 "icon" : "fa fa-folder text-warning",
                            },
//                             'injury': {
//                                 "icon": "/resources/images/icon-injury.png",
//                             },
//                             'medicine': {
//                                 "icon": "/resources/images/icon-medicine.png",
//                             },
//                             'treatment': {
//                                 "icon": "/resources/images/icon-treatment.png",
//                             },
//                             'test': {
//                                 "icon": "/resources/images/icon-test.png",
//                             },
//                             default: {
//                             	"icon": ".",
// //                                 "icon": "/resources/images/icon-file.png"
//                             }
								'default':{
									 "icon" : "fa fa-folder text-warning"
// 									 "icon" : "fa fa-folder text-primary"
								}
                        }
                    });
                },
                error: xhr => {
                    console.log(xhr)
                }
            });
        }

        // 노드 검색을 위한 함수, 노드 생성시 플러그인에서 search플러그인을 포함
        // 검색창의 값이 입력될 때 마다 검색
        $("#keyword").on("input", function (event) {
            // 입력된 값 가져오기
            let keyword = $(this).val();
            // jstree의 내장함수를 이용해 검색결과에 효과를 주는부분
            $("#tree").jstree(true).search(keyword);
        });

        // 추가적인 로직을 넣으실꺼면 저 위에 input대신 keydown 넣으시고
        // if (event.originalEvent.code == "Enter" || event.originalEvent.code == "NumpadEnter")
        // 위에 조건문 추가하셔서 엔터키 눌렀을 때만 검색 되도록 설정하세요
        $("#tree").on("search.jstree", function (e, data) {
            console.log("검색해서 가져온거 : ", data.nodes);
        });

        // jstree에서 노드를 선택할 때 발생되는 함수
        $("#tree").on("select_node.jstree", function (e, data) {

            // 선택된 노드의 정보 출력
            console.log("선택된 노드의 정보 : ", data);

            // 해당 노드의 organizationCode를 이용해 detail을 통해 db에서 자세한 정보들을 가져온 다음 json형태로 가져온다
            $.ajax({
                url: "/employee/proadmin/detail?organizationCode=" + data.node.id,
                dataType: "json",
                type: "get",
                success: res => {

                    proArr = res;

                    // 데이터를 성공적으로 가져오면 가져온 데이터 출력
                    console.log("ajax를 통해 detail로 가져온 노드 정보 : ", res);

                    let cnt = 0;

                    // 이렇게 가져온 노드의 정보를 동적으로 화면에 출력
                    let str = `
                                <div class="proadmin_box">
			                    	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
			                    	<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
			                    	<span style="font-size:12px; color:#888888;">></span>
			                    	<span style="font-size:12px; color:#888888;"><a href="/employee/proadmin/proinfo">교수관리</a></span>
			                    	<span style="font-size:12px; color:#888888;">></span>
			                    	<span style="font-size:12px; color:#888888;"><a href="/employee/proadmin/proinfo">교수정보</a></span>
			                    	</div>
			                    	<div class="table_topic">교수정보<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
			                        <table>
                                        <tr class="table_title">
                                            <td>no</td>
                                            <td>소속단과대</td>
                                            <td>소속학과</td>
                                            <td>교번</td>
                                            <td>이름</td>
                                            <td>교수실</td>
                                            <td>사진유무</td>
                                        </tr>
                            `
                    //forEach시작
                    res.forEach(professor => {
                    	console.log(professor);

                        //file유무를 fileYn에 담음
                        let fileYn = "";
                        if (professor.filesDetailVO == null) fileYn = `<td></td>`
                        else fileYn = `<td>O</td>`

                        str += `
                                        <tr>
                                            <td>\${++cnt}</td>
                                            <td>\${professor.departmentVO.colNm}</td>
                                            <td>\${professor.departmentVO.depNm}</td>
                                            <td><div class="proModal" data-pro-cd="\${professor.proCd}" style="cursor:pointer;">\${professor.proCd}</div></td>
                                            <td><div class="proModal" data-pro-cd="\${professor.proCd}" style="cursor:pointer;">\${professor.userVO.userNm}</div></td>
                                            <td>\${professor.commonDetailVO.comdNm} \${professor.roomCd.substring(6,9)}호</td>
                                            \${fileYn}
                                        </tr>
                            `
                    })
                    //forEach끝
                        str += `
                                    </table>
                                </div>
                            `
                    $("#updateForm").html(str);
                    //로딩시 보이는 화면출력 끝
                    
                    //이름 클릭시 모달창
                    $('.proModal').on("click", function () {
                        //단과대리스트
                        const jsonColeCommonList = JSON.parse($("#jsonColeCommonList").val());
                        //학과리스트
                        const jsonDepartmentList = JSON.parse($("#jsonDepartmentList").val());
                        //console.log("dept => {}", jsonDepartmentList);

                        //.proModal에서 클릭시 받아온 proCd 저장
                        let proCd = $(this).data("proCd");
                        console.log(proCd);

                        proArr.forEach(pro => {
                            if (pro.proCd == proCd) {
                                proCd = pro;
                                return;
                            }
                        })

                        //단과대정보 출력 -> 나중에 단과대와 학과비교하는 곳에서 사용
                        const collegeCode = proCd.departmentVO.colCd;

                        //모달창배경
                        let modalBg = $("<div class='modal-bg'></div>")
                        modalBg.css({
                            position: "absolute",
                            zIndex: "998",
                            top: 0,
                            left: 0,
                            width: "100%",
                            height: "100%",
                            background: "rgba(0, 0, 0, 0.4)",
                        });
                        //상단에 closeModal()있음
                        modalBg.on("click", function () {
                            closeModal();
                        });

                        //모달내용출력부분 css
                        let modalContainer = $("<div class='customModal'></div>");
                        modalContainer.css({
                            position: "fixed",
                            zIndex: "999",
                            top: 0,
                            right: 0, 
                            bottom: 0,
                            width: "600px",
                            height: "100%",
                            background: "#ffffff",
                            boxShadow: "0 0 10px rgba(0, 0, 0, 0.5)",
                            overflowY: "hidden",
                            padding: "55px 60px 55px 40px",
                            transition: "right 1s ease-out",
                        });

                        //모달에 더해줄 내용
                        str = `				
                                <button type="button" onclick="closeModal()" class="btn-two gray mini close_bt" style="padding:5px 10px; margin-bottom:20px; position:fixed; right: 60px; top:20px; transition:.3s;">닫기 <i class="fa-solid fa-xmark" style="color: #ffffff;"></i></button>
                                
                                <div style="height:100%; width:100%;" data-simplebar="init" class="nav nav-pills simplebar-content-wrapper"> 
                                
                                    <form>
                                        <div class="table_topic">기본 정보</div>

                                        <div style="font-size:15px; padding-bottom:10px; display:flex; align-items:center;">
                                            <svg xmlns="http://www.w3.org/2000/svg" height="18" width="18" viewBox="0 0 512 512"><path fill="#751c35" d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336h24V272H216c-13.3 0-24-10.7-24-24s10.7-24 24-24h48c13.3 0 24 10.7 24 24v88h8c13.3 0 24 10.7 24 24s-10.7 24-24 24H216c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
                                            <span style="margin-left:5px;">인적정보</span>
                                        </div>
                                
                                        <div style="display:flex;">
                                            <div class="filehover">
                            `
                            /* 이미지파일이있으면 해당이미지 출력, 없으면 unknown 이미지 출력 */
                            if (proCd.filesDetailVO != null) {
                                str += `<img src="/resources/upload/\${proCd.filesDetailVO.fileSvnm}" id="uploadFile" class="uploadFiles" style="min-width:145px; max-width:145px; height:180px; object-fit: cover;"/>`
                            } else {
                                str += `<img src="/resources/images/unknownperson.jpg" style="min-width:145px; max-width:145px; height:180px; object-fit: cover;" id="uploadFile" class="uploadFiles"/>`
                            }
                        str += `       		</div> 

                                            <table>
                                                <tr>
                                                    <td>
                                                        <div class="th_span">이름</div>
                                                        <input required id="userNm" name="userNm" type="text" value="\${proCd.userVO.userNm}" readonly/>
                                                    </td>
                                                    <td>
                                                        <div class="th_span">영문이름</div>
                                                        <input id="userNme" name="userNme" type="text" value="\${proCd.userVO.userNme}" readonly/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="th_span">생년월일</div>
                                                        <input onclick="birth()" name="userReg1" type="text" value="\${proCd.userVO.userReg1.substring(0,2)}.\${proCd.userVO.userReg1.substring(2,4)}.\${proCd.userVO.userReg1.substring(4,6)}" readonly disabled="disabled" style="background-color:#ffffff;"/>
                                                    </td>
                            `
                            /* 성별은 주민등록번호에 의해 자동입력 */
                            if (proCd.userVO.userReg2.substring(0, 1) == '2') {
                                str += `<td colspan="2"><div class="th_span">성별</div><input type="text" disabled style="background-color:#ffffff;" value="여"/></td>`
                            }
                            else {
                                str += `<td colspan="2"><div class="th_span">성별</div><input type="text" disabled style="background-color:#ffffff;" value="남"/></td>`
                            }
                        str += `
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="th_span">교번</div>
                                                        <input id="proCd" name="professor.proCd" type="text" value="\${proCd.proCd}" class="proCd_only" readonly disabled="disabled" style="background-color:#ffffff;"/></td>
                                                    <td>
                                                        <div class="th_span">주민등록번호</div>
                                                        <div style="display:flex; align-items:center;">
                                                            <input id="userReg1" type="text" name="userReg1" value="\${proCd.userVO.userReg1}" readonly/> <span>-</span> <input id="userReg2" type="text" name="userReg2" value="\${proCd.userVO.userReg2}" readonly/></td>
                                                        </div>
                                                </tr>
                                            </table>
                                        </div>
                                            
                                        <table>
                                            <button type="button" class="btn-two mini dark addr_btn" onclick="proinfo_execDaumPostcode()" style="display:none; margin-left:0;">주소검색</button>
                                            <tr>
                                                <td>
                                                    <div class="th_span">우편번호</div>
                                                    <input id="userZip" type="text" name="userZip" value="\${proCd.userVO.userZip}" class="input_border" readonly/>
                                                    <div class="th_span">주소</div>
                                                    <input id="userAddr1" type="text" name="userAddr1" value="\${proCd.userVO.userAddr1}" class="input_width" readonly/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="th_span">상세주소</div>
                                                    <input id="userAddr2" class="userAddr2" type="text" name="userAddr2" value="\${proCd.userVO.userAddr2}" readonly/>
                                                    <input type="text" id="userAddr3" style="display: none;">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="th_span">은행명</div>
                                                    <input id="userBank" type="text" name="userBank" value="\${proCd.userVO.userBank}" class="input_border" readonly/>
                                                    <div class="th_span">계좌번호</div>
                                                    <input id="userAcc" type="text" name="userAcc" value="\${proCd.userVO.userAcc}" class="input_width" readonly/>
                                                </td> 
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="th_span">연락처</div>
                                                    <input id="userTel" name="userTel" type="text" value="\${proCd.userVO.userTel}" class="input_border" readonly/>
                                                    <div class="th_span">이메일</div>
                                                    <input id="userMail" type="text" name="userMail" value="\${proCd.userVO.userMail}" class="input_width" readonly/>
                                                </td>
                                            </tr>
                                        </table>
                                        
                                        <div class="table_topic" style="font-size:15px; padding-bottom:10px; display:flex; align-items:center;">
                                            <svg xmlns="http://www.w3.org/2000/svg" height="18" width="18" viewBox="0 0 512 512"><path fill="#751c35" d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336h24V272H216c-13.3 0-24-10.7-24-24s10.7-24 24-24h48c13.3 0 24 10.7 24 24v88h8c13.3 0 24 10.7 24 24s-10.7 24-24 24H216c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
                                            <span style="margin-left:5px;">학적정보</span>
                                        </div>

                                        <table>
                                            <tr>
                                                <td>
                                                    <div class="th_span">단과대학</div> 
                                                    <select id="colNm" onchange="handleChange(event)" readonly>
                            `
                            /* 기존에 선택했던 단과대출력, selected */
                            jsonColeCommonList.forEach(college => {
                                if (college.comdCd !== 'COLE09' && college.comdCd !== 'COLE99') {
                        str += `
                                                        <option value='\${college.comdCd}'
                            `
                            const colCd = proCd.departmentVO.colCd;
                                    if (college.comdCd == colCd) {
                        str += `						selected
                            `
                                    }
                        str += `
                                                        >\${college.comdNm}</option>
                            `
                                }
                            });
                        str += `
                                                    </select>
                                                    <div class="th_span" style="border-left:1px solid #ebebeb; box-sizing:borderbox;">전공학과</div> 
                                                    <select id="selectDept" readonly> 
                            `
                            /* 기존에 선택했던 학과출력, selected  / 선택단과대에 해당하는 학과만 출력 */                            
                            jsonDepartmentList.forEach(dept => {
                                if (collegeCode == dept.colCd) {
                        str += `
                                                        <option value='\${dept.depCd}'
                            `
                                    if (dept.depCd == proCd.departmentVO.depCd) {
                        str += `					
                                                        selected
                            `
                                    }
                        str += `					    >\${dept.depNm}</option>
                            `
                                }
                            });
                        str += `
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="th_span">교수실 </div> 
                                                    <input id="roomCd" name="" value='\${proCd.commonDetailVO.comdNm}'readonly/>
                                                    <div class="th_span" style="border-left:1px solid #ebebeb; box-sizing:borderbox;">호실 </div> 
                                                    <input id="roomCdho" name="" value='\${proCd.roomCd.substring(6,9)}호'readonly/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="th_span">입사일자</div> 
                                                    <input id="proJoin" name="professorVO.proJoin" type="date" value='\${proCd.formJoin}' class="input_border" readonly required/>
                                                    <div class="th_span" style="border-left:1px solid #ebebeb; box-sizing:borderbox;">퇴사일자</div> 
                                                    <input id="proRet" name="professorVO.proRet" type="date" value='\${proCd.formRet}' readonly/>
                                                </td>
                                            </tr>
                                        </table>
                                        <button type="button" class="modify_btn btn-two mini dark" style="width:80px; height:25px; padding:5px 10px; margin-top:60px; margin-left:0; ">정보수정</button>
                                        <button type="button" data-pro-cd="\${proCd.proCd}" class="submit_btn btn-two mini dark" style="display:none; width:60px; height:25px; padding:5px 10px; margin-top:60px; margin-left:0;">완료</button>
                                        <button type="button" class="cancle_btn btn-two mini dark" style="display:none; width:60px; height:25px; padding:5px 10px; margin-top:60px; margin-left:0px;">취소</button>
                                    <sec:csrfInput/>
                                    </form> 
                                </div>
                            `;
                            /* 모달str끝 */

                        /* modal추가 , 바디에 동적생성 */
                        modalContainer.append(str);
                        $("body").append(modalContainer);
                        $("body").append(modalBg);

                    })
                }
            });
        });
    });
</script>