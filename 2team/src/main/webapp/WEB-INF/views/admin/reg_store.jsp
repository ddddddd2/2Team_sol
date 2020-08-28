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
		
	}); // 식당명 중복체크
	
	// 주소 중복체크 시작
	$('#addrCheck').click(function(){
		var addr = $('#addrText').val();
		// 공백 갯수 구하기
// 		var m = addr.match(/\s/g);

		var length = addr.length;
		var fs = addr.indexOf(" "); //첫번째 공백 구함
		var si = addr.substring(0, fs); // 시 분리
		var addr2 = addr.substring(fs+1,length) // 시 제외한 문자열 
		$('#si').val(si);
		
		var length2 = addr2.length; // 구를 제외한 문자열
		var ss = addr2.indexOf(" "); //두번째 공백
		var gu = addr2.substring(0,ss); // 구분리
		var addr3 = addr2.substring(ss+1,length2)
		$('#gu').val(gu);
		
		var lenth3 = addr3.length;
		var ts = addr3.indexOf(" ");
		var dong = addr3.substring(0, ts);
		var addr4 = addr3.substring(ts+1, lenth3)
		$('#dong').val(dong);
		$('#addrDetail').val(addr4)
		// 전체 길이 먼저 담기
		//si 잘라내기
	});
	
	// submit 시작
	$('#submitBtn').click(function(e){
		e.preventDefault();
		var name = $('#name').val();
		var si = $('#si').val();
		var gu = $('#gu').val();
		var dong = $('#dong').val();
		var addrDetail = $('#addrDetail').val();
		var tel = $('#tel').val();
		var hour = $('#hour1').val()+" ~ "+$('#hour2').val();
		var file = $('#file').val();
		
		console.log(file)
		
		
	})

	
// 	$('#btn').click(function(e){
// 		e.preventDefault();
// 		var name = $('#name').val();
// 		var address1 = $('#address1').val();
// 		var si = $('#si').val();
// 		var gu = $('#gu').val();
// 		var dong = $('#dong').val();
// 		var tel = $('#tel').val();
// 		var hour =$('#hour').val();
// 	$.ajax({
// 		type:"POST",
// 		url:"/reg_storePro",
// 		data:{
// 			"name":name,
// 			"address1":address1,
// 			"si":si,
// 			"gu":gu,
// 			"dong":dong,
// 			"tel":tel,
// 			"hour":hour
// 		},
// 		dataType:"JSON",
// 		success : function(msg){
// 			alert(msg);
// 		}
		
// 	})
// 	}) // 끝
})
</script>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	<div id="main-wrapper">
		<div id="content-wrap">
			<div>
				<form name="form" method="post" enctype="multipart/form-data">
				<table border="1">
					<tr><th colspan="2">매장 신규 등록</th></tr>
					<tr><td>매장명</td><td><input type="text" id="name"><button id="nameCheck">중복체크</button><span id="nameCheck2"></span></td></tr>
					<tr><td>주소</td><td><input type="text" id="addrText"><input type="button" id="addrCheck" value="중복 확인"/></tr>
					<tr><td>시도명</td><td><input type="text"  style="width:500px;" id="si"  name="si" /></td></tr>
					<tr><td>시군구명</td><td><input type="text"  style="width:500px;" id="gu"  name="gu" /></td></tr>
					<tr><td>읍면동명</td><td><input type="text"  style="width:500px;" id="dong"  name="dong" /></td></tr>
					<tr><td>고객입력 상세주소</td><td><input type="text"  style="width:500px;" id="addrDetail"  name="addrDetail" /></td></tr>
					
					<tr><td>연락처</td><td><input type="text" id="tel"></td></tr>
					<tr><td>영업시간</td><td><input type="text" id="hour1"> ~ <input type="text" id="hour2"></td></tr>
					<tr><td>이미지 등록</td><td><input type="file" id="file" name="fileName"></td></tr>
					<!-- 이미지 파일이 등록되면 미리보기식으로 불러온다. -->
        			<tr><td colspan="2"><img id="foo"src="#" /></td></tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<input type="submit" id="submitBtn" value="등록">&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소">
						</td>
					</tr>
				</table>
				</form>
			</div> <!-- 메인 컨텐츠 -->
		
		</div>
	</div>
<script type="text/javascript">
	let reader = new FileReader();
	
	reader.onload = (readerEvent) => {
	    document.getElementById("foo").setAttribute('src', readerEvent.target.result);
	};

document.getElementById("file").addEventListener("change", (changeEvent) => {

    let imgFile = changeEvent.target.files[0];
    reader.readAsDataURL(imgFile);
});
</script>
</body>
</html>