<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/custom/sub.css">

<style type="text/css">

 .slide_wrap { position: relative; width: 900px; margin: auto; padding-bottom: 30px; } 
 .slide_box { width: 100%; margin: auto; overflow-x: hidden; } 
 .slide_content { display: table; float: left; width: 300px; height: 400px; }
 .slide_list div p {background-color: red;} 
</style>
<script type="text/javascript">
window.onload = function(){
	const slideList = document.querySelector('.slide_list'); // Slide parent dom
	const slideContents = document.querySelectorAll('.slide_content'); // each slide dom
	const slideBtnNext = document.querySelector('.slide_btn_next'); // next button
	const slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button
	const slideLen = slideContents.length; // slide length
	const slideWidth = 300; // slide width
	const slideSpeed = 300; // slide speed
	const startNum = 0; // initial slide index (0 ~ 4)
	slideList.style.width = slideWidth * (slideLen + 2) + "px";
	console.log	(slideLen);
	// Copy first and last slide
	let firstChild = slideList.firstElementChild;
	let lastChild = slideList.lastElementChild;
	let clonedFirst = firstChild.cloneNode(true);
	let clonedLast = lastChild.cloneNode(true);
	// Add copied Slides
	slideList.appendChild(clonedFirst);
	slideList.insertBefore(clonedLast, slideList.firstElementChild);
	slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";
	let curIndex = startNum; // current slide index (except copied slide)
	let curSlide = slideContents[curIndex]; // current slide dom
	curSlide.classList.add('slide_active');
	/** Next Button Event */
	slideBtnNext.addEventListener('click', function() {
		// 1, 2, 3 -> 0,1,2
	if (curIndex <= slideLen - 3) {
	slideList.style.transition = slideSpeed + "ms";
	slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 2)) + "px, 0px, 0px)";
	}
		// 4면
	if (curIndex === slideLen - 2) {
	setTimeout(function() {
	slideList.style.transition = "0ms";
	slideList.style.transform = "translate3d(-" + slideWidth + "px, 0px, 0px)";
	}, slideSpeed);
	curIndex = -1;
	}
	curSlide.classList.remove('slide_active');
	curSlide = slideContents[++curIndex];
	curSlide.classList.add('slide_active');
	});
	/** Prev Button Event */
	slideBtnPrev.addEventListener('click', function() {
		if (curIndex === 0) {
		curIndex = slideLen-1;
		}
		if (curIndex >= 0) {
		slideList.style.transition = slideSpeed + "ms";
		slideList.style.transform = "translate3d(-" + (slideWidth * curIndex) + "px, 0px, 0px)";
		}
	curSlide.classList.remove('slide_active');
	curSlide = slideContents[curIndex];
	curSlide.classList.add('slide_active');
	--curIndex;
	});
	

	}
</script>
</head>
<body>



	<!-- top 영역 시작-->
	<!-- top 영역 끝 -->

	<div id="content-wrapper" style="position:absolute; width: 100%; height:auto;">
		<!-- 	<div id="category-menu" style=" background-color:aqua;  width:20%; float:left; height: 100%; margin:0; padding:0;"> -->
		<!-- 		<ul style="list-style-type:none;"> -->
		<!-- 			<a href="#" display:="" block;=""><li>한식</li></a> -->
		<!-- 			<a href="#" display:="" block;=""><li>일식</li></a> -->
		<!-- 			<a href="#" display:="" block;=""><li>중식</li></a> -->
		<!-- 			<a href="#" display:="" block;=""><li>양식</li></a> -->
		<!-- 			<a href="/" display:="" block;=""><li>카페</li></a> -->
		<!-- 		</ul> -->
		<!-- 	</div> -->
		<div id="content" >
		

			<div id="map" style="height: 400px; weight: auto; border: 1px solid;" >
				<img src="../resources/image/sub1/map.jpg">
				<!-- 			<div>지도(카테고리 기능 추가 구현 예정)</div> -->
			</div>

			<!-- 카드 형태로 3개만 구현하고 나머지는 슬라이드 -->
			<div id="list" >지도 Api 음식점
				리스트</div>

			<div id="list2" style="width: auto; height: 297px; text-align: left;">
				

				<div id="list2-1" style="float: left; display: inline; height: 100%; width: 40%;">
<%-- 					<c:forEach var="tdto" items="${tdto}" > --%>

					<c:forEach var="i" begin="0" end="10">
					<div style="width: 100%; background-color: yellow; height: 20%; box-sizing: border-box;">
						<a href="#" >${tdto.get(i).name}</a>
					</div>
					</c:forEach>
					
<%-- 				<c:forEach var="i" begin="0" end="3"> --%>
<%--   					  <p><c:out value="${tdto.get(i).name}" /></p> --%>
<%-- 				</c:forEach> --%>
				</div>
				<div id="list2-2" style="float: left; display: inline; height: 50%; width: 20%; background-color: pink">
					<a href="http://duckbap.com/detail?res_no=${tdto.get(0).no}" target='_blank'><img src="../resources/image/sub1/don200.jpg" style="width: 100%; height: 100%; vertical-align: middle;"  >
					</a> <!-- target='_blank' 새창띄우기 -->
				</div>
				
				<div id="list2-3"
					style="float: left; display: inline; height: 100%; width: 39%;">
				<p>주소 : ${tdto.get(0).address1}</p> 
				<p>연락처 : ${tdto.get(0).tel}</p>
				<a href="http://duckbap.com/detail?res_no=${tdto.get(0).no}" target='_blank'> "http://duckbap.com/detail?res_no=${tdto.get(0).no}" </a> <!-- ? 파라미터값 --> 
				<p> 아아</p>
				</div>
			</div>
			

			<div id="recom">
				
				<div style="height: 10%;">검색 키워드와 관련된 추천 맛집</div>
					<div id="content-wrap">
						<div class="slide_wrap">
							<div class="slide_box">
								<div class="slide_list clearfix" style="text-align: center;">
									<div class="slide_content slide01">
										<div style="float: left; width: 100%; height: 80%">
											<img src=../resources/image/sub1/han300.jpg>
										</div>
									<div style="float: left; width: 100%; height: 20%">한식</div>
									</div>
					<!-- 한식 글귀(제목)-->
					<div class="slide_content slide02" >
						<div style="float: left; width: 100%; height: 80%">
							<img src="../resources/image/sub1/han300.jpg">
						</div>
							<div style="float: left; width: 100%; height: 20%">양식</div>
						</div>
						<div class="slide_content slide03">
							<div style="float: left; width: 100%; height: 80%">
								<img src="../resources/image/sub1/han300.jpg">
							</div>
							<div style="float: left; width: 100%; height: 20%">분식</div>

						</div>

						<div class="slide_content slide04">
						<div style="float: left; width: 100%; height: 80%">
							<img src="../resources/image/sub1/han300.jpg">
						</div>
						<div style="float: left; width: 100%; height: 20%">좝</div>

						</div>
					
					
						<div class="slide_content slide05">
						<div style="float: left; width: 100%; height: 80%">
							<img src="../resources/image/sub1/han300.jpg">
						</div>
						<div style="float: left; width: 100%; height: 20%">좝</div>
						</div>

					</div>
					<!-- // .slide_list -->
					</div>
					<!-- // .slide_box -->
				<div class="slide_btn_box" style="text-align: center;">
				<button type="button" class="slide_btn_prev">이전</button>
				<button type="button" class="slide_btn_next">다음</button>
				</div>
					
				<!-- // .slide_wrap -->
					<!-- // .container -->
					
				<!-- // .slide_btn_box -->
				<ul class="slide_pagination"></ul>
				
				</div>
				</div>
				
				<!--  recom 끝 -->
				</div>
				<!-- // .slide_pagination -->
				<ul class="slide_pagination"></ul>
				</div>
				<!-- 	content 끝 -->

			</div>
			<!-- // .slide_list -->
	
	<!-- container 끝 -->

	<script>
	
	</script>


</body>
</html>