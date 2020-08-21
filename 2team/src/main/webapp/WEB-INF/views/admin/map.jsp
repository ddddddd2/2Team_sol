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
<!-- <link rel="stylesheet" type="text/css" href="../resources/css/map.css" /> -->
<title>Insert title here</title>
<!-- <script type="text/javascript" src="../resources/js/adminIndex.js"></script> -->
</head> 
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	
	<div id="main-wrapper">
		<div>
			<select id="searchSelectBox" name="searchOption">
					<option value="">검색 옵션</option>
					<option value="name" <c:out value="${map.searchOption == 'name'?'selected':''}"/>>식당명</option>
					<option value="juso" <c:out value="${map.searchOption == 'juso'?'selected':''}"/>>주소</option>
			</select>
			<select id="jusobox" name="jusobox">
				<option value="">검색 옵션</option>
				<option value="seoul">서울</option>
				<option value="gg">경기</option>
			</select>
				<input type="text" name="keyword" id="searchBar" placeholder="회원 검색" value="${map.keyword}" >
			<input type="button" id="searchBtn" onClick="mapsearch()" value="검색">
		</div>
		<div id="content-wrap">
			<!-- 지도 영역 구현 -->
			<div id="map" style="width:100%;height:350px;"></div>
				
		</div>
	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ad9e8ce78bebca15d3857d8787ac8da4&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(la, lo), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨 	
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>
<script src="../resources/js/map.js"></script>
</body>
</html>