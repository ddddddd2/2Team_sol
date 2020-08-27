<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$('document').ready(function({
	
$('#btn').click(function(e){
	e.preventDefault();
	var id = $('#id').val();
	var pw = $('#passwd').val();
	$.ajax({
	url:"/",
	data:{
		"id":id,
		"passwd":pw
		},
	type:"POST",
	dataType:"JSON"
	})
	success : function(data){
		swith(data){
			case 0 : alert("로그인 실패. 아이디 비밀번호가 맞지 않습니다.");
			case 1 : alert("어드민 계정 맞음ㅇㅇ"); $('#form').innerHTML("${mdto.getName}님의 월급일은 4일 남았습니다.")
			case 2 : alert("유저 아이딘데? 너 누구야");
			
		}		
	},
	error : function(){
		"에러 발생."
	}
})
})
</head>
<body>
	<form name="loginForm" method="post" action="/">
	<table>
	<tr id="form">
	<c:choose>
		<c:when test="${idkey==null}">
			<td>아이디</td><td><input type="text" id ="id" name="id"></td>
			<td>패스워드</td><td><input type="password" id = "passwd" name="passwd"></td>
			<input type="submit" id="btn" value="로그인">
		</c:when>
		<c:when test="${mdto.getRole=='admin'}">
			${mdto.getName}님의 월급일은 4일 남았습니다.
	
		</c:when>
		<c:when test="${mdto.getRole!='admin'}">
			회원 아이디로 접속했습니다. 너 누구야?
		</c:when>
	</c:choose>
	</tr>
	<tr>
	<td>
	</td>
	</tr>
	</table>
	</form>
</script>
</body>
</html>