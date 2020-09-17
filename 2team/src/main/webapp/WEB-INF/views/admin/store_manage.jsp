<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/adminMain.css" />
<script type="text/javascript" src="../resources/js/adminIndex.js"></script>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	<div id="main-wrapper">
		<div id="content-wrap">
		<div id="search"> 
			<form name="form1" method="get" action="/admin/store_manage">
				<select id="searchSelectBox" name="searchOption">
					<option value="">검색 옵션</option>
					<option value="name" <c:out value="${map.searchOption == 'name'?'selected':''}"/>>매장명</option>
					<option value="address1" <c:out value="${map.searchOption == 'tel'?'selected':''}"/>>주소</option>
					<option value="tel" <c:out value="${map.searchOption == 'tel'?'selected':''}"/>>연락처</option>
				</select>
				<input type="text" name="keyword" id="searchBar" placeholder="매장 검색" value="${map.keyword}">
			<input type="submit" id="searchBtn" onClick="search()" value="검색">
			</form>
			<div id="addStore"><a href="http://localhost:9999/admin/reg_store"><button>매장 추가</button></a></div>
		</div>
		<table border="1">
			<tr>
				<td>index</td>
				<td>매장번호</td>
				<td>매장명</td>
				<td>카테고리</td>
				<td>평점</td>
				<td>리뷰수</td>
				<td>주소</td>
				<td>운영시간</td>
				<td>연락처</td>
				<td>정보수정</td>
			</tr>
			<c:choose>
				<c:when test="${resdto.size()==0}">
				<tr>
					<td colspan="9">아무것도 없는뎁쇼?</td>
				</tr>
				</c:when>
				<c:when test="${resdto.size()!=0}">
					<c:forEach var="resdto" items="${resdto}" varStatus="vs">
					<tr>
						<td>${vs.index+1}</td>
						<td id="${resdto.no}">${resdto.no}</td>
						<td>${resdto.name}</td>
						<td>한식</td>
						<td>3</td>
						<td>4</td>
						<td>${resdto.address1}</td>
						<td>${resdto.hour}</td>
						<td>${resdto.tel}</td>
						<td><a href="/admin/update_res?no=${resdto.no}">수정</a></td>
					</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		</div>
	</div>
	
</body>
</html>