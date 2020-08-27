<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/adminMain.css" />
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bcsnfehc0x"></script>
<!-- <script type="text/javascript" src="../resources/js/adminIndex.js"></script> -->
<script type="text/javascript">
$('document').ready(function(){
	$('#nameCheck').click(function(e){
		e.preventDefault();
		var name = $('#name').val();
		$.ajax({
			type:"POST",
			url:"/admin/reg_storePro/nameChk",
			data:{
				"nameChk":name
			},
			dataType:"JSON",
			success : function(data){
				console.log(data);
					$('#nameCheck2').text("중복확인해야함.");
				switch(data){
				case 0 : $('#nameCheck2').text("사용가능한 이름입니다").css("color","blue");break;
				case 1 : $('#nameCheck2').text("사용불가능한 이름입니다").css("color","red");break;
				}
			},
			error : function(data){
				alert("에러 : "+data)
				console.log(data);
			}
			
		})
		
	});
	$('#')
	$('#btn').click(function(e){
		e.preventDefault();
		var name = $('#name').val();
		var address1 = $('#address1').val();
		var si = $('#si').val();
		var gu = $('#gu').val();
		var dong = $('#dong').val();
		var tel = $('#tel').val();
		var hour =$('#hour').val();
	$.ajax({
		type:"POST",
		url:"/reg_storePro",
		data:{
			"name":name,
			"address1":address1,
			"si":si,
			"gu":gu,
			"dong":dong,
			"tel":tel,
			"hour":hour
		},
		dataType:"JSON",
		success : function(msg){
			alert(msg);
		}
		
	})
	})
})


function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/juso","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		document.form.engAddr.value = engAddr;
		document.form.jibunAddr.value = jibunAddr;
		document.form.zipNo.value = zipNo;
		document.form.admCd.value = admCd;
		document.form.rnMgtSn.value = rnMgtSn;
		document.form.bdMgtSn.value = bdMgtSn;
		document.form.detBdNmList.value = detBdNmList;
		/** 2017년 2월 추가제공 **/
		document.form.bdNm.value = bdNm;
		document.form.bdKdcd.value = bdKdcd;
		document.form.siNm.value = siNm;
		document.form.sggNm.value = sggNm;
		document.form.emdNm.value = emdNm;
		document.form.liNm.value = liNm;
		document.form.rn.value = rn;
		document.form.udrtYn.value = udrtYn;
		document.form.buldMnnm.value = buldMnnm;
		document.form.buldSlno.value = buldSlno;
		document.form.mtYn.value = mtYn;
		document.form.lnbrMnnm.value = lnbrMnnm;
		document.form.lnbrSlno.value = lnbrSlno;
		/** 2017년 3월 추가제공 **/
		document.form.emdNo.value = emdNo;
}
</script>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	<div id="main-wrapper">
		<div id="content-wrap">
			<div>
				<form name="form" method="post" action="admin/reg_storePro" enctype="multipart/form-data">
				<table border="1">
					<tr><th colspan="2">매장 신규 등록</th></tr>
					<tr><td>매장명</td><td><input type="text" id="name"><button id="nameCheck">중복체크</button><span id="nameCheck2"></span></td></tr>
					<tr><td>주소</td><td><input type="text" readonly="readonly"><input type="button" onClick="goPopup();" value="주소 찾기"/></tr>
					<tr><td>도로명주소 전체(포멧)</td><td><input type="text"  style="width:500px;" id="roadFullAddr"  name="roadFullAddr" /></td></tr>
					<tr><td>참고주소             </td><td><input type="text"  style="width:500px;" id="roadAddrPart2"  name="roadAddrPart2" /></td></tr>
					<tr><td>시도명        		</td><td><input type="text"  style="width:500px;" id="siNm"  name="siNm" /></td></tr>
					<tr><td>시군구명        	</td><td><input type="text"  style="width:500px;" id="sggNm"  name="sggNm" /></td></tr>
					<tr><td>읍면동명        	</td><td><input type="text"  style="width:500px;" id="emdNm"  name="emdNm" /></td></tr>
					<tr><td>고객입력 상세주소    </td><td><input type="text"  style="width:500px;" id="addrDetail"  name="addrDetail" /></td></tr>
					<tr><td>법정리명        	</td><td><input type="text"  style="width:500px;" id="liNm"  name="liNm" /></td></tr>
					<tr><td>도로명        		</td><td><input type="text"  style="width:500px;" id="rn"  name="rn" /></td></tr>
					
					<tr><td>상세주소</td><td><input type="text"></td></tr>
					<tr><td>연락처</td><td><input type="text"></td></tr>
					<tr><td>영업시간</td><td><input type="text"></td></tr>
					<tr><td>이미지 등록</td><td><input type="file" name="fileName"></td></tr>
					<!-- 이미지 파일이 등록되면 미리보기식으로 불러온다. -->
					<tr><td colspan="2" style="text-align:center;"><input type="submit" value="등록">&nbsp;&nbsp;&nbsp;<input type="reset" value="취소"></td>
				</table>
					<input type='file' id="imgInp" />
        			<img id="foo"src="#" />
				</form>
			</div> <!-- 메인 컨텐츠 -->
		
		</div>
	</div>
<script type="text/javascript">
$('#searchJuso').click(function(){
window.open("/juso","주소 검색", "width:400, height:600 toolbar=no, menubar=no, scrollbars=no, resizeable=yes");	
var mapOptions = {
	    center: new naver.maps.LatLng(37.3595704, 127.105399),
	    zoom: 10
	};

	var map = new naver.maps.Map('map', mapOptions);
})
</script>
<script type="text/javascript">
let reader = new FileReader();

reader.onload = (readerEvent) => {
    document.querySelector("#foo").setAttribute('src', readerEvent.target.result);
};

document.querySelector("#imgInp").addEventListener("change", (changeEvent) => {

    let imgFile = changeEvent.target.files[0];
    reader.readAsDataURL(imgFile);
});
</script>
</body>
</html>