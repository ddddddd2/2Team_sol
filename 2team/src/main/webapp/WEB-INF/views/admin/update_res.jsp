<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/adminMain.css" />
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	<div id="main-wrapper">
		<div id="content-wrap">
			<div>
				<form name="form" method="GET" enctype="multipart/form-data">
				<table border="1" style="min-width:60%;">
					<tr><th colspan="2">매장 정보 수정</th></tr>
					<tr><td>매장명</td><td><input type="text" id="name" value="${resdto.name }" style="width:60%"/>&nbsp<button id="nameCheck">중복체크</button><span id="nameCheck2"></span></td></tr>
					<tr><td>주소</td><td><input type="text" id="addrText" value="${resdto.address1}"  style="width:60%"/>&nbsp<input type="button" id="addrCheck" value="중복 확인" /> <span id="addrCkR"></span></tr>
					
					<tr><td>연락처</td><td><input type="text" id="tel" value="${resdto.tel}" /></td></tr>
					<tr><td>영업시간</td><td><input type="text" id="hour1"  value="${resdto.hour}" /></td></tr>
					<!-- 이미지 파일이 등록되면 미리보기식으로 불러온다. -->
        			<tr><td colspan="2"><img id="foo" src="" style="max-width:100%"></td></tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<input type="submit" id="UsubmitBtn" value="등록">&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소">
						</td>
					</tr>
					<input type="hidden" id="no" value="${resdto.no}" >
				</table>
				</form>
			</div> <!-- 메인 컨텐츠 -->
		
		</div>
	</div>
<script type="text/javascript">
	
// 	let reader = new FileReader();
	
// 	reader.onload = (readerEvent) => {
// 	    document.getElementById("foo").setAttribute('src', readerEvent.target.result);
// 	};

// 	document.getElementById("file").addEventListener("change", (changeEvent) => {

//     let imgFile = changeEvent.target.files[0];
//     reader.readAsDataURL(imgFile);
    
//     fileUpload();
// 	})
</script>
<script type="text/javascript" src="../resources/js/adminIndex.js"></script>
<script src="../resources/js/admin/reg_store.js"></script>
</body>
</html>