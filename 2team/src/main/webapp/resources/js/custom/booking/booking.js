<<<<<<< HEAD

function f_ChangeMonth( pYyyyMmDd ) {
	var frm = document.frm;
	var gv_save_yyyymmdd = "";
	
	$.ajaxSetup({ async:false }); 
	
	gv_save_yyyymmdd = pYyyyMmDd;

	$.ajaxSetup({ async:true }); 
}			

//--일자 선택에 대한 처리 (pYyyyMmDd - 상품일자, pSdSeq - 일정SEQ, pSdTimeuseYn - 일정의 시간 사용여부, pSdEndHhmi - 일정의 종료시간)
function f_SelectDate( pYyyyMmDd, pSdSeq, pSdTimeuseYn, pSdEndHhmi , weekName, id) {
	valueReset(); //날짜&시간 선택시 전에 선택했던 항목 초기화
	
	var frm = document.frm;
	$(".calendar-data a").removeClass("on");
	$("#"+id).addClass("on");
	
	var selectDay = pYyyyMmDd.substr(0,4)+ '년 ' + pYyyyMmDd.substr(4,2) + '월 ' + pYyyyMmDd.substr(6) + "일(" + weekName + ")";
	$("#selectDay").text(selectDay);
}

function valueReset(){
	$(".price total").text("0");
	$(".sumText").text("");
=======

function f_ChangeMonth( pYyyyMmDd ) {
	var frm = document.frm;
	var gv_save_yyyymmdd = "";
	
	$.ajaxSetup({ async:false }); 
	
	gv_save_yyyymmdd = pYyyyMmDd;

	$.ajaxSetup({ async:true }); 
}			

//--일자 선택에 대한 처리 (pYyyyMmDd - 상품일자, pSdSeq - 일정SEQ, pSdTimeuseYn - 일정의 시간 사용여부, pSdEndHhmi - 일정의 종료시간)
function f_SelectDate( pYyyyMmDd, pSdSeq, pSdTimeuseYn, pSdEndHhmi , weekName, id) {
	valueReset(); //날짜&시간 선택시 전에 선택했던 항목 초기화
	
	var frm = document.frm;
	$(".calendar-data a").removeClass("on");
	$("#"+id).addClass("on");
	
	var selectDay = pYyyyMmDd.substr(0,4)+ '년 ' + pYyyyMmDd.substr(4,2) + '월 ' + pYyyyMmDd.substr(6) + "일(" + weekName + ")";
	$("#selectDay").text(selectDay);
}

function valueReset(){
	$(".price total").text("0");
	$(".sumText").text("");
>>>>>>> refs/heads/mypage
}