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
				<a href="/admin/reg_store"><button>매장 추가</button></a>
				</form>
		</div>
		<table border="1">
			<tr>
				<th>매장번호</th>
				<th>매장명</th>
				<th>카테고리</th>
				<th>평점</th>
				<th>리뷰수</th>
				<th>주소</th>
				<th>운영시간</th>
				<th>연락처</th>
				<th>정보수정</th>
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
						<td id="${resdto.no}">${resdto.no}</td>
						<td>
						<c:choose>
							<c:when test="${resdto.name.length() > 8}">
							${resdto.name.substring(0,8)}..
							</c:when>
							<c:otherwise>
							${resdto.name}
							</c:otherwise>
						</c:choose>
						</td>
						<td>한식</td>
						<td>3</td>
						<td>4</td>
						<td>
						<c:choose>
							<c:when test="${resdto.address1.length() > 20}">
							${resdto.address1.substring(0,20)}..
							</c:when>
							<c:otherwise>
							${resdto.address1}
							</c:otherwise>
						</c:choose>
						
						</td>
						<td>${resdto.hour}</td>
						<td>${resdto.tel}</td>
						<td><a href="/admin/update_res?no=${resdto.no}">수정</a></td>
					</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		</div>
<!-- 		<div id="page"> -->
<!-- 				<div>이전</div> -->
<%-- 			<c:forEach var="pdto" items="${pdto}"begin="${pdto.startList}" end="${pdto.startList+pdto.listSize}"> --%>
<%-- 				<div>${pdto.getStart+i}</div> --%>
<%-- 			</c:forEach> --%>
<!-- 				<div>이후</div> -->
<!-- 		</div> -->

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
</body>
</html>