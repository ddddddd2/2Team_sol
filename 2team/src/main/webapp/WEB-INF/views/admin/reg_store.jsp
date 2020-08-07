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
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	<div id="main-wrapper">
		<div id="content-wrap">
			<div>
				<form name="form1" method="post" action="/admin/index" enctype="multipart/form-data">
				<table border="1">
					<tr><th colspan="2">매장 신규 등록</th></tr>
					<tr><td>매장명</td><td><input type="text"><button>중복체크</button></td></tr>
					<tr><td>주소</td><td><input type="text" readonly="readonly"><button>주소찾기</button></tr>
					<tr><td>상세주소</td><td><input type="text"></td></tr>
					<tr><td>연락처</td><td><input type="text"></td></tr>
					<tr><td>영업시간</td><td><input type="text"></td></tr>
<!-- 					<tr><td>이미지 등록</td><td><input type="file" name="uploadFile" onchange="previewImage(this,'previewId')"></td></tr> -->
					<!-- 이미지 파일이 등록되면 미리보기식으로 불러온다. -->
					<tr><td colspan="2" style="text-align:center;"><input type="submit" value="등록">&nbsp;&nbsp;&nbsp;<input type="reset" value="취소"></td>
				</table>
					<input type="file" onchange="previewImage(this,'previewId')">
					<div id="previewId" style="width: 50px; height: 50px; color: black; font-size: 9pt; border: 2px solid black; position: absolute; left: 300px; top: 200px;"></div>
				</form>
			</div> <!-- 메인 컨텐츠 -->
		
		</div>
	</div>
	
</body>
</html>