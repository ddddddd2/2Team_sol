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
	
	// forEach가 끝나고 나서 실행하기 위해 load listener 붙임.
	document.getElementById("list2-1").addEventListener("load", first())
	// forEach가 끝난 후, ajax로 해당 아이디 가져와서 보내줌
	function first(){
		var id = $('#list2-1 div:first-child').attr("id");
		restaurant(id)
		$('#list2-1 div:first-child').css('background-color','red');
		
}
}
</script>

<script type="text/javascript">
// $(document).ready(function(){
	// 문서전체가 로딩되면 실행. 그래야 문서에 있는 요소들을 지정해서 가져올 수 있음.
//문서가 로딩 되지 않은 상태에서 #id 를 하면 아직 해당 id가 생성되지 않아 읽어올 수가 없다.
// 	console.log($('#list2-1').children[0]);
	/* 음식점 리스트 버튼 이벤트*/
	function restaurant(no){
		var no2 = no.substring(5)
		$.ajax({
			url: "/rlist",
			data:{
				"no":no2
			},
			type:"POST",
			dataType:"JSON",
			success : function(data){
				// data는 RestaurantDTO 형태로, no로 조회한 상점의 정보가 들어가있다.
				$('#res_name').text("업체명 : "+data.name);
				$('#address').text("주소 : "+data.address1);
				$('#tel').text("연락처 : "+data.tel);
				$('#hour').text("영업시간 : "+data.hour);
			}
		})
			// list2-1의 자식요소들의 background-color를 모두 노랑노랑
			$('#list2-1').children().css('background-color','yellow');
			//클릭한 요소(위에서 파라메터인no로 확인 가능)의 백그라운드 컬러 변경
			document.getElementById(no).style.backgroundColor = "red";
	}


// })





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
					<div class="map_wrap">
					<div id="map" style="float:right; width:74.8%;height:100%;position:relative;overflow:hidden;">
						 <ul id="category">
					        <li id="BK9" data-order="0"> 
					            전체
					        </li>       
					        <li id="MT1" data-order="1"> 
					            한식
					        </li>  
					        <li id="PM9" data-order="2"> 
					            중식
					        </li>  
					        <li id="OL7" data-order="3"> 
					            일식
					        </li>  
					        <li id="CE7" data-order="4"> 
					            카페
					        </li>  
					        <li id="CS2" data-order="5"> 
					            편의점
					        </li>      
					    </ul>
					    </div>
						<div id="list2-1" style="float: left; display: inline; height: 89.7%; width: 25%;">
						<c:forEach var="i" begin="0" end="10">
						<div id="store${resdto.get(i).no}" style="width: 100%; height: 20%; box-sizing: border-box;">
						<a href="#" onClick="restaurant('store${resdto.get(i).no}')" >${resdto.get(i).name}</a>
						</div>
						</c:forEach>
						</div>
					
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
					<a href="http://duckbap.com/detail?res_no=${resdto.get(0).no}" target='_blank'><img src="../resources/image/custom/sub1/don200.jpg" style="width: 100%; height: 100%; vertical-align: middle;"  >
					</a> <!-- target='_blank' 새창띄우기 -->
				</div>
				
				<div id="list2-3" 	style="float: right; display: inline; height: 90%; width: 59.8%; text-align:left;">
				<p id="res_name"></p>
				<p id="address"></p> 
				<p id="tel"></p>
				<p id="hour"></p>
				<a href="http://duckbap.com/detail?res_no=${resdto.get(0).no}" target='_blank'> "http://duckbap.com/detail?res_no=${resdto.get(0).no}" </a> <!-- ? 파라미터값 --> 
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
										${resdto.get(0).name}
									</div>
									</div>
					<!-- 한식 글귀(제목)-->
					
					
					<div class="slide_content slide02" >
						<div style="float: left; width: 100%; height: 80%">
							<img src="../resources/image/custom/sub1/han300.jpg">
						</div>
							<div style="float: left; width: 100%; height: 20%">
								${resdto.get(1).name}
							
							</div>
						</div>
						<div class="slide_content slide03">
							<div style="float: left; width: 100%; height: 80%">
								<img src="../resources/image/custom/sub1/han300.jpg">
							</div>
							<div style="float: left; width: 100%; height: 20%">
							${resdto.get(2).name}
							</div>

						</div>

						<div class="slide_content slide04">
						<div style="float: left; width: 100%; height: 80%">
							<img src="../resources/image/custom/sub1/han300.jpg">
						</div>
						<div style="float: left; width: 100%; height: 20%">
						${resdto.get(3).name}
						</div>

						</div>
					
					
						<div class="slide_content slide05">
						<div style="float: left; width: 100%; height: 80%">
							<img src="../resources/image/custom/sub1/han300.jpg">
						</div>
						<div style="float: left; width: 100%; height: 20%">
						${resdto.get(4).name}
						</div>
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
//마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
 contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
 markers = [], // 마커를 담을 배열입니다
 currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
 mapOption = {
     center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
     level: 5 // 지도의 확대 레벨
 };  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

//지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

//커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

//커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
//지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

//커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

//각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

//엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
 if (target.addEventListener) {
     target.addEventListener(type, callback);
 } else {
     target.attachEvent('on' + type, callback);
 }
}

//카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
 if (!currCategory) {
     return;
 }
 
 // 커스텀 오버레이를 숨깁니다 
 placeOverlay.setMap(null);

 // 지도에 표시되고 있는 마커를 제거합니다
 removeMarker();
 
 ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
 if (status === kakao.maps.services.Status.OK) {

     // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
     displayPlaces(data);
 } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
     // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

 } else if (status === kakao.maps.services.Status.ERROR) {
     // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
     
 }
}

//지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

 // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
 // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
 var order = document.getElementById(currCategory).getAttribute('data-order');


 for ( var i=0; i<places.length; i++ ) {

         // 마커를 생성하고 지도에 표시합니다
         var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

         // 마커와 검색결과 항목을 클릭 했을 때
         // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
         (function(marker, place) {
             kakao.maps.event.addListener(marker, 'click', function() {
                 displayPlaceInfo(place);
             });
         })(marker, places[i]);
 }
}

//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
 var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
     imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
     imgOptions =  {
         spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
         spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
         offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
     },
     markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
         marker = new kakao.maps.Marker({
         position: position, // 마커의 위치
         image: markerImage 
     });

 marker.setMap(map); // 지도 위에 마커를 표출합니다
 markers.push(marker);  // 배열에 생성된 마커를 추가합니다

 return marker;
}

//지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
 for ( var i = 0; i < markers.length; i++ ) {
     markers[i].setMap(null);
 }   
 markers = [];
}

//클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
 var content = '<div class="placeinfo">' +
                 '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

 if (place.road_address_name) {
     content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                 '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
 }  else {
     content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
 }                

 content += '    <span class="tel">' + place.phone + '</span>' + 
             '</div>' + 
             '<div class="after"></div>';

 contentNode.innerHTML = content;
 placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
 placeOverlay.setMap(map);  
}


//각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
 var category = document.getElementById('category'),
     children = category.children;

 for (var i=0; i<children.length; i++) {
     children[i].onclick = onClickCategory;
 }
}

//카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
 var id = this.id,
     className = this.className;

 placeOverlay.setMap(null);

 if (className === 'on') {
     currCategory = '';
     changeCategoryClass();
     removeMarker();
 } else {
     currCategory = id;
     changeCategoryClass(this);
     searchPlaces();
 }
}

//클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
 var category = document.getElementById('category'),
     children = category.children,
     i;

 for ( i=0; i<children.length; i++ ) {
     children[i].className = '';
 }

 if (el) {
     el.className = 'on';
 } 

} 

</script>
</body>
</html>