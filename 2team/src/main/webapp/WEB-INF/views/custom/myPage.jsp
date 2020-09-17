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
	<link href="../resources/css/custom/index/base.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/custom/index/common.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/custom/index/index.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/custom/myPage.css" rel="stylesheet" type="text/css" />
<script src="../resources/js/common.js"></script>
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
			<div id="main-content">
			<div class="content-title">예약</div>
			<table id="content-content">
				<tr>
					<td>예약 번호</td>
					<td>업체명</td>
					<td>예약 일자</td>
					<td>주문 금액</td>
					<td>기타</td>
					<td>결제 일자</td>
					<td>1대1 문의</td>
					<td>상태</td>
				</tr>
				<c:forEach var="bdto" items="${bdto}"  begin="0" end="2">
					<tr> 
						<td>${bdto.no}</td>
						<td>${bdto.res_no}</td>
				  		<td>${bdto.date1}</td>
				  		<td>${bdto.price}</td>
				  		<td>${bdto.mem_no}</td>
				  		<td>${bdto.date2}</td>
				  		<td>${bdto.content}</td>
				  		<td>${bdto.status}</td>
					</tr>
 				</c:forEach>
 				<tr>
 					<td colspan="8" style="text-align:right;"><button class="plus"><a href="../myPageBooking">더 보기</a></button></td>
 				</tr>
			</table>
				<div class="content-title">리뷰</div>
			<table id="content-content">
				<tr>
					<td>리뷰 번호</td>
					<td>식당 이름</td>
					<td>내 용</td>
					<td>좋아요</td>
					<td>작성일</td>
					<td>별점</td>
				</tr>
				
				<c:choose>
					<c:when test="${revdto.size()==0}">
					</c:when>
					<c:when test="${revdto.size()!=0}">
 						<c:forEach var="revdto" items="${revdto}" begin="0" end="2">
 							<tr> 
 								<td>${revdto.no}</td>
 								<td>${revdto.res_no}</td>
						  		<td>${revdto.content}</td>
						  		<td>${revdto.like_cnt}</td>
						  		<td>${revdto.date1}</td>
  								<td>${revdto.rating}</td>
 							</tr>
 						</c:forEach>
 						<tr>
 							<td colspan="6" style="text-align:right;"><button class="plus"><a href="../myPageReview">더 보기</a></button></td>
 						</tr>
 					</c:when>
 				</c:choose>
			</table>
			<div class="content-title">즐겨찾기</div>
		<div style="text-align:center; width:80%; margin: 0 auto;">
			<div id="favoriteList">
				<c:choose>
					<c:when test="${resdto.size()==0}">
						<div>없음</div>
					</c:when>
				<c:when test="${resdto.size()!=0}">
					<c:forEach var="i" begin="0" end="3">
						<div>
							<div>
								<a href="/custom/sub2?no=${resdto[i].no}">
									<img src="../upload/${resdto[i].no}.jpg">
								</a>
							</div>
							<div>${resdto[i].name}</div>
						</div>
					</c:forEach>
 					<div style="float: right; width: initial; margin-right: 23px;"><button class="plus"><a href="../myPageFavorite">더 보기</a></button></div>
				</c:when>
				</c:choose>
			</div>
			</div>
			<div class="content-title">1대1 문의</div>
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
							<c:forEach var="qdto" items="${qdto}" begin="0" end="2">
						<tr>	
							<td>${qdto.no}</td>
							<td>${qdto.subject}</td>
							<td>${qdto.contents}</td>
							<td>${qdto.createdate}</td>							
							<td>${qdto.qnatype}</td>							
						</tr>	
							</c:forEach>
						<tr>
		 					<td colspan="5" style="text-align:right;"><button class="plus"><a href="../myPageQna">더 보기</a></button></td>
		 				</tr>
						</c:when>			
					</c:choose>
			</table>
			</div>
			<!-- content 영역 끝 -->
	</div><!-- 첫 번째 큰 단락 끝 -->	<!--두 번째 큰 단락 끝 -->
	</div><!-- 전체 div 끝 -->
</body>
</html>