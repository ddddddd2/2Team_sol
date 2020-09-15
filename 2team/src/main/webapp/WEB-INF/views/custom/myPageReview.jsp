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
				<div id="content-title">리뷰</div>
			<table id="content-content" >				
				<tr>
					<td>리뷰 번호 </td>
					<td>식당 이름 </td>
					<td>내 용 </td>
					<td>좋아요 </td>
					<td>작성일 </td>
					<td>별점 </td>
				</tr>
				<c:choose>
					<c:when test="${revdto.size()==0}">
						<tr>
							<td colspan="2">사이즈가 0일 때</td>
							<td>${revdto.size()}</td>
						</tr>
					</c:when>
					<c:when test="${revdto.size()!=0}">
 						<c:forEach var="revdto" items="${revdto}">
 							<tr> 
 								<td>${revdto.no}</td>
 								<td>${revdto.res_no}</td>
						  		<td>${revdto.content}</td>
						  		<td>${revdto.like_cnt}</td>
						  		<td>${revdto.date1}</td>
  								<td>${revdto.rating}</td>
 							</tr>
 						</c:forEach>
 					</c:when>
 				</c:choose>
			</table>
			</div>
			<!-- content 영역 끝 -->
	</div><!-- 첫 번째 큰 단락 끝 -->	<!--두 번째 큰 단락 끝 -->
	</div><!-- 전체 div 끝 -->

</body>
</html>