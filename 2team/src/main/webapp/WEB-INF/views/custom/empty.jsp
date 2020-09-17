<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link href="../resources/css/custom/index/base.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/custom/index/common.css" rel="stylesheet" type="text/css" />
<link href="../resources/css/custom/index/index.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../resources/css/custom/sub1/sub1.css">
<script src="../resources/js/common.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=62d3ab0d1faddf540c257e322ccce48e&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" >
window.onload = function(){
	const slideList = document.querySelector('.slide_list'); // Slide parent dom
	const slideContents = document.querySelectorAll('.slide_content'); // each slide dom
	const slideBtnNext = document.querySelector('.slide_btn_next'); // next button
	const slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button
	const slideLen = slideContents.length; // slide length
	const slideWidth = 321; // slide width
	const slideSpeed = 300; // slide speed
	const startNum = 0; // initial slide index (0 ~ 4)
	slideList.style.width = slideWidth * (slideLen+2) + "px";
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
// 음식점 리스트 밑 페이징 눌렀을 때 form 전송 
function paging_form(currentPage,currPageBlock){

	$('#paging_form [name = "currentPage"]').val(currentPage);
	$('#paging_form [name = "currPageBlock"]').val(currPageBlock);
	
	var keyword = $('#keyword1').val();
	var category = $('#category1').val();
	
	var url = "/custom/sub1?keyword="+keyword+"&category="+category;
	$('#paging_form').attr("action",url);
	$('#paging_form').submit();
}



</script>

</head>
<body id="main">

<div id="wrap">

	<!-- top 영역 시작-->
	<c:import url="top.jsp"/>
	<!-- top 영역 끝 -->
		
	<form action="#" id="paging_form" method="post">
		<input type="hidden" name="currentPage" value="${pdto.currentPage}" />
		<input type="hidden" name="currPageBlock" value="${pdto.currPageBlock}" />
		<input type="hidden" id="keyword1" value="${keyword}"/>
		<input type="hidden" id="category1" value="${category}"/>
	</form>
	
	<div id="content-wrapper">
		<div id="content" >
			<!--  1번째 줄 새로시작 -->
			<div id="list2" style="width: auto; height: 350px; text-align: center;">
				<div id="list2(0)" style="width:100%; height:100%;">
					<div id="list" style=" float:left; height :10%; width:25%;">카테고리별 음식점 리스트</div>
					
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
						<div id="list2-1" style="float: left; display: inline; height: 89.7%; width: 25%;">
								검색어와 일치하는 음식점이 없습니다!<br /><br />
								지역명으로 다시 검색해주세요!
								<br /><br />
								예) 종로구, 관철동, 종로동, 규동 등
					    </div>
					</div>
				</div>
			</div>

			<!--  2번째 줄 새로시작 -->
				
			<!--  2번째 줄 끝 -->		
			</div>	
			
		</div><!-- content 끝-->

	</div><!-- content-wrapper -->
</div><!-- wrap 끝 -->
		<c:import url="bottom.jsp"/>
<script src="../resources/js/custom/sub1/sub1.js"></script>

</body>
</html>