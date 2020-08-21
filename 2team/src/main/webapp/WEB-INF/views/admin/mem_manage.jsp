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
		<div id="test" style="width:30px;height:30px;background-color:gold" onclick="getLocation()"></div>
		<div id="test2"></div>
		<div id="search">
			<form name="form1" method="get" action="${path}/admin/mem_manage">
				<select id="searchSelectBox" name="searchOption">
					<option value="">검색 옵션</option>
					<option value="name" <c:out value="${map.searchOption == 'name'?'selected':''}"/>>이름</option>
					<option value="email" <c:out value="${map.searchOption == 'email'?'selected':''}"/>>이메일</option>
					<option value="phone" <c:out value="${map.searchOption == 'phone'?'selected':''}"/>>연락처</option>
				</select>
				<input type="text" name="keyword" id="searchBar" placeholder="회원 검색" value="${map.keyword}" >
			<input type="button" id="searchBtn" onClick="search()" value="검색">
			</form>
		</div>
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>등급</td>
				<td>아이디</td>
				<td>이름</td>
				<td>이메일</td>
				<td>연락처</td>
				<td>성별</td>
				<td>공개동의여부</td>
			</tr>
			<c:choose>
				<c:when test="${mdto.size()==0}">
				<tr>
					<td colspan="8">어라 아무리 찾아도 없는뎁쇼?</td>
				</tr>
				</c:when>
				<c:when test="${mdto.size()!=0}">
					<c:forEach var="mdto" items="${mdto}">
						<tr>
						<td>${mdto.no}</td>
						<td>${mdto.grade_name}</td>
						
						
						<td>${mdto.id}</td>
						<td>${mdto.name}</td>
						<td>${mdto.email}</td>
						<td>${mdto.phone}</td>
						<td>${mdto.gender}</td>
						<td></td>
					</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		</div>
	</div>
<script type="text/javascript" src="../resources/js/map.js"></script>
</body>
</html>