<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css"> <!-- font-family:'NanumSquare', sans-serif; -->
<link href="../resources/css/custom/index/base.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/custom/index/common.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/custom/index/index.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../resources/css/custom/sub1/sub1.css">
<script src="../resources/js/common.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=62d3ab0d1faddf540c257e322ccce48e&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"  >
window.onload = function(){
	const slideList = document.querySelector('.slide_list'); // Slide parent dom
	const slideContents = document.querySelectorAll('.slide_content'); // each slide dom
	const slideBtnNext = document.querySelector('.slide_btn_next'); // next button
	const slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button
	const slideLen = slideContents.length; // slide length
	const slideWidth = 205; // slide width
	const slideSpeed = 200; // slide speed
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

$(document).ready(function(){// 문서전체가 로딩되면 실행. 그래야 문서에 있는 요소들을 지정해서 가져올 수 있음.
//문서가 로딩 되지 않은 상태에서 #id 를 하면 아직 해당 id가 생성되지 않아 읽어올 수가 없다.


	$('#list #res_name').click(function(e){ // event 
		e.preventDefault();
		
        // 출력된 음식점 리스트 css 변경
        $('#list div').css("background","white");
		
        $(this).closest("div").css("background","yellow");
    
        
		$.ajax({
			type:"post",
			url:"/custom/getResInfo",
			data:{ no : this.dataset.no }, // a링크의 -> data-no = ${resdto.no} 값을 넘겨줌 
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "json",
			success : function(map){
		        //Ajax 성공
		      	alert("test")
		        console.log(map.avg)
		        console.log(map.resdto.name)
		        // sub1 의 음식점 상세정보 
		        $('#detail_info p#selected_name span').html(map.resdto.name);
		        $('#detail_info p#selected_address span').html(map.resdto.address1);
		        $('#detail_info p#selected_tel span').html(map.resdto.tel);
		        $('#detail_info p#selected_hour span').html(map.resdto.hour);
		        $('.txt_score').text(map.avg+"점 ("+map.count+")")
		        
		        var url = '/custom/sub2?no='+ map.resdto.no;
		        $('#detail_info button').on("click",function(){
		        	document.location.href=url;
		        });
		        	
		    
		    },error : function(){
		        //Ajax 실패시
		        alert("error")
		        
		    }
		});
		
	});
	
	// 문서가 처음 로딩될 때 음식점 리스트 의 첫 번째 요소가 선택됫다고 ... 
	$('#list #res_name').first().trigger("click");
});


</script>
  <script src="../resources/js/jquery-1.10.2.min.js"></script>
   <script src="../resources/js/custom/sub2/star.js"></script>
   <script src="../resources/js/custom/sub2/jquery.fancybox.js"></script>
   <script src="../resources/js/custom/sub2/sub2.js"></script>



</head>
<body id="main">

<div id="wrap">

	<!-- top 영역 시작-->
	<c:import url="top.jsp"/>
	<!-- top 영역 끝 -->
	
	<div id="sub1-body">
		<div id="content" >
			<div id="body1" style="width: auto; height: 350px; text-align: center;">
			
				<div id="maplist" style="width:100%; height:100%;">
			
					<div id="intro" style=" float:left; height :10%; width:25%;">지도 Api 음식점 리스트</div>
					
					<!-- 지도 wrap-->
					<div class="map_wrap">
						<!-- 지도 영역  --> 
						<div id="map" style="float:right; width:74.8%;height:100%;position:relative;overflow:hidden;">
						 	<ul id="category">
					       	 	<li id="c_entire" > 
					            <!-- <span class="category_bg bank"></span>  -->
					            	전체
					         	</li>       
					         	<li id="c_korean" > 
					           <!--  <span class="category_bg mart"></span>  -->
					            	한식
					         	</li>  
					         	<li id="c_chinese" > 
					           <!--  <span class="category_bg pharmacy"></span>  -->
					            	중식
					         	</li>  
					         	<li id="c_japanese" > 
					           <!--  <span class="category_bg oil"></span>  -->
					            	일식
					         	</li>  
					         	<li id="c_american" > 
					           <!--  <span class="category_bg oil"></span>  -->
					            	양식
					         	</li>  
					         	<li id="c_cafe" > 
 					           <!--  <span class="category_bg cafe"></span>  -->
					            	카페
					         	</li>     
					     	</ul>
						</div>
						
						<!-- 지도 음식점 리스트 영역 -->
						<div id="list" style="float: left; display: inline; height: 89.7%; width: 25%;">
							
							<c:forEach var="resdto" items="${reslist}">
							
							<div id="store${resdto.no}">
								<a id="res_name" href="#" data-no="${resdto.no}">${resdto.name}</a>
							</div> 
							
							<input type="hidden" class="res_address" value="${resdto.address1}" />
							<input type="hidden" class="res_c_no" value="${resdto.c_no}" />
							
							</c:forEach>
						</div>
					
					</div>
				</div>
			<!-- 카드 형태로 3개만 구현하고 나머지는 슬라이드 -->
			</div>


				<!--  2번째 줄 새로시작 -->
				
			<div id ="body2"style="width: auto; height: 350px; " >
				<div id="recom"> 선택된 음식점 </div>
				
				<div id="detail_image" style="float: left; display: inline; height: 90%; width: 40%; "> 					
					<a href="http://duckbap.com/detail?res_no=${resdto.get(0).no}" target='_blank'>
						<img src="../resources/image/custom/sub1/don200.jpg" style="width: 100%; height: 100%; vertical-align: middle;"  >
					</a><!-- target='_blank' 새창띄우기 -->
				</div>
				
				<div id="detail_info" 	style="float: left; display: inline; height: 90%; width: 30%; text-align:left;">
					<p id="selected_name">음식점 : <span>  </span></p>
					<p id="selected_address">주소 : <span>  </span></p>
					<p id="selected_tel">연락처 : <span> </span></p>
					<p id="selected_hour">운영시간 : <span> </span></p> 
					<button>상세보기</button>
					<div id="smollreview" style=" float:right;"></div>
				</div> 		<!-- detail_info3 끝 -->		
				<div id="review" style="float:right; float:right; width: 29.8%;height: 90%">
					
					
					<div class="review_rate">
         				<span class="num_rate"> ${avg}
         					<span class="txt_score">점</span>
         				</span>
         		
         				<span class="ico_star star_rate">
         					<span class="ico_star inner_star" style="width:${avg * 20}%"></span>	
         				</span>
         			</div>
				
				
				</div>	<!-- 59.8% -->
</div>	
		
		<!--  2번째 줄 끝 -->		
		<!-- 3번째 줄 시작  -->				
					<div id="body3">
						<div class="slide_wrap">
							<div class="slide_box">
								<div class="slide_list clearfix" style="text-align: center;">
									<div class="slide_content slide01">
										<div style="float: left; width: 100%; height: 80%">
											<img src="../resources/image/custom/sub1/han300.jpg" width="200" height="160">
										</div>
									<div style="float: left; width: 100%; height: 20%"> 
										<%-- <p>${cdto.get(0).name}</p> --%>
									</div>
									</div>
					<!-- 한식 글귀(제목)-->
						<div class="slide_content slide02" >
								<div style="float: left; width: 100%; height: 80%">
									<img src="../resources/image/custom/sub1/han300.jpg" width="200" height="160">
								</div>
							<div style="float: left; width: 100%; height: 20%"></div>
						</div>
						
						<div class="slide_content slide03">
								<div style="float: left; width: 100%; height: 80%">
									<img src="../resources/image/custom/sub1/han300.jpg" width="200" height="160">
								</div>
							<div style="float: left; width: 100%; height: 20%">분식</div>
						</div>

						<div class="slide_content slide04">
								<div style="float: left; width: 100%; height: 80%" >
									<img src="../resources/image/custom/sub1/han300.jpg" width="200" height="160">
								</div>
							<div style="float: left; width: 100%; height: 20%">좝</div>

						</div>
					
					
						<div class="slide_content slide05">
							<div style="float: left; width: 100%; height: 80%" >
								<img src="../resources/image/custom/sub1/han300.jpg" width="200" height="160">
							</div>
								<div style="float: left; width: 100%; height: 20%">좝</div>
						</div>

					<!-- // .slide_list -->
					</div>
					<!-- // .slide_box -->
				</div>
					<div class="slide_btn_box" style="text-align: center;">
						<button type="button" class="slide_btn_prev">이전</button>
						<button type="button" class="slide_btn_next">다음</button>
					</div>
					<ul class="slide_pagination"></ul>
				</div>
				<!-- 3번째줄 끝 -->
			</div>
				
				</div>
				<!-- 	sub1-body 끝 -->
			</div>
			<!-- // .slide_list -->
	
	<!-- container 끝 -->
	</div>
		<c:import url="bottom.jsp"/>
<script src="../resources/js/custom/sub1/sub1.js"></script>

<script>

/* 기존 map script */
/*
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

*/
</script>
</body>
</html>