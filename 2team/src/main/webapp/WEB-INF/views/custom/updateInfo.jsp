<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<script>
verifyEmail = function() {
     // 이메일 검증 스크립트 작성
     var emailVal = $("#email").val();

     var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){2,9}@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
     // 검증에 사용할 정규식 변수 regExp에 저장

     if (emailVal.match(regExp) != null) {
       alert('Good!');
     }
     else {
       alert('Error');
     }
   };
   
verifyPhone = function() {
     // 전화번호 검증 스크립트 작성
     var phoneVal = $("#phone").val();
//      /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; 
     var regExp = /^[0-9]{4,11}$/
     // 검증에 사용할 정규식 변수 regExp에 저장

     if (phoneVal.match(regExp) != null) {
       alert('Good!');
     }
     else {
       alert('Error');
     }
};

verifyPhone = function() {
     // 전화번호 검증 스크립트 작성
     var phoneVal = $("#phone").val();
//      /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; 
     var regExp = /^[가-힣A-Za-z0-9]{2,8}$/
     // 검증에 사용할 정규식 변수 regExp에 저장

     if (phoneVal.match(regExp) != null) {
       alert('Good!');
     }
     else {
       alert('Error');
     }
};

 verifyName = function() {
     // 닉네임 검증 스크립트 작성
     var nameVal = $("#nick_name").val();
//      /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; 
     var regExp = /^[가-힣A-Za-z0-9]{2,10}$/
     // 검증에 사용할 정규식 변수 regExp에 저장

     if (nameVal.match(regExp) != null) {
       alert('Good!');
     }
     else {
       alert('Error');
     }
}; 

function isSame() {   
   // document.폼네임.해당요소네임
    var pw = document.updateForm.wUserPW.value;
    var confirmPW = document.updateForm.wUserPWConfirm.value;
    if (pw.length < 6 || pw.length > 16) {
        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
        document.getElementById('pw').value=document.getElementById('pwCheck').value='';
        document.getElementById('same').innerHTML='';
    }
    if(document.getElementById('pw').value!='' && document.getElementById('pwCheck').value!='') {
        if(document.getElementById('pw').value==document.getElementById('pwCheck').value) {
            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
            document.getElementById('same').style.color='blue';
        }
        else {
            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('same').style.color='red';
        }
    }
}
</script>
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
	

</head>
<body>
<div id="wrapper" style="position: absolute; width: 100%; height: auto;"><!-- 전체 div 시작 -->
<div>
<jsp:include page="header_bar.jsp" />
</div>
<div>
	<jsp:include page="menu_bar.jsp" />
</div>
	<div id="myPro" style="width: 100%; height:1200px; clear:both;">	
<div>
	<jsp:include page="side_bar.jsp" />
</div><!-- 왼쪽 메뉴바 끝 -->
   <!-- 예약 내역 시작 -->
   <div id="profile" style="float: left; width: 80%; height: 300px;">
         <div id="profileTitle" style="background-color: pink; width: 15%; height: 40px;">
            <p id="commomBar">프로필 설정</p>
         </div>
         <!-- 내용 시작 -->
      <div id="content" style=" width: 75%; height:40px; ">
      <form name="updateForm" method="POST" action="updateInfoPro">
         <div class="content" style="float: left; background-color: white; width: 35%; height:200px;">
               <p>닉네임</p>
         </div>   
         <div class="content" style="float: left; background-color: white; width: 65%; height:200px;">
               <p id="owenoback">
                  <input id="nick_name" type="text" name="nick_name" size="10" value="${mdto.nick_name}">
                  <button type="button" onClick="verifyName()">닉네임 중복 확인</button>
               </p>
               
               <p id="owenoback">
                  	한글 1~10자, 영문 대소문자 2~20자 
                  <br/>숫자를 사용할 수 있습니다.(혼용가능)
                  <br/>중복되지 않은 별명으로 변경해주세요.
               </p>
         </div>
         <div class="content" style="float: left; background-color: white; width: 35%; height:200px;">
               <p>이메일</p>
         </div>
         <div class="content" style="float: left; background-color: white; width: 65%; height:200px;">
               <p id="owenoback">
                  <input id = "email" type="text" name="email" size="10" value="${mdto.email}">
                  <button type="button" onclick="verifyEmail()" >중복 확인</button>
               </p>
         </div>
         <div class="content" style="float: left; background-color: white; width: 35%; height:200px;">
               <p>휴대전화</p>
         </div>   
         <div class="content" style="float: left; background-color: white; width: 65%; height:200px;">
               <p id="owenoback">
               <input id = "phone" type="text" name="phoneNumber" size="20" value="${mdto.phone}">
               <label id="phone_check"></label>
               <button type="button" onClick="verifyPhone()">번호 중복 확인</button>
               </p>
         </div>
         
         <div class="content" style="float: left; background-color: white; width: 35%; height:200px;">
               <p>비밀번호 변경</p>
         </div>
         
		 <!--  <form name="form">  -->
         <div class="content" style="float: left; background-color: white; width: 65%; height:200px;">
            <table>
               <tr class="register" height="30">
                   <td width="5%" align="center">*</td>
                   <td width="15%">비밀번호</td>
                   <td><input type="password" name="wUserPW" id="pw" onchange="isSame()" /></td>
               </tr>
               <tr class="register" height="30">
                   <td width="5%" align="center">*</td>
                   <td width="15%">비밀번호 확인</td>
                   <td><input type="password" name="wUserPWConfirm" id="pwCheck" onchange="isSame()" />&nbsp;&nbsp;<span id="same"></span></td>
               </tr>
            </table>
               
<!--         <p>비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--          <input type="password" name="pw" id="pw" size="10"> -->
<!--          <label id="pwcheck-error" class="error" for="pw"></label> -->
<!--          <br>비밀번호 확인 -->
<!--          <input type="password" name="pwcheck" id="pwcheck" size="10"> -->
<!--          <label id="pwcheck-error" class="error" for="pwcheck"></label> -->
<!--          </p> -->
         </div>
<!--          </form> -->
         
         <div class="content" style="float: left; background-color: white; width: 35%; height:200px;">
               <p>나의 활동 공개</p>
         </div>   
         <div class="content" style="float: left; background-color: white; width: 65%; height:200px;">
               <p id="owenoback">
                  공개<input type="radio" name="radiocheck" value="open" checked>
                  비공개<input type="radio" name="radiocheck" value="private">
               </p>
               <p>
                  <br>나의 예약 내역, 리뷰, 즐겨찾기를 상대방에게 공개 여부를 설정해 주세요.
               </p>
         </div>   
      <div id="ok" style="width: 20%">
         <br>
         <input type="submit" value="수정">
         <input type="reset" value="취소">
      </div>
      </form>
      </div>
   </div>
   <!-- 1:1문의 끝    -->
   
   </div><!-- 첫 번째 큰 단락 끝 -->   
   </div><!--두 번째 큰 단락 끝 -->
   </div><!-- 전체 div 끝 -->
</body>
</html>