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
			<form name="form1" method="get" action="/admin/store_manage">
				<select id="searchSelectBox" name="searchOption">
					<option value="">검색 옵션</option>
					<option value="name" <c:out value="${map.searchOption == 'name'?'selected':''}"/>>이름</option>
					<option value="email" <c:out value="${map.searchOption == 'email'?'selected':''}"/>>이메일</option>
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
						<td>${resdto.no}</td>
						<td>${resdto.name}</td>
						<td>한식</td>
						<td>3</td>
						<td>4</td>
						<td>${resdto.address1}</td>
						<td>${resdto.hour}</td>
						<td>${resdto.tel}</td>
					</tr>
					</c:forEach>
				</c:when>
			</c:choose>
					<tr>
						<td colspan="9">
						<c:if test="${curPage>5}">
						<a href="${path}?curPage=${curPage-1}">이전</a>
						</c:if>
						<c:forEach var="i" begin="1" end="5">
						<a href="${path}?curPage=${Math.floor(curPage/5*5)+i}">${((curPage/5*5)+i)}</a>
						</c:forEach>
						<a href="${path}?curPage=${curPage+1}">${curPage+1}</a>
					<c:out value="${(curPage/5)}" />
					1,2,3,4,5</td>
					</tr>
		</table>
		</div>
	</div>
	
</body>
</html>