<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/custom/sub1/sub1.css">

<style type="text/css">

 .slide_wrap { position: relative; width: 900px; margin: auto; padding-bottom: 30px; } 
 .slide_box { width: 100%; margin: auto; overflow-x: hidden; } 
 .slide_content { display: table; float: left; width: 300px; height: 400px; }
 .slide_list div p {background-color: red;} 
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=62d3ab0d1faddf540c257e322ccce48e&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"  >
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
		<div id="content" >
		
			<div id="list2" style="width: auto; height: 350px; text-align: center;">
			
				<div id="list2(0)" style="width:100%; height:100%;">
			
			<div id="list" style=" float:left; height :10%; width:25%;">지도 Api 음식점 리스트</div>
					<div id="map" style="float:right; width:74.8%;height:100%;"></div>
						<div id="list2-1" style="float: left; display: inline; height: 89.7%; width: 25%;">
<%-- 					<c:forEach var="tdto" items="${tdto}" > --%>
						<c:forEach var="i" begin="0" end="10">
						<div id="store${tdto.get(i).no}" style="width: 100%; background-color: yellow; height: 20%; box-sizing: border-box;">
						<a href="#" onClick="test(${tdto.get(i).no})" >${tdto.get(i).name}</a>
					</div>
					</c:forEach>
				</div>
				</div>
			<!-- 카드 형태로 3개만 구현하고 나머지는 슬라이드 -->
			</div>


				<!--  2번째 줄 새로시작 -->
				
			<div id ="restart"style="width: auto; height: 350px; " >
					<div id="recom">
							<div style="height: 10%; text-align: center;">검색 키워드와 관련된 추천 맛집</div>
					</div>
				<div id="list2-2" style="float: left; display: inline; height: 90%; width: 40%; ">
					<a href="http://duckbap.com/detail?res_no=${tdto.get(0).no}" target='_blank'><img src="../resources/image/custom/sub1/don200.jpg" style="width: 100%; height: 100%; vertical-align: middle;"  >
					</a> <!-- target='_blank' 새창띄우기 -->
				</div>
				
				<div id="list2-3" 	style="float: right; display: inline; height: 90%; width: 59.8%; text-align:left;">
				<p>주소 : ${tdto.get(0).address1}</p> 
				<p>연락처 : ${tdto.get(0).tel}</p>
				<a href="http://duckbap.com/detail?res_no=${tdto.get(0).no}" target='_blank'> "http://duckbap.com/detail?res_no=${tdto.get(0).no}" </a> <!-- ? 파라미터값 --> 
				<p> 아아</p>
				</div> 		<!-- list2-3 끝 -->			

		
		<!--  2번째 줄 끝 -->		
		</div>		
		
		
		<!-- 3번째 줄 시작  -->				
					<div id="content-wrap">
						<div class="slide_wrap">
							<div class="slide_box">
								<div class="slide_list clearfix" style="text-align: center;">
									<div class="slide_content slide01">
										<div style="float: left; width: 100%; height: 80%">
											<img src="../resources/image/custom/sub1/han300.jpg">
										</div>
									<div style="float: left; width: 100%; height: 20%"> 
										<p>${cdto.get(0).name}</p>
									</div>
									</div>
					<!-- 한식 글귀(제목)-->
					<div class="slide_content slide02" >
						<div style="float: left; width: 100%; height: 80%">
							<img src="../resources/image/custom/sub1/han300.jpg">
						</div>
							<div style="float: left; width: 100%; height: 20%">
								<p>${cdto.get(1).name}</p>
							
							</div>
						</div>
						<div class="slide_content slide03">
							<div style="float: left; width: 100%; height: 80%">
								<img src="../resources/image/custom/sub1/han300.jpg">
							</div>
							<div style="float: left; width: 100%; height: 20%">분식</div>

						</div>

						<div class="slide_content slide04">
						<div style="float: left; width: 100%; height: 80%">
							<img src="../resources/image/custom/sub1/han300.jpg">
						</div>
						<div style="float: left; width: 100%; height: 20%">좝</div>

						</div>
					
					
						<div class="slide_content slide05">
						<div style="float: left; width: 100%; height: 80%">
							<img src="../resources/image/custom/sub1/han300.jpg">
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
				
				<!-- 3번째줄 끝 -->
				</div>
				
				
				<!-- // .slide_pagination -->
				<ul class="slide_pagination"></ul>
				</div>
				<!-- 	content 끝 -->

			</div>
			<!-- // .slide_list -->
	
	<!-- container 끝 -->
<script>
//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch('이태원 맛집', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>
</body>
</html>