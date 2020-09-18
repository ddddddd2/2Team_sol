<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/adminMain.css" />
<title>Insert title here</title>
<!-- <script type="text/javascript" src="../resources/js/adminIndex.js"></script> -->
<script type="text/javascript">
$(document).ready(function(){
	$('#btn').click(function(e){
		
		e.preventDefault();
		alert("testsetst")
		loginCk();
	})
});
function loginCk(e){
		var id = $('#id').val();
		var pw = $('#passwd').val();
		alert("test")
		// 입력 값 체크
		$.ajax({
			url:"/loginPro",
			data:{
				"id":id,
				"passwd":pw
				},
			type:"POST",
			dataType:"JSON",
			success : function(data){
				switch(data){
					case 0 : alert("로그인 실패. 아이디 비밀번호가 맞지 않습니다."); break;
					case 1 : alert("어드민 계정 맞음ㅇㅇ"); document.getElementById("form").innerHTML("${mdto.name}님의 월급일은 4일 남았습니다."); break;
					case 2 : alert("유저 아이딘데? 너 누구야");break;
				}		
			},
			error : function(){
				alert("에러 발생.")
			}
		})
}
</script>
</head> 
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	<div id="main-wrapper">
		<div id="content-wrap">
<c:choose>
	<c:when test="${mdto.role==null}">
		<div id="loginOk">
			로그인 후 이용해주세요.
		</div>
	</c:when>
	<c:when test="${mdto.role=='admin'}">
	<div id="loginOk">
		${mdto.name} 관리자 아이디로 접속했습니다.
	</div>
	</c:when>
	<c:when test="${mdto.role!='admin'}">
	<div id="loginOk">
		권한이 없는 유저 아이디로 접속했습니다.
	</div>
	</c:when>
</c:choose>
		
		</div>
	</div>

</body>
</html>