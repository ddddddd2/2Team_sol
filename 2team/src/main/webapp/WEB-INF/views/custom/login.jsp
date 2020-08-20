<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 화면 </title>
<link href="../resources/css/custom/login/login.css" rel="stylesheet" type="text/css" />
<script src="../resources/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#btn').click(function(e){
		e.preventDefault();
		var id = $('#mem_id').val();
		var passwd = $('#mem_passwd').val();
		$.ajax({
			url:"/loginPro",
			type : "POST",
			data:{
				"id" : id,
				"passwd" : passwd,
			},
			dataType:"JSON",
			success : function(data){
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
	<form class="container" title="로그인 폼" method="post" action="">
		<div class="logo">
			<a href="/"> <img src="../resources/image/custom/logo.gif" alt="" /> </a>
		</div>
				<div class="container-id">
			<div class="text-id"> 아이디 </div>
			<div class="box-id">
				<input type="text" title="아이디" name="id" id="mem_id" placeholder="아이디를 입력하시오." >
			</div>
		</div>
				
		<div class="container-pw">
			<div class="text-pw"> 비밀번호 </div>
			<div class="box-pw">
				<input type="password" title="비밀번호" name="passwd" id="mem_passwd" placeholder="비밀번호를 입력하시오." >
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