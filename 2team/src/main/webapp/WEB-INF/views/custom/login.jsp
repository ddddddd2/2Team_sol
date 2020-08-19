<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 화면 </title>

<link href="../resources/css/custom/login/login.css" rel="stylesheet" type="text/css" />

<script src="../resources/js/jquery-1.10.2.min.js"></script>

</head>
<body>
	
	<form class="container" title="로그인 폼" method="post" action="/custom/loginProc">
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
				<input type="submit" title="로그인" value="로그인" >
			</div>
		</div>	
	</form>
	
</body>
</html>