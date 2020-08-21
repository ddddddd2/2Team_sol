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
<div id="menuBar" style="width: 100%; height: 200px;">
	<div id="myActivity" style="background-color: pink; width: 10%; height: 40px;"><a href="/myPage">나의 활동</a></div>
		<div id="mymy" style="width: 50%; height: 200px;"><!-- 첫 번째 큰 단락 div 시작 -->
			<div id="my1" style="float: left; width: 32%; height: 200px;">
				<img src="../resources/image/businessman.png" width="100%" height="80%">
			</div>
			<div id="my2" style="float: left; width: 32%; height: 200px;">
			<table>
				<tr>
					<td>${mdto.name}</td>
				</tr>
				<tr>
					<td>${mdto.createdate}</td>
				</tr>
				<tr>
					<td>등급 : 새싹</td>
				</tr>
				<tr>
					<td><button>사진 변경</button></td>
				</tr>
			</table>
			</div>
			<div id="my3" style="float: left; width: 32%; height: 200px;">
				<br>
				<p class="review">리뷰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;123</p>
				<p class="favorites">찜한매장&nbsp;&nbsp;&nbsp;&nbsp;55</p>
				<p class="reservation">예약횟수&nbsp;&nbsp;&nbsp;&nbsp;23</p>
			</div>
		</div><!-- -----------------첫 번째 큰 단락 div 끝 -------------------->
</div>
</div>
<div id="myPro" style="width: 100%; height:1200px; clear:both;"><!-- 밑단 시작 -->	
<div>
<jsp:include page="side_bar.jsp" />
</div>
			<!-- content 영역 시작 -->
			<div style="float:left; width:80%; height:1200px; background-color:yellow;">
			<table>
			<tr><th>예약</th></tr>
				<tr>
					<td>예약 번호</td>
					<td>업체명</td>
					<td>예약 일자</td>
					<td>주문 금액</td>
					<td>기타</td>
					<td>결제 일자</td>
					<td>1대1 문의</td>
					<td>취소</td>
				</tr>
				<c:forEach var="bdto" items="${bdto}">
					<tr> 
						<td>${bdto.no}</td>
						<td>${bdto.res_no}</td>
				  		<td>${bdto.mem_no}</td>
				  		<td>${bdto.date1}</td>
					</tr>
 				</c:forEach>
			</table>
			<table border="1">
				<tr><th>리뷰</th></tr>
				<tr>
					<td>리뷰 번호</td>
					<td>식당 이름</td>
					<td>회원번호</td>
					<td>회원아이디</td>
					<td>작성일</td>
					<td>별점</td>
				</tr>
				<c:choose>
					<c:when test="${rdto.size()==0}">
						<tr>
							<td colspan="2">사이즈가 0일 때</td>
							<td>${rdto.size()}</td>
						</tr>
					</c:when>
					<c:when test="${rdto.size()!=0}">
							<td colspan="6" style="text-align:right">총 리뷰 수${rdto.size()}</td>
 						<c:forEach var="rdto" items="${rdto}">
 							<tr> 
 								<td>${rdto.no}</td>
 								<td>${rdto.res_no}</td>
						  		<td>${rdto.mem_no}</td>
						  		<td>${rdto.mem_id}</td>
						  		<td>${rdto.date1}</td>
  								<td>${rdto.rating}</td>
 							</tr>
 						</c:forEach>
 					</c:when>
 				</c:choose>
			</table>
			<table>
			<img src="../resources/image/goodfood.png">
			<tr>
				<td>식당이름</td>
			</tr>
			<c:choose>
				<c:when test="${fdto.size()==0}">
					없음
				</c:when>
				<c:when test="${fdto.size()!=0}">
					<c:forEach var="fdto" items="${fdto}">
						<tr>
							<td>${fdto.name}</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
			</table>
			<table>
			<tr><th>1대1 문의</th></tr>
				<tr>
					<td>문의 번호</td>
					<td>문의 유형</td>
					<td>내용</td>
					<td>작성일</td>
					<td>처리상태</td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${qdto.size()==0}">
							<td>내용없음</td>
						</c:when>			
						<c:when test="${qdto.size()!=0}">
							<c:forEach var="qdto" items="${qdto}">
						<tr>
							<td>${qdto.no}</td>
							<td>${qdto.subject}</td>
							<td>${qdto.contents}</td>
							<td>${qdto.createdate}</td>							
							<td>${qdto.qnatype}</td>							
						<tr>	
							</c:forEach>
						</c:when>			
					</c:choose>
				</tr>	
			</table>
			</div>
			<!-- content 영역 끝 -->
	</div><!-- 첫 번째 큰 단락 끝 -->	<!--두 번째 큰 단락 끝 -->
	</div><!-- 전체 div 끝 -->
</body>
</html>