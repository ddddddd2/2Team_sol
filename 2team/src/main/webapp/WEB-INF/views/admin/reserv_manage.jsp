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
	var sv = document.getElementById("searchBar").value;
	var temp='${mdto.get(2).getMem_name()}';
	console.log(temp);
	alert(temp);
// 	var paramVal=
}

</script>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	<div id="main-wrapper">
		<div>
		<select name="searchSelectBox">
			<option value="">검색 옵션</option>
			<option value="name">회원이름</option>
			<option value="email">매장명</option>
			<option value="phone">회원아이디</option>
		</select>
		<input type="text" name="searchBar" id="searchBar" placeholder="예약내역조회" >
		<button id="searchBtn" onClick="search()">검색</button></div>
		
		<div id="content-wrap">
		<table border="1">
			<tr>
				<td>예약번호</td>
				<td>예약자</td>
				<td>매장명</td>
				<td>결제금액</td>
				<td>예약상태</td>
			</tr>
			<tr>
				<td>1</td>
				<td>기덕</td>
				<td>기덕식당</td>
				<td>20000</td>
				<td>완료</td>
			</tr>
		</table>
		</div>
	</div>
	
</body>
</html>