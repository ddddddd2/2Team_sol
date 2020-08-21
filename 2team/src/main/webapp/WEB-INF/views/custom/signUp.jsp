<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입 </title>
<!-- <link href="./resources/css/main.css" rel="stylesheet" type="text/css"> -->

<link href="./resources/css/custom/signUp/signUp.css" rel="stylesheet" type="text/css">

<script src="../resources/js/jquery.js"></script>
<script src="../resources/js/jquery-1.10.2.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script src="../resources/js/custom/signUp/signUp.js"></script>

</head>
<body>
	<form class="container" name="signUpForm" title="회원가입" method="post" action="/custom/signUpProc">
		<div class="logo">
			<a href="/"> <img src="../resources/image/custom/logo.gif" alt="" /> </a>
		</div>
		
		<div class="container-id">
			<div class="text-id"> 아이디 </div>
			<div class="box-id">
				<input type="text" title="아이디" name="id" id="id" placeholder="아이디를 입력하시오." >
			</div>

			<label id="id-error" class="error" for="id"></label>     
			       
			<div class="dup-fail-msg display-none"> 이미 사용중인 아이디 입니다.</div>
			<div class="dup-suc-msg display-none"> 사용 가능한 아이디 입니다.</div>
		</div>
				
		<div class="container-pw">
			<div class="text-pw"> 비밀번호 </div>
			<div class="box-pw">
				<input type="password" title="비밀번호" name="passwd" id="passwd" placeholder="비밀번호를 입력하시오." >
			</div>
		</div>
		
		<label id="pw-error" class="error" for="passwd"></label>
		
		<div class="container-pwcheck">
			<div class="text-pwcheck"> 비밀번호 확인 </div>
			<div class="box-pwcheck">
				<input type="password" title="비밀번호확인" name="passwdchk" id="passwdchk" placeholder="비밀번호를 입력하시오." >
			</div>
		</div>
		
		<label id="pwcheck-error" class="error" for="pwcheck"></label>
			
		<div class="container-name">			
			<div class="text-name"> 이름 </div>
			<div class="box-name">
				<input type="text" title="이름" name="name" id="name" />
			</div>
		</div>			
		
		<div class="container-gender">
            <div class="text-gender"> 성별 </div>
            <div class="box-gender">
                <select name="gender" id="gender">
                    <option value="">성별</option>
                    <option value="t">남자</option>
                    <option value="f">여자</option>
                </select>
            </div>
        </div>
		
		<div class="container-email">
			<div class="text-email">이메일</div>
			<div class="box-email">
				<input type="text" title="이메일" name="email" id="email" placeholder="abc @ gmail.com" >
			</div>
		</div>
		
		<div class="container-phone">
			<div class="text-phone"> 휴대전화번호 </div>
			<div class="box-phone">
				<input type="text" title="휴대전화번호" name="phone" id="phone" placeholder="010-1234-1234" >
			</div>
			<label id="phone-error" class="error" for="phone"></label>
		</div>
		<div class="container-button">
			<div class="box-button">			
				<button class="btn-submit"> 가입하기  </button>
			</div>
		</div>		
	</form>		
</body>
</html>