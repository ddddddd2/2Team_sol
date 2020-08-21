<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

</head>

<body>
<form name="loginForm" method="post" action="/">
<table>
<tr>
<td>아이디</td><td><input type="text" id ="id" name="id"></td>
<td>패스워드</td><td><input type="password" id = "passwd" name="passwd"></td>
</tr>
<tr>
<td>
<input type="button" id="btn" value="로그인">
</td>
</tr>
</table>
</form>
<script type="text/javascript">
$('#btn').click(function(){
	var id = document.getElementById("id").value;
	alert(id);
	$.ajax({
	url:"/",
	data:{
		"id":document.getElementById("id").value,
		"passwd":document.getElementById("passwd").value
		},
	type:"POST",
	dataType:"JSON"
	})
	.done(function(data){
		alert(data);
		if(data.role == "admin"){
			alert("어드민이다!");
		} else {
			alert("어드민이 아니다!");
		}
	})
	.fail(function(xhr, status, errorThrown) {
		alert("ajax 실패")
	})
	.always(function(xhr, status){
		alert("ajax 실행 완료.")
	})
})
</script>
</body>
</html>