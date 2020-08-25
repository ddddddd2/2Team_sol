<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./resources/css/main.css" rel="stylesheet">
<script type="text/javascript" src="./resources/ja/mainscript.js"></script>
</head>
<body>
   <table>
   <tbody>
   <tr>
   <c:choose>
	   <c:when test="${sessionkey!=null}">
	      <th><a onclick="javascript:menuTrn('logout.do')">로그아웃</a></th>
	   </c:when>
	   <c:when test="${fn:length(sessionkey)==0}">
	      <th><a onclick="javascript:menuTrn(login.do)">로그인</a></th>
	   </c:when>
   </c:choose>
      <th><a>회원가입</a></th>
      <th><a>게시글리스트</a></th>
   </tr>
   </tbody>
   </table>
</body>
</html>