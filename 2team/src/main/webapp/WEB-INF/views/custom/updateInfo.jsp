<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<title>마이 페이지</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="format-detection" content="telephone=no"/>
	<script src="./resources/js/jquery-1.10.2.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> <!-- font-family:'NanumSquare', sans-serif; -->
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="./resources/css/index/base.css" rel="stylesheet" type="text/css" />
	<link href="./resources/css/index/common.css" rel="stylesheet" type="text/css" />
	<link href="./resources/css/index/index.css" rel="stylesheet" type="text/css" />
	
</head>
<body>

<div id="wrapper" style="position: absolute; width: 100%; height: auto;"><!-- 전체 div 시작 -->
<div>
<jsp:include page="header_bar.jsp" />
</div>
<div>
	<jsp:include page="menu_bar.jsp" />
</div>
	<div id="myPro" style="width: 100%; height:1200px; clear:both;">	
<div>
	<jsp:include page="side_bar.jsp" />
</div>
	<!-- 예약 내역 시작 -->
	<div id="profile" style="float: left; width: 80%; height: 300px;">
			<div id="profileTitle" style="background-color: pink; width: 15%; height: 40px;">
				<p id="commomBar">프로필 설정</p>
			</div>
			<!-- 내용 시작 -->
		<div id="content" style=" width: 75%; height:40px; ">
		<form name="updateForm" method="POST" action="updateInfoPro">
			<div class="content" style="float: left; background-color: white; width: 35%; height:200px;">
					<p>닉네임</p>
			</div>	
			<div class="content" style="float: left; background-color: white; width: 65%; height:200px;">
					<p id="owenoback1">
						<c:forEach var="mdto" items="${mdto}">
						<input id="nick_name" type="text" name="nick_name" size="10" value="${mdto.nick_name}">
<!-- 					<button type="button" class="btn">닉네임 중복 확인</button> -->
					</p>
					<p id="owenoback">
						한글 1~10자, 영문 대소문자 2~20자 
						<br/>숫자를 사용할 수 있습니다.(혼용가능)
						<br/>중복되지 않은 별명으로 변경해주세요.
					</p>
			</div>
			<div class="content" style="float: left; background-color: white; width: 35%; height:200px;">
					<p>이메일</p>
			</div>
			<div class="content" style="float: left; background-color: white; width: 65%; height:200px;">
					<p id="emailInput">
						<input id = "email" type="text" name="email" size="10" value="${mdto.email}">
<!-- 						<button type="button" onclick="verifyEmail()" >중복 확인</button> -->
<!-- 						<button type="button" class="btn">중복 확인</button> -->
					</p>
					<p id="emailExplain">
						영문 대소문자, 숫자를 사용하여 4~15자
					<br/>중복되지 않은 이메일 주소로 변경해주세요
					</p>
			</div>
			<div class="content" style="float: left; background-color: white; width: 35%; height:200px;">
					<p>휴대전화</p>
			</div>	
			<div class="content" style="float: left; background-color: white; width: 65%; height:200px;">
					<p id="phoneInput">
					<input id = "phone" type="text" name="phone" size="20" value="${mdto.phone}">
					</c:forEach>
<!-- 					<label id="phone_check"></label> -->
<!-- 					<button type="button" onClick="verifyPhone()">번호 중복 확인</button> -->
<!-- 					<button type="button" class="btn">번호 중복 확인</button> -->
					</p>
					<p id="phoneExplain">
						  숫자만 입력하세요
					<br/>중복되지 않은 번호를 변경해주세요
					</p>
			</div>
			
			<div class="content" style="float: left; background-color: white; width: 35%; height:200px;">
					<p>비밀번호 변경</p>
			</div>
			
<!-- 			<form name="form">				 -->
			<div class="content" style="float: left; background-color: white; width: 65%; height:200px;">
				<table>
					<tr class="register" height="30">
					    <td width="5%" align="center">*</td>
					    <td width="15%">비밀번호</td>
					    <td><input type="password" name="wUserPW" id="pw" onchange="isSame()" /></td>
					</tr>
					<tr class="register" height="30">
					    <td width="5%" align="center">*</td>
					    <td width="15%">비밀번호 확인</td>
					    <td><input type="password" name="wUserPWConfirm" id="pwCheck" onchange="isSame()" />&nbsp;&nbsp;<span id="same"></span></td>
					</tr>
				</table>
					
<!--			<p>비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 			<input type="password" name="pw" id="pw" size="10"> -->
<!-- 			<label id="pwcheck-error" class="error" for="pw"></label> -->
<!-- 			<br>비밀번호 확인 -->
<!-- 			<input type="password" name="pwcheck" id="pwcheck" size="10"> -->
<!-- 			<label id="pwcheck-error" class="error" for="pwcheck"></label> -->
<!-- 			</p> -->
			</div>
<!-- 			</form> -->
			
			<div class="content" style="float: left; background-color: white; width: 35%; height:200px;">
					<p>나의 활동 공개</p>
			</div>	
			<div class="content" style="float: left; background-color: white; width: 65%; height:200px;">
					<p id="private">
						공개<input type="radio" name="radiocheck" value="open" checked>
						비공개<input type="radio" name="radiocheck" value="private">
					</p>
					<p>
						<br>나의 예약 내역, 리뷰, 즐겨찾기를 상대방에게 공개 여부를 설정해 주세요.
					</p>
			</div>	
		<div id="ok" style="width: 20%">
			<br>
			<input type="submit" value="수정">
			<input type="reset" value="취소">
		</div>
		</form>
		</div>
	</div>
	<!-- 1:1문의 끝    -->
	
	</div><!-- 첫 번째 큰 단락 끝 -->	
	</div><!--두 번째 큰 단락 끝 -->
<!-- 	</div>전체 div 끝 -->
</body>
</html>