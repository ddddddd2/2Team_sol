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
	<link href="./resources/css/custom/index/base.css" rel="stylesheet" type="text/css" />
	<link href="./resources/css/custom/index/common.css" rel="stylesheet" type="text/css" />
	<link href="./resources/css/custom/index/index.css" rel="stylesheet" type="text/css" />
	<link href="./resources/css/custom/myPage.css" rel="stylesheet" type="text/css" />
	
</head>
<body>
<div id="wrapper" style="position: absolute; width: 100%; height: auto;"><!-- 전체 div 시작 -->
<div>
	<jsp:include page="top.jsp" />
</div>
<div>
	<jsp:include page="menu_bar.jsp" />
</div>
			<div id="myPro" style="width: 100%; height:1200px; clear:both;">	
<div>
	<jsp:include page="side_bar.jsp" />
</div>
			<!-- content 영역 시작 -->
		<div class="main-content">
		<div id="content-title">즐겨찾기</div>
		<div style="text-align:center;">
			<div id="favoriteList">
				<c:choose>
					<c:when test="${resdto.size()==0}">
						<div>없음</div>
					</c:when>
				<c:when test="${resdto.size()!=0}">
					<c:forEach var="resdto" items="${resdto}">
						<div>
							<div><img src="../upload/${resdto.no}.jpg"></div>
							<div>${resdto.name}</div>
						</div>
						
					</c:forEach>
				</c:when>
				</c:choose>
			</div>
		</div><!-- content 영역 끝 -->
<!-- 			<table> -->
			
<!-- 			<tr> -->
<!-- 				<th>즐겨찾기</th> -->
<!-- 			</tr> -->
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${resdto.size()==0}"> --%>
<!-- 					없음 -->
<%-- 				</c:when> --%>
<%-- 				<c:when test="${resdto.size()!=0}"> --%>
<%-- 					<c:forEach var="resdto" items="${resdto}"> --%>
<!-- 						<tr> -->
<%-- 							<td><img src="../upload/${resdto.no}.jpg"></td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<%-- 							<td>${resdto.name}</td> --%>
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<%-- 				</c:when> --%>
<%-- 			</c:choose> --%>
<!-- 			</table> -->
	</div><!-- 첫 번째 큰 단락 끝 -->	<!--두 번째 큰 단락 끝 -->
	</div><!-- 전체 div 끝 -->
</div>
</body>
</html>