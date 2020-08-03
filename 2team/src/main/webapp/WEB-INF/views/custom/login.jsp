<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 화면 </title>
<script src="./resources/js/jquery-1.10.2.min.js"></script>
<style type="text/css">

	*{
		margin: 0;
		padding: 0;
	}
		
	body{
		background-color: rgb(245,246,247);
	}
	
	.container{
		width: 500px;
		margin: auto;
	}

	.logo{
		text-align: center;
		margin-top: 20px;
        }
        
    .logo>a{
		font-size: 35px;
		font-weight: bold;
        }
        
    .text-id, .text-pw{
		font-weight: bold;
	}

	.box-id, .box-pw{
	    height: 50px;
	    margin-top: 10px;
	    padding: 10px;
	    margin-bottom: 10px;
	    background-color: white;
	    border: rgb(218,218,218) 2px solid;
	    box-sizing: border-box;
	}
	
	.box-id>input, .box-pw>input{
		padding: 5px 5px;
		margin: auto;
		width: 100%;
		border: 2px solid rgb(218,218,218);
		box-sizing: border-box;
        font-weight: bold;
	}
	
	.box-button input{
		text-align: center;
		width: 100%;
		height: 50px;
		margin-top: 5px;
		border: 2px solid rgb(218,218,218);
		box-sizing: border-box;
		font-size: 20px;
		font-weight: bold;
	}

</style>
</head>
<body>
	
	<form class="container" title="로그인 폼" method="post" action="/custom/loginProc">
		<div class="logo">
			<a href=""> <img src="../resources/image/logo.gif" alt="" /> </a>
		</div>
				<div class="container-id">
			<div class="text-id"> 아이디 </div>
			<div class="box-id">
				<input type="text" title="아이디" name="mem_id" id="mem_id" placeholder="아이디를 입력하시오." >
			</div>
		</div>
				
		<div class="container-pw">
			<div class="text-pw"> 비밀번호 </div>
			<div class="box-pw">
				<input type="password" title="비밀번호" name="mem_passwd" id="mem_passwd" placeholder="비밀번호를 입력하시오." >
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