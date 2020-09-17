<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
response.setHeader("Cache-Control", "no-cache"); 
%>
<!DOCTYPE html>
<html>
<head>
<title>쫑밥</title>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="format-detection" content="telephone=no"/>
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> <!-- font-family:'NanumSquare', sans-serif; -->
	<link href="../resources/css/custom/index/base.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/custom/index/common.css" rel="stylesheet" type="text/css" />
	<link href="../resources/css/custom/index/index.css" rel="stylesheet" type="text/css" />
	<script src="../resources/js/jquery-1.10.2.min.js"></script>
	<script src="../resources/js/common.js"></script>
</head>  
<body id="main">
	<div id="skipNavi">
		<ul>
			<li>
				<a href="#container">본문 바로가기</a>
			</li>
		</ul>
	</div>  
	
	<div id="wrap">
		
			<c:import url="top.jsp"/>

			<div id="container">
				<div id="visual">
					
				</div>
<!--		

				<div class="slogan">
					<p><span>쫑밥</span></p>
					<span>종로 최고의 맛집을 한번에</span>
				</div>
-->			
		<div style="position:relative;height:300px;">
			<div id="m_contents">
				<ul>
					<li><a href="#"><img src="https://raw.githubusercontent.com/ddddddd2/2Team_sol/master/img/main4.png"></a></li>
					<li><a href="#"><img src="https://raw.githubusercontent.com/ddddddd2/2Team_sol/master/img/main2.png"></a></li>
					<li><a href="#"><img src="https://raw.githubusercontent.com/ddddddd2/2Team_sol/master/img/main3.png"></a></li>
					<li><a href="#"><img src="https://raw.githubusercontent.com/ddddddd2/2Team_sol/master/img/main1.png"></a></li>
				</ul>
			</div>
			<div id="m_contents_"></div>
			<div id="m_contents_dim">
				<ul>
					<li><span>한국이라면 역시 비빔밥!</span>
					<li><span>Welldone Plz</span>
					<li><span>짜장보다 맛있는 짬뽕</span>
					<li><span>이 시국 음식</span>
				</ul>
			</div>
		</div>
		</div><!-- //container -->
		
		<c:import url="bottom.jsp"/>
		
	</div><!-- //wrap -->
</body>
</html>