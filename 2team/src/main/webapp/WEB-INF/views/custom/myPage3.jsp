<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="../teamexe2/js/jquery-1.10.2.min.js"></script>
<script src="../teamexe2/js/mainScript.js" charset="utf-8" type="text/javascript"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script src="../teamexe2/js/custom.js"></script>
<!-- 배민 폰트 -->
<link href="style.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>회원정보 변경 후</title>
</head>
<body>
<div id="wrapper"
		style="position: absolute; width: 100%; height: auto;"><!-- 전체 div 시작 -->

		<!-- 	<form id="fm" name="fm"> -->
	<div id="menuBar" style="width: 100%; height: 200px;">
	<div id="myActivity" style="background-color: pink; width: 10%; height: 40px;">나의 활동</div>
		<div id="mymy" style="width: 50%; height: 200px;"><!-- 첫 번째 큰 단락 div 시작 -->
			<div id="my1"
				style="float: left; width: 32%; height: 200px;">
				<img src="../images/businessman.png" width="100%" height="80%">
			</div>
			<div id="my2"
				style="float: left; width: 32%; height: 200px;">
				<br />
				<br />
				<p class="nickName2">김기덕</p>
				<br />
				<br />
				<p class="joinDay2">가입일 2020.07.13</p>
				<br />
				<br />
				<p class="joinDay2">등급 : 새싹</p>
				<br />
				<br />
				<p class="joinDay2"><button>사진 변경</button></p>
			</div>
			<div id="my3"
				style="float: left; width: 32%; height: 200px;">
				<br/>
				<p class="review">리뷰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;123</p>
				<p class="favorites">찜한매장&nbsp;&nbsp;&nbsp;&nbsp;55</p>
				<p class="reservation">예약횟수&nbsp;&nbsp;&nbsp;&nbsp;23</p>
			</div>
		</div><!-- -----------------첫 번째 큰 단락 div 끝 -------------------->
	</div>
	<div style="position: absolute; width: 100%; height: 500;">
		<div id="myPro" style="width: 100%; height: 500px;">	
			<!-- 왼쪽 메뉴바 시작-->
			<div id="myEat" style="float: left;  
						width: 20%; height: 1200px;">
				<div id="myEat2" style="width:60%; height: 200px; background-color:white;">
						<p id="a" style="background-color:pink;">활동 내역</p>
						<p id="aa">예약 내역 조회</p>
						<p id="aa">리뷰</p>
						<p id="aa">즐겨찾기</p>
				</div>		
				<div id="myEat2" style="width:60%; height: 200px; background-color:white;">
						<p id="a" style="background-color:pink;">마이페이지</p>
						<p id="aa">1:1문의</p>
						<p id="aa">개인 정보 수정</p>
				</div>		
			</div><!-- 왼쪽 메뉴바 끝 -->
	<!-- 예약 내역 시작 -->
	<div id="profile" style="float: left; width: 80%; height: 300px;">
			<div id="profileTitle" style="background-color: pink; width: 15%; height: 40px;">
				<p id="commomBar">프로필 설정</p>
			</div>
			<!-- 내용 시작 -->
		<div id="content" style=" width: 75%; height:40px; ">
			<div class="content" style="float: left; background-color: white; width: 35%; height:200px;">
					<p>닉네임</p>
			</div>	
			<div class="content" style="float: left; background-color: white; width: 65%; height:200px;">
					<p id="owenoback">
						<input type="text" name="name" size="10">&nbsp;&nbsp;
						<button type="button">중복 확인</button>
					</p>
					<p id="owenoback">
						한글 1~10자, 영문 대소문자 2~20자 
						<br/>숫자를 사용할 수 있습니다.(혼용가능)
						<br/>중복되지 않은 별명으로 변경해주세요.
					</p>
			</div>	
			<div class="content" style="float: left; background-color: white; width: 35%; height:200px;">
					<p>휴대전화</p>
			</div>	
			<div class="content" style="float: left; background-color: white; width: 65%; height:200px;">
					<p id="owenoback">
					010-<input type="text" name="phoneNumber1" size="5">-<input
						type="text" name="phoneNumber2" size="5">&nbsp;&nbsp;
					<button type="button">번호 중복 확인</button>
					</p>
					<p id="owenoback">
						휴대폰 번호 입력 후 인증번호 받기 
						<br/>버튼을 눌러 주세요.
						<br>휴대전화 문자메시지에서 인증번호를 확인 후
						<br/>인증번호 입력란에 인증번호를 입력하세요.
					</p>
			</div>
			
			<div class="content" style="float: left; background-color: white; width: 35%; height:200px;">
					<p>비밀번호 변경</p>
			</div>
			
			<form name="form">				
			<div class="content" style="float: left; background-color: white; width: 65%; height:200px;">
					<p>비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="password" name="pw" id="pw" size="10">
			<label id="pwcheck-error" class="error" for="pw"></label>
					<br>비밀번호 확인
						<input type="password" name="pwcheck" id="pwcheck" size="10">
			<label id="pwcheck-error" class="error" for="pwcheck"></label>
					</p>
			</div>
			</form>
			
			<div class="content" style="float: left; background-color: white; width: 35%; height:200px;">
					<p>나의 활동 공개</p>
			</div>	
			<div class="content" style="float: left; background-color: white; width: 65%; height:200px;">
					<p id="owenoback">
						공개<input type="radio" name="check" value="yes">
						비공개<input type="radio" name="check" value="yes">
					</p>
					<p>
						<br>나의 예약 내역, 리뷰, 즐겨찾기를 상대방에게 공개 여부를 설정해 주세요.
					</p>
			</div>	
		</div>
		<div id="ok" style="width: 20%">
			<br>
			<button type="button">확인</button>
			<button type="button">취소</button>
		</div>
	</div>
	<!-- 1:1문의 끝    -->
	
	</div><!-- 첫 번째 큰 단락 끝 -->	
	</div><!--두 번째 큰 단락 끝 -->
	</div><!-- 전체 div 끝 -->
</body>
</html>