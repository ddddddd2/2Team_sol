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
<script type="text/javascript" src="../resources/js/adminIndex.js"></script>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" /> 
	</div>
	<div id="main-wrapper">
		<div id="content-wrap">
			<div>
				<form name="form" method="POST" enctype="multipart/form-data">
				<table border="1">
					<tr><th colspan="2">매장 신규 등록</th></tr>
					<tr><td>매장명</td><td><input type="text" id="name"><button id="nameCheck">중복체크</button><span id="nameCheck2"></span></td></tr>
					<tr><td>주소</td><td><input type="text" id="addrText"><input type="button" id="addrCheck" value="중복 확인"/></tr>
					<tr><td>시도명</td><td><input type="text"  style="width:500px;" id="si"  name="si" /></td></tr>
					<tr><td>시군구명</td><td><input type="text"  style="width:500px;" id="gu"  name="gu" /></td></tr>
					<tr><td>읍면동명</td><td><input type="text"  style="width:500px;" id="dong"  name="dong" /></td></tr>
					<tr><td>고객입력 상세주소</td><td><input type="text"  style="width:500px;" id="addrDetail"  name="addrDetail" /></td></tr>
					
					<tr><td>연락처</td><td><input type="text" id="tel"></td></tr>
					<tr><td>영업시간</td><td><input type="text" id="hour1"> ~ <input type="text" id="hour2"></td></tr>
					<tr><td>이미지 등록</td><td><input type="file" id="file" accept=".png, .jpg, .jpeg" name="fileName"></td></tr>
					<!-- 이미지 파일이 등록되면 미리보기식으로 불러온다. -->
        			<tr><td colspan="2"><img id="foo" src="" style="max-width:100%"></td></tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<input type="submit" id="submitBtn" value="등록">&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소">
						</td>
					</tr>
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
<script src="../resources/js/admin/reg_store.js"></script>
</body>
</html>