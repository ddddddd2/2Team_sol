<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./resources/css/main.css" rel="stylesheet">
<script type="" src="http://ajax.gooleop"></script>
<title>게시판 추가실습</title>
</head>
<body>
   <c:import url="menu.jsp"></c:import>
   <div class="tb_wrap"></div>
   <div class="tb_box"></div>
      <span style="font-weight:bold">게시판</span>
   <div id="content">
      <c:import url="${viewNM}"/>
   </div>
   
   <table>
      <thead><tr><td>게시판 작성 </td></tr></thead>
   </table>

</body>
</html>