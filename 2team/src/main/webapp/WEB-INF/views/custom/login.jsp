<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 화면 </title>
<link href="../resources/css/custom/login/login.css" rel="stylesheet" type="text/css" />
<script src="../resources/js/jquery-1.10.2.min.js"></script>
<script src="../resources/js/custom/login.js"></script>
<script type="text/javascript">
$(document).ready(function(){ // 문서전체가 로딩되면 실행. 그래야 문서에 있는 요소들을 지정해서 가져올 수 있음.
	// 문서가 로딩 되지 않은 상태에서 #id 를 하면 아직 해당 id가 생성되지 않아 읽어올 수가 없다.
	
	
	$('#btn').click(function(e){
	var shaPw = hex_sha512($('#passwd').val()).toString();
		e.preventDefault(); // submit 실행 막음(action 안ㅇ넘어가게)
		var data = "id=" + $('#id').val()+"&passwd="+ shaPw; // passwd의 value 가져오기
		// ajax 실행
		$.ajax({
			url:"/loginPro", // 요청할 url
			type : "POST", // 메소드
			data:data,
			success : function(data){ // 성공했을 경우. data는 요청한 url에서 리턴된 내용이 들어감.
				switch(data){
					case 0 : alert("아이디, 비밀번호가 일치하지 않습니다."); break;
					case 1 : alert("어드민 페이지로 이동합니다"); document.location.href="/admin/index"; break // 어드민 계정으로 로그인함.
					case 2 : alert("로그인이 성공했습니다"); document.location.href="/"; break;
				}
			}
		})
	})
})
</script>
</head>
<body>
	<form class="container" title="로그인 폼" method="POST">
		<div class="logo">
			<a href="/"> <img src="../resources/image/custom/logo.gif" alt="" /> </a>
		</div>
				<div class="container-id">
			<div class="text-id"> 아이디 </div>
			<div class="box-id">
				<input type="text" title="아이디" name="id" id="id" placeholder="아이디를 입력하시오." >
			</div>
		</div>
				
		<div class="container-pw">
			<div class="text-pw"> 비밀번호 </div>
			<div class="box-pw">
				<input type="password" title="비밀번호" name="passwd" id="passwd" placeholder="비밀번호를 입력하시오." >
			</div>
		</div>
		<div class="container-button">
			<div class="box-button">			
				<input type="submit" id="btn" title="로그인" value="로그인" >
			</div>
		</div>	
	</form>
</body>
</html>
