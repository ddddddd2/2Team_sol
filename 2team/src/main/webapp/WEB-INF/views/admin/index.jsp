<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/adminMain.css" />
<title>Insert title here</title>
<!-- <script type="text/javascript" src="../resources/js/adminIndex.js"></script> -->
<script type="text/javascript">
$(document).ready(function(){
	$('#btn').click(function(e){
		
		e.preventDefault();
		alert("testsetst")
		loginCk();
	})
});
function loginCk(e){
		var id = $('#id').val();
		var pw = $('#passwd').val();
		alert("test")
		// 입력 값 체크
		$.ajax({
			url:"/loginPro",
			data:{
				"id":id,
				"passwd":pw
				},
			type:"POST",
			dataType:"JSON",
			success : function(data){
				switch(data){
					case 0 : alert("로그인 실패. 아이디 비밀번호가 맞지 않습니다."); break;
					case 1 : alert("어드민 계정 맞음ㅇㅇ"); document.getElementById("form").innerHTML("${mdto.name}님의 월급일은 4일 남았습니다."); break;
					case 2 : alert("유저 아이딘데? 너 누구야");break;
				}		
			},
			error : function(){
				alert("에러 발생.")
			}
		})
}
</script>
</head> 
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	<div id="main-wrapper">
		<div id="content-wrap">
		${mdto.role}
<c:choose>
	<c:when test="${mdto.role==null}">
		<form id="loginForm" name="loginForm" method="post" action="/loginPro">
			<table border=1>
				<tr>
					<td>아이디</td><td><input type="text" id ="id" name="id"></td>
				</tr>
				<tr>
					<td>패스워드</td><td><input type="password" id = "passwd" name="passwd"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
					<input type="submit" id="btn" value="로그인">
					</td>
				</tr>
			</table>
		</form>
	</c:when>
	<c:when test="${mdto.role=='admin'}">
	<div id="loginOk">
		${mdto.name} 관리자님, 로그인 환영!
		<input type="button" value="로그아웃" onclick="document.location.href='/logout'" />
	</div>
	</c:when>
	<c:when test="${mdto.role!='admin'}">
	<div id="loginOk">
		${mdto.name} 유저님, 로그인 환영!.. 이라고 할줄 알았냐 ㅎㅎ
		<input type="button" value="로그아웃" onclick="document.location.href='/logout'" />
	</div>
	</c:when>
</c:choose>
		
		</div>
	</div>

</body>
</html>