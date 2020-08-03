<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- 배민 폰트 -->
<link href="style.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body>
<!-- main 마이페이지  -->

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
				<div id="left" style="width:60%; height: 200px; background-color:white;">
						<p id="leftBar" style="background-color:pink;">활동 내역</p>
						<p id="leftContent">예약 내역 조회</p>
						<p id="leftContent">리뷰</p>
						<p id="leftContent">즐겨찾기</p>
				</div>		
				<div id="left" style="width:60%; height: 200px; background-color:white;">
						<p id="leftBar" style="background-color:pink;">마이페이지</p>
						<p id="leftContent">1:1문의</p>
						<p id="leftContent">개인 정보 수정</p>
				</div>		
			</div><!-- 왼쪽 메뉴바 끝 -->
	<!-- 예약 내역 시작 -->
	<div id="profile" style="float: left; width: 80%;">
			<div id="profileTitle" style="background-color: pink; width: 15%; height: 40px;">
				<p class="commonBar">예약 내역 조회</p>
			</div>
			<!-- 프로필 바 시작 -->
			<div id="lookupBar" style="background-color:#E5FFCC; width: 75%; ; 
			border-top:3px solid black; /* border-bottom:3px solid black; */ height:40px; ">
				<div class="lookupBar1" style="float: left; width: 40%; height:40px;">
					<p class="lookupTitle">식당 정보</p>
				</div>
				<div class="lookupBar1" style="float: left; width: 15%; height:40px;">
					<p class="lookupTitle">예약 일자</p>
				</div>
				<div class="lookupBar1" style="float: left; width: 15%; height:40px;">
					<p class="lookupTitle">예약 번호</p>
				</div>
				<div class="lookupBar1" style="float: left; width: 15%; height:40px;">
					<p class="lookupTitle">주문 금액</p>
				</div>
				<div class="lookupBar1" style="float: left; width: 15%; height:40px;">
					<p class="lookupTitle">기타</p>
				</div>
			</div>
			<!-- 프로필 바 끝 -->
			<!-- 내용 시작 -->
		<div id="content" style=" width: 75%; height:40px; ">
			<div id="content" style="float: left; background-color: white; width: 20%; height:200px;">
					<p id="foodPicture"><img src="../images/goodfood.png" width="95%" height="95%"></p>
			</div>	
			<div id="content" style="float: left; background-color: white; width: 20%; height:200px;">
					<p id="aaaa">육회한 연어(회기점)</p>
			</div>	
			<div id="content" style="float: left; background-color: white; width: 15%; height:200px;">
					<p id="aaaa">2020.07.29</p>
			</div>	
			<div id="content" style="float: left; background-color: white; width: 15%; height:200px;">
					<p id="aaaa">20200729123</p>
			</div>	
			<div id="content" style="float: left; background-color: white; width: 15%; height:200px;">
					<p id="aaaa">35000원</p>
			</div>	
			<div id="content" style="float: left; background-color: white; width: 15%; height:200px;">
					<p id="aaaa">2인분</p>
			</div>	
		</div><!-- 내용 끝 -->
	</div>	<!-- 예약 내역 끝 -->
	<!-- 즐겨찾기 시작 -->
	<div id="favorite" style="float: left; width: 80%; height: 300px;">
		<div id="favorite1" style="text-align:center; background-color: pink; width: 15%; ">
				<p id="commonBar" style="font-family: 'Jua', sans-serif; font-size:25px;">즐겨찾기</p>
		</div>
		<div id="content" style="border-top:3px solid black; background-color: white; width: 75%; height:200px; ">
			<div id="content" style="float: left; background-color: white; width: 25%; height:180px;">
					<p id="foodPicture"><img src="../images/goodfood.png" width="80%" height="80%"></p>
			</div>
			<div id="content" style="float: left; background-color: white; width: 25%; height:180px;">
					<p id="favorite3">식당 사진 육회한 연어</p>
					<p id="favorite3">서울시 동대문구~~</p>
			</div>	
			<div id="content" style="float: left; background-color: white; width: 25%; height:180px;">
					<p id="foodPicture"><img src="../images/goodfood.png" width="80%" height="80%"></p>
			</div>
			<div id="content" style="float: left; background-color: white; width: 25%; height:180px;">
					<p id="favorite3">식당 사진 육회한 연어</p>
					<p id="favorite3">서울시 동대문구~~</p>
			</div>	
		</div>
	</div>
	<!-- 즐겨찾기 끝    -->
	<!-- 1:1문의 시작 -->
	<div id="favorite" style="float: left; width: 80%; height: 300px;">
		<div id="favorite1" style="text-align:center; background-color: pink; width: 15%; ">
				<p id="commonBar" style="font-family: 'Jua', sans-serif; font-size:25px;">1:1 문의</p>
		</div>
		<div id="profileBar" style="background-color:#E5FFCC; width: 75%; 
			border-top: 3px solid black; border-bottom: 3px solid black; height: 40px; ">
			
				<div id="profileBar1" style="float: left; width: 15%; height:40px;">
					<p id="aaa">문의 유형</p>
				</div>
				<div id="profileBar2" style="float: left; width: 40%; height:40px;">
					<p id="aaa">내용</p>
				</div>
				<div id="profileBar3" style="float: left; width: 15%; height:40px;">
					<p id="aaa">작성일자</p>
				</div>
				<div id="profileBar4" style="float: left; width: 15%; height:40px;">
					<p id="aaa">주문 번호</p>
				</div>
				<div id="profileBar5" style="float: left; width: 15%; height:40px;">
					<p id="aaa">처리 상태</p>
				</div>
				<!-- ------- -->
				<div class="content" style="float: left; background-color: white; width: 15%; height:200px;">
					<p class="favorite_a">#</p>
				</div>	
				<div class="content" style="float: left; background-color: white; width: 40%; height:200px;">
					<p class="favorite_a">내용없음</p>
				</div>	
				<div class="content" style="float: left; background-color: white; width: 15%; height:200px;">
					<p class="favorite_a">#</p>
				</div>	
				<div class="content" style="float: left; background-color: white; width: 15%; height:200px;">
					<p class="favorite_a">#</p>
				</div>	
				<div class="content" style="float: left; background-color: white; width: 15%; height:200px;">
					<p class="favorite_a">#</p>
				</div>	
		</div>
	</div>
	<!-- 1:1문의 끝    -->
	<!-- 리뷰 시작 -->
	<div id="favorite" style="float: left; width: 80%; height: 300px;">
		<div id="favorite1" style="text-align:center; background-color: pink; width: 15%; ">
				<p id="commonBar" style="font-family: 'Jua', sans-serif; font-size:25px;">리뷰</p>
		</div>
		<div id="profileBar" style="background-color:#E5FFCC; width: 75%; 
			border-top:3px solid black; height:40px; ">
				<div id="profileBar1" style="float: left; width: 30%; height:40px;">
					<p id="aaa">식당 이름</p>
				</div>
				<div id="profileBar2" style="float: left; width: 70%; height:40px;">
					<p>내용</p>
				</div>
				<!-- ------- -->
				<div id="content" style="float: left; width: 30%; height:200px;">
					<p>#</p>
				</div>	
				<div id="content" style="float: left; width: 70%; height:200px;">
					<p>#</p>
				</div>	
		</div>
	</div><!-- 리뷰 끝    -->
		<div id="ok" style="width: 20%">
			<br>
			<button type="button">확인</button>
			<button type="button">취소</button>
		</div>
	</div><!-- 첫 번째 큰 단락 끝 -->	
	</div><!--두 번째 큰 단락 끝 -->
	</div><!-- 전체 div 끝 -->
</body>
</html>