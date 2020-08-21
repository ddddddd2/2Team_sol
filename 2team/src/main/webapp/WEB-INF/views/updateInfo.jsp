<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- <script src="../resources/js/jquery-1.10.2.min.js"></script> -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="../resources/js/custom/custom.js"></script>
<!-- 배민 폰트 -->
<!-- <link href="style.css" rel="stylesheet" type="text/css"> -->

<meta charset="UTF-8">
<title>회원정보 변경 후</title>
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

/* verifyName = function() {
     // 닉네임 검증 스크립트 작성
     var nameVal = $("#name").val();
//      /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; 
     var regExp = /^[가-힣A-Za-z0-9]{2,10}$/
     // 검증에 사용할 정규식 변수 regExp에 저장

     if (nameVal.match(regExp) != null) {
       alert('Good!');
     }
     else {
       alert('Error');
     }
}; */

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
</head>
<body>
<!-- 마이페이지에서 개인정보 수정하는 페이지  -->

<div id="wrapper"
      style="position: absolute; width: 100%; height: auto;"><!-- 전체 div 시작 -->

      <!--    <form id="fm" name="fm"> -->
   <div id="menuBar" style="width: 100%; height: 200px;">
   <div id="myActivity" style="background-color: pink; width: 10%; height: 40px;">나의 활동</div>
      <div id="mymy" style="width: 50%; height: 200px;"><!-- 첫 번째 큰 단락 div 시작 -->
         <div id="my1"
            style="float: left; width: 32%; height: 200px;">
            <img src="../resources/image/businessman.png" width="100%" height="80%">
         </div>
         <div id="my2"
            style="float: left; width: 32%; height: 200px;">
            <p class="nickName2">김기덕</p>
            <p class="joinDay2">가입일 2020.07.13</p>
            <p class="joinDay2">등급 : 새싹</p>
            <p class="joinDay2"><button>사진 변경</button></p>
         </div>
         <div id="my3"
            style="float: left; width: 32%; height: 200px;">
            <br/>
            <p class="review">리뷰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;123</p>
            <p class="favorites">찜한매장&nbsp;&nbsp;&nbsp;&nbsp;55</p>
            <p class="reservation">예약횟수&nbsp;&nbsp;&nbsp;&nbsp;23</p>
         </div>
      </div><!-- -----------------첫 번째 큰 단락 div 끝 -------------------->
   </div>
   <div style="position: absolute; width: 100%; height: 500;">
      <div id="myPro" style="width: 100%; height: 500px;">
         <!-- 왼쪽 메뉴바 시작-->
         <div id="myEat" style="float: left;  
                  width: 20%; height: 1200px;">
            <div id="myEat2" style="width:60%; height: 200px; background-color:white;">
                  <p id="a" style="background-color:pink;">활동 내역</p>
                  <p id="aa">예약 내역 조회</p>
                  <p id="aa">리뷰</p>
                  <p id="aa">즐겨찾기</p>
            </div>      
            <div id="myEat2" style="width:60%; height: 200px; background-color:white;">
                  <p id="a" style="background-color:pink;">마이페이지</p>
                  <p id="aa">1:1문의</p>
                  <p id="aa">개인 정보 수정</p>
            </div>      
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
         
<!--          <form name="form">             -->
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