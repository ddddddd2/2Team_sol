<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resource/sub.css">
<title>Insert title here</title>
</head>
<body>
<!-- top 영역 시작-->
<!-- top 영역 끝 -->
<div id="container" >
	<div id="category-menu" style=" background-color: green ; width:20%; float:left; height: 993px; margin:0; padding:0; list-style-type:none;">
		<ul>
		
			<a href="container" display: block;><li>한식</li></a>
			<a href="container" display: block;><li>일식</li></a>
			<a href="container" display: block;><li>중식</li></a>
			<a href="container" display: block;><li>양식</li></a>
			<a href="container" display: block;><li>카페</li></a>
		</ul>
	</div>
	<div id="content" style=" width:80%; float:left;" >
	
		<div ></div>
		<div id="map" style="  height: 50px;  background-color: red; ">
		</div>
		
		
		
		<div id ="map" style=" height: 400px; weight:auto; background-color: gray; ">
			<div>지도</div>
		</div>
		
		<div id ="list" style="height:300px; weight:300px; background-color:wirte;">
			<div> 지도 Api 음식점 리스트</div>
			<div>
				<div style="float:left; width:33%;">test1</div>
				<div style="float:left; width:33%;">test2</div>
				<div style="float:left; width:33%;">test3</div>
			</div>
		</div>
		
		

	
		<!-- 카드 형태로 3개만 구현하고 나머지는 슬라이드 -->
		<div id="Store-slide" style=" width: 100%;  height: 300px;    background-color: purple; ">
			<div class="store-info"></div>
			<div class="store-info"></div>
			<div class="store-info"></div>
			<div>검색 키워드와 관련된 추천 맛집</div>
		</div>
		<div class="list-num">
			<div>&lt;1 ,2 , 3, 4 &gt;</div>
			
		</div>
	</div>


	</div> <!-- 	content 끝 -->
	</div> <!-- container 끝 -->
</body>
</html>