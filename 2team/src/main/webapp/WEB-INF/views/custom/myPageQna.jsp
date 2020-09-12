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
			<jsp:include page="side_bar.jsp" />
			<!-- content 영역 시작 -->
			<div id="main-content">
			<div id="content-title">1대1 문의</div>
			<table id="content-content">
				<tr>
					<td>문의 번호</td>
					<td>문의 유형</td>
					<td>내용</td>
					<td>작성일</td>
					<td>처리상태</td>
				</tr>
					<c:choose>
						<c:when test="${qdto.size()==0}">
						<tr>	
							<td>내용없음</td>
						</tr>	
						</c:when>			
						<c:when test="${qdto.size()!=0}">
							<c:forEach var="qdto" items="${qdto}">
						<tr>	
							<td>${qdto.no}</td>
							<td>${qdto.subject}</td>
							<td>${qdto.contents}</td>
							<td>${qdto.createdate}</td>							
							<td>${qdto.qnatype}</td>							
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