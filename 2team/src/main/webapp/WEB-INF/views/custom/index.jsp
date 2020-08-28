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
			var category = $('#header_category').val();
			var url = "/custom/sub1?keyword="+keyword+"&category="+category;
			
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
			<div id="m_contents">
				<ul>
					<li><a href="#"><p>에디터의 추전<br>레스토랑</b></p></a></li>
					<li><a href="#"><p>음식 종류별<br>레스토랑</b></p></a></li>
					<li><a href="#"><p>테마별 추천<br>레스토랑</b></p></a></li>
					<li><a href="#"><p>호텔<br>레스토랑</b></p></a></li>
				</ul>
			</div>
		</div><!-- //container -->
		
		<c:import url="bottom.jsp"/>
		
	</div><!-- //wrap -->
</body>
</html>