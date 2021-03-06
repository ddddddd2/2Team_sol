<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/adminMain.css" />
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/adminIndex.js"></script>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	<div id="main-wrapper">
		<div id="content-wrap">
		<div id="search"> 
			<form name="form1" method="get" action="${path}/admin/store_manage">
				<select id="searchSelectBox" name="searchOption">
					<option value="">검색 옵션</option>
					<option value="name" <c:out value="${map.searchOption == 'name'?'selected':''}"/>>이름</option>
					<option value="email" <c:out value="${map.searchOption == 'email'?'selected':''}"/>>이메일</option>
					<option value="tel" <c:out value="${map.searchOption == 'tel'?'selected':''}"/>>연락처</option>
				</select>
				<input type="text" name="keyword" id="searchBar" placeholder="매장 검색" value="${map.keyword}">
			<input type="button" id="searchBtn" onClick="search()" value="검색">
			</form>
			<div id="addStore"><a href="http://localhost:9999/admin/reg_store"><button>매장 추가</button></a></div>
		</div>
		<table border="1">
			<tr>
				<td>매장번호</td>
				<td>매장명</td>
				<td>카테고리</td>
				<td>평점</td>
				<td>리뷰수</td>
				<td>주소</td>
				<td>운영시간</td>
				<td>연락처</td>
			</tr>
			<c:choose>
				<c:when test="${sdto.size()==0}">
				<tr>
					<td colspan="9">아무것도 없는뎁쇼?</td>
				</tr>
				</c:when>
				<c:when test="${sdto.size()!=0}">
					<c:forEach var="sdto" items="${sdto}">
						<tr>
						<td>${sdto.no}</td>
						<td>${sdto.name}</td>
						<td>한식</td>
						<td>3</td>
						<td>4</td>
						<td>${sdto.address1}</td>
						<td>${sdto.hour}</td>
						<td>${sdto.tel}</td>
					</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		</div>
	</div>
	
</body>
</html>