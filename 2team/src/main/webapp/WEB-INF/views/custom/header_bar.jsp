<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<body id="main">
<div id="menuBar" style="width: 100%; height: 60px;">
	<div id="skipNavi">
		<ul>
			<li>
				<a href="#container">본문 바로가기</a>
			</li>
		</ul>
	</div>  
	
	
	<div id="wrap">
		<header id="header" style="background-color:black;">
   			 <a href="#" > <div id="logo"> <a href="/"> <img src="./resources/image/logo.gif" alt="toplogo"> </a> </div> </a>
				<div id="space" title="그냥 공백 처리용 /내용 없음"></div>
				<ul class="lnb">
				<c:choose>
					<c:when test="${idKey == null}">
						<li class="select_list"><a href="/custom/login" class="selected">로그인</a>
						<!-- 아직 사용하지 않는 메뉴 -->
							<ul class="select_sub">
								<li><a href="#">뭐나옴??</a></li>
								<li><a href="#">뭐나옴??</a></li>
						<!-- 아직 사용하지 않는 메뉴 -->
							</ul>
						</li>

						<li><a href="/custom/signUp">회원가입</a></li>
					</c:when>
					
					<c:when test="${idKey != null}">
						<li class="select_list">
							<a href="/custom/logout" class="selected">로그아웃</a>
						<!-- 아직 사용하지 않는 메뉴 -->
							<ul class="select_sub">
								<li><a href="#">뭐나옴??</a></li>
								<li><a href="#">뭐나옴??</a></li>
							</ul>
						<!-- 아직 사용하지 않는 메뉴 -->
						</li>

						<li><a href="/myPage">마이페이지</a></li>
					</c:when>
				</c:choose>
			</ul>

		</header><!-- //header -->
</div>
</div>
</body>