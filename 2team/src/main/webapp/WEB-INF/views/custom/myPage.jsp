<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
	window.history.forward();
	
			function noBack(){
				window.history.forward();
			}
			
	</script>
	

	
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
<script src="../resources/js/common.js"></script>
</head>
<body onload="noBack" onpageshow="if(event.persisted) noBack();" onunload="">
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
			<div style="float:left; width:80%; height:1200px; background-color:yellow;">
			
			<table>
			<tr><th>예약</th></tr>
<%-- 			<tr><td>${myAct.getFcnt()}</td></tr> --%>
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
				<tr>
					<td colspan="2">총 예약 수</td>
					<td>${revdto.size()}</td>
				</tr>
				<c:choose>
					<c:when test="${revdto.size()==0}">
					</c:when>
					<c:when test="${revdto.size()!=0}">
							<td colspan="6" style="text-align:right">총 리뷰 수${revdto.size()}</td>
 						<c:forEach var="revdto" items="${revdto}">
 							<tr> 
 								<td>${revdto.no}</td>
 								<td>${revdto.res_no}</td>
						  		<td>${revdto.mem_no}</td>
						  		<td>${revdto.mem_id}</td>
						  		<td>${revdto.date1}</td>
  								<td>${revdto.rating}</td>
 							</tr>
 						</c:forEach>
 					</c:when>
 				</c:choose>
			</table>
			<table>
			<tr><th>즐겨찾기</th></tr>
			<img src="../resources/image/custom/fish.PNG">
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