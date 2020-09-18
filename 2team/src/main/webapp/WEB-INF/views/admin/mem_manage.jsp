<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/adminMain.css" />
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	<div id="main-wrapper">
		<div id="content-wrap">
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
				<th>회원번호</th>
				<th>등급</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>연락처</th>
				<th>성별</th>
				<th>공개동의여부</th>
			</tr>
			<c:choose>
				<c:when test="${mList.size()==0}">
				<tr>
					<td colspan="8">어라 아무리 찾아도 없는뎁쇼?</td>
				</tr>
				</c:when>
				<c:when test="${mList.size()!=0}">
					<c:forEach var="mList" items="${mList}">
						<tr>
						<td>${mList.no}</td>
						<td>${mList.grade_name}</td>
						<td>${mList.id}</td>
						<td>${mList.name}</td>
						<td>${mList.email}</td>
						<td>${mList.phone}</td>
						<td>${mList.gender}</td>
						<td></td>
					</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		</div>
		<!-- pagination{s} -->

	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pdto.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pdto.page}', '${pdto.range}', '${pdto.rangeSize}')">Previous</a></li>
			</c:if>
			<c:forEach begin="${pdto.startPage}" end="${pdto.endPage}" var="idx">
				<li class="page-item <c:out value="${pdto.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pdto.range}', '${pdto.rangeSize}')"> ${idx} </a></li>
			</c:forEach>
			<c:if test="${pdto.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pdto.range}','${pdto.range}', '${pdto.rangeSize}')" >Next</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination{e} -->
	</div>
<script type="text/javascript" src="../resources/js/adminIndex.js"></script>
<script type="text/javascript" src="../resources/js/map.js"></script>
</body>
</html>