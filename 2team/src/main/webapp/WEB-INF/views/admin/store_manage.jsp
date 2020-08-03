<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/adminMain.css" />
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/adminIndex.js"></script>
<script type="text/javascript">
function search(){
	
	var sv = document.getElementById("searchBar").value; // 검색어 가져오기
	var op = document.getElementById("searchSelectBox");
	var opop = op.options[op.selectedIndex].value; // 검색 옵션 가져오기
		if(sv==""){
			alert("입력값을 확인해주세요");
		} else{
			if(opop==""){
					alert("옵션을 선택해주세요");
			} else{
					document.form1.submit();
			}
		}
}
</script>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	<div id="main-wrapper">
		<div id="search"> 
		<form name="form1" method="get" action="${path}/admin/store_manage">
			<select id="searchSelectBox" name="searchOption">
				<option value="">검색 옵션</option>
				<option value="name" <c:out value="${map.searchOption == 'name'?'selected':''}"/>>이름</option>
<%-- 				<option value="email" <c:out value="${map.searchOption == 'email'?'selected':''}"/>>이메일</option> --%>
				<option value="phone" <c:out value="${map.searchOption == 'phone'?'selected':''}"/>>연락처</option>
			</select>
			<input type="text" name="keyword" id="searchBar" placeholder="매장 검색" >
		</form>
		<button id="searchBtn" onClick="search()">검색</button>
		<div id="addStore"><button>매장 추가</button></div>
		</div>
		
		<div id="content-wrap">
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
					<td>${sdto.address}</td>
					<td>${sdto.time}</td>
					<td>${sdto.phone}</td>
				</tr>
				</c:forEach>
			</c:when>
			</c:choose>
		</table>
		</div>
	</div>
	
</body>
</html>