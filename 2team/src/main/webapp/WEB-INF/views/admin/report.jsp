<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/adminMain.css" />
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/adminIndex.js"></script>
<style type="text/css">
.slide_wrap { position: relative; width: 900px; margin: auto; padding-bottom: 30px; }
.slide_box { width: 100%; margin: auto; overflow-x: hidden; }
.slide_content { display: table; float: left; width: 300px; height: 400px; }
.slide_list div p {background-color: red;}
</style>
<script type="text/javascript">
window.onload = function(){
});
}
</script>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	<div id="main-wrapper">
		<div id="content-wrap">
			<h2 style="margin-top:300px;text-align:center;">올해 매출은 "0" 원 입니다.</h2>
		</div>
	</div>
	
</body>
</html>