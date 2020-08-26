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
		loginCk();
	})
});
function loginCk(){
		var id = $('#id').val();
		var passwd = $('#passwd').val();
		// 입력 값 체크
		if($.trim($('#id').val()) == ''){
			alert("아이디를 입력해 주세요.");
			$('#id').focus();
			return;
		}else if($.trim($('#passwd').val()) == ''){
			alert("패스워드를 입력해 주세요.");
			$('#passwd').focus();
			return;
		}
		$.ajax({
			url : "/loginPro",
			type : "POST",
			data : {
				id : id,
				passwd : passwd
			},
			success : function(response){
				if(response==0){ // 로그인 성공
					alert("아이디와 패스워드가 일치하지 않습니다.")
				} else if(response==1){
					alert("로그인 실패 - 유저 아이디")
				} else {
					document.location.href="/";
					alert("로그인 성공")
				};
			}
			
		});
}
	
	

// 	$('#btn').click(function(){
// 		var id = document.getElementById("id").value;
// 		var passwd = document.getElementById("passwd").value;
// 		console.log(id);
// 		console.log(passwd);
		
// 		$.ajax({
// 		url:"/admin/login",
// 		data:{
// 			"id":id,
// 			"passwd":passwd
// 			},
// 		type:"POST",
// 		dataType:"JSON"
// 		success:function(data){
// 			alert(data.id);
// 			console.log(JSON.parse(data));
	// 		$.each(data(function(){
	// 			console.log(data.id);	
	// 			console.log(data.passwd);	
	// 		})
	// 		if(data.role == "admin"){
	// 			alert("어드민이다!");
	// 		} else {
	// 			alert("어드민이 아니다!");
	// 		}
// 		}})
	
// 	})
</script>
</head> 
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	<div id="main-wrapper">
		<div id="content-wrap">
<<<<<<< HEAD
=======
<<<<<<< HEAD
		${mdto.role}
=======
>>>>>>> refs/heads/mypage
>>>>>>> refs/heads/newMaster
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
		${mdto.name}님, 로그인 환영!
		<input type="button" value="로그아웃" onclick="document.location.href='/logout'" />
	</div>
	</c:when>
</c:choose>
		
		</div>
	</div>

</body>
</html>