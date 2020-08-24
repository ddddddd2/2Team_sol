<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
	<script type="text/javascript">
	$('document').ready(function(){
		$('#searchAction').click(function(e){
			e.preventDefault();
			var keyword = $('#keyword').val();
			var url = "/custom/sub1?keyword="+keyword
					document.location.href=url;
		})
		
	})
	</script>
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
		<header id="header">
			<div id="logo">
				<a href="/" ><img src="../resources/image/custom/logo.gif" alt="toplogo"></a>
			</div>
			<div id="space">
				<div id="search">
					<form method="post" action="">
						<div>
							<input type="text" id="keyword">
							<input type="submit" id="searchAction" value="검색">
						</div>
					</form>
				</div>
			</div>
				<ul class="lnb">
				<c:choose>
					<c:when test="${idKey == null}">
						<li class="select_list"><a href="/custom/login" class="selected">로그인</a>
							<ul class="select_sub">
								<li><a href="#">뭐나옴??</a></li>
								<li><a href="#">뭐나옴??</a></li>
							</ul>
						</li>
						<li><a href="/custom/signUp">회원가입</a></li>
					</c:when>
					<c:when test="${idKey != null}">
						<li class="select_list">
							<a href="/logout" class="selected">로그아웃</a>
							<ul class="select_sub">
								<li><a href="#">뭐나옴??</a></li>
								<li><a href="#">뭐나옴??</a></li>
							</ul>
						</li>

						<li><a href="/myPage">마이페이지</a></li>
					</c:when>
				</c:choose>
			</ul>

		</header><!-- //header -->

			<div id="container">
				<div id="visual">
					
				</div>
<!--		

				<div class="slogan">
					<p><span>쫑밥</span></p>
					<span>종로 최고의 맛집을 한번에</span>
				</div>
-->			
			<div id="m_contents">
				<ul>
					<li><a href="#">에디터의 추전<br><b>레스토랑</b></a></li>
					<li><a href="#">음식 종류별<br><b>레스토랑</b></a></li>
					<li><a href="#">테마별 추천<br><b>레스토랑</b></a></li>
					<li><a href="#">호텔<br><b>레스토랑</b></a></li>
				</ul>
			</div>
		</div><!-- //container -->

		<footer id="footer">
			<div class="layout">
				<p><img src="../resources/image/custom/logo.gif" alt="footerlogo"/></p>
					<strong>최고의 레스토랑을 즐기는 특별한 방법.<br>검색부터 예약까지 한번에, 덕밥.</strong>			
					<span>
						<strong> (주)대표이사:김기덕 </strong> 
						<strong> <span class="pipe"> 서울시 종로구 종로12길 15(관철동 13-13) </span> </strong>
						<strong> <span class="pipe"> 대표전화:9999-9999 </span> </strong>					
					</span>
					<span>Copyright &copy; 2020 덕밥 Ltd. All Rights Reserved.</span>
			</div>
		</footer>
	</div><!-- //wrap -->
</body>
</html>