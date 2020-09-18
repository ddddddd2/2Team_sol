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
	<link href="./resources/css/custom/index/base.css" rel="stylesheet" type="text/css" />
	<link href="./resources/css/custom/index/common.css" rel="stylesheet" type="text/css" />
	<link href="./resources/css/custom/index/index.css" rel="stylesheet" type="text/css" />
	<link href="./resources/css/custom/myPage.css" rel="stylesheet" type="text/css" />
</head>
<body>
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
			<div class="main-content">
			<div id="content-title">예약</div>
			<table id="content-content">
				<tr>
					<td>예약번호</td>
					<td>업체명</td>
					<td>예약 일자</td>
					<td>주문 금액</td>
					<td>기타</td>
					<td>결제 일자</td>
					<td>요청사항</td>
					<td>결제영수증</td>
				</tr>
				<c:forEach var="bdto" items="${bdto}">
					<tr> 
						<td>${bdto.NO}</td>
						<td>${bdto.NAME}</td>
				  		<td>${bdto.DATE1}</td>
				  		<td>${bdto.PRICE}</td>
				  		<td>${bdto.MEM_NO}</td>
				  		<td>${bdto.DATE2}</td>
				  		<td>${bdto.CONTENT}</td>
				  		<td>
				  		<c:choose>
							<c:when test="${bdto.RECEIPT_URL==null}">
								관리자 문의					
							</c:when>
							<c:otherwise>
						  		<a href="${bdto.RECEIPT_URL}" target="_black"><font style="font-weight: bold;">확인</font></a>
							</c:otherwise>
											  		
				  		</c:choose>
				  		</td>
<%-- 기존 취소처리에서 영수증 보여주는 것으로 대체되었음.		<td id="${bdto.NO}" onClick="cancel('${bdto.NO}')" style="cursor:pointer;">${bdto.STATUS}</td> --%>
					</tr>
 				</c:forEach>
			</table>
			</div>
			<!-- content 영역 끝 -->
	</div><!-- 첫 번째 큰 단락 끝 -->	<!--두 번째 큰 단락 끝 -->
	</div><!-- 전체 div 끝 -->
<script type="text/javascript">
window.onload  = function(){
	function cancel(no){
	
		var sval = document.getElementById(no).text();
		alert
		if(sval=='paid'){
			$.ajax({
				type:"POST",
				url:"/bookingCancel",
				data:{}
				
				
			})
		} else {
			alert("취소 가능한 상태가 아닙니다.")
		}		
	}
}
</script>
</body>
</html>