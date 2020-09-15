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
							<ul>
								<c:forEach var="resdto" items="${reslist}">
									<li>
										<div id="store${resdto.no}">
											<span class="alphabet"></span>
											<a id="res_name" href="#" data-no="${resdto.no}">${resdto.name}</a>
											
											<input type="hidden" class="res_address" value="${resdto.address1}" />
											<input type="hidden" class="res_c_no" value="${resdto.c_no}" />
										</div>
									</li>
								</c:forEach>
							</ul>
							
							<div class="res_paging">
								<c:if test="${pdto.startPage > pdto.pageBlock}">
         							<a href="javascript:void(0);" onclick="javascript:paging_form(${pdto.startPage - pdto.pageBlock},${pdto.currPageBlock-1});" class="btn_prev">
         								<span class="ico_comm ico_prev"></span>
         							</a>
         						</c:if>
         						<c:forEach var = "i" begin="${pdto.startPage}" end="${pdto.endPage}">
         			
         							<a href="javascript:void(0);"  onclick="javascript:paging_form(${i},${pdto.currPageBlock});" class="link_page">
         								<c:if test="${pdto.currentPage == i}"> 
         									<em><c:out value="${i}"/></em>
         								</c:if>
         								<c:if test="${pdto.currentPage != i}">
         									<c:out value="${i}"/>
         								</c:if>
         							</a>
         						</c:forEach>
         			
         						<c:if test="${pdto.endPage < pdto.allPage}">
         							<a href="javascript:void(0);" onclick="javascript:paging_form(${pdto.endPage+1},${pdto.currPageBlock+1});"  class="btn_next">
         								<span class="ico_comm ico_next"></span>
         							</a>
         						</c:if>
         					</div> <!-- review-paging end -->
					    </div>
					</div>
				</div>
			<!-- 카드 형태로 3개만 구현하고 나머지는 슬라이드 -->
			</div>

			<!--  2번째 줄 새로시작 -->
			<div id ="restart"style="width: auto; height: 350px; " >
				<div id="recom">
					<div style="height: 10%; text-align: center;">선택된 음식점 </div>
				</div>
				
				<c:choose>
					<c:when test="${reslist.size()==0}">
					기덕이 바보
					
					</c:when>
					<c:when test="${reslist.size()!=0}">
						<div id="list2-2" > 					
							<a href="" target='_blank'>
								<img src="https://raw.githubusercontent.com/ddddddd2/2Team_sol/master/upload/res_img/${reslist[0].no}.jpg" style="width: 100%; height: 100%; vertical-align: middle;"  >
							</a><!-- target='_blank' 새창띄우기 -->
						</div>
						<div id="list2-3">
							<p id="selected_name">음식점 : 	<span>${reslist[0].name}  </span></p>
							<p id="selected_address">주소 : 	<span>${reslist[0].address1}  </span></p>
							<p id="selected_tel">연락처 : 	<span>${reslist[0].tel} </span></p>
							<p id="selected_hour">운영시간 : 	<span>${reslist[0].hour}</span></p>
							<p id="selected_cnt">조회수 : 	<span>${ClickCnt}</span></p>
							<p id="selected_avg">평점 : 		<span id="avg">${CnA.avg}점</span> <span id="count">(${CnA.count})</span></p>
							<button onclick="javascript:document.location.href='/custom/sub2?no=${reslist[0].no}'">상세보기</button>
						</div> 		<!-- list2-3 끝 -->			
					</c:when>
				</c:choose>
			<!--  2번째 줄 끝 -->		
			</div>	
			<!-- 3번째 줄 시작  -->				
			<div class="content-wrap">
				
				<div class="recom">
					<div style="height: 10%; text-align: center;">조회수 별 음식점 top5 </div>
				</div>
				<div class="slide_wrap">
				
					<div class="slide_box">
						
						<div class="slide_list clearfix" style="text-align: center;">
							
							<c:forEach var="vReslist" items="${vReslist}">
								<div class="slide_content">
									<div class="slide_img">
										<img src="../upload/${vReslist.NO}.jpg" onclick="javascript:document.location.href='/custom/sub2?no=${vReslist.NO}'">
											
									</div>
									<div style="float: left; width: 100%; height: 35%">
										<p><span>${vReslist.name}</span></p>
										<p><span>${vReslist.c_name}</span></p>
										<p><span>${vReslist.avg}점(${vReslist.count})</span></p>
										<p><span></span></p>
									</div>
								</div>
							</c:forEach>

						</div><!-- // .slide_list -->
							
					</div><!-- // .slide_box -->
							
				
					<div class="slide_btn_box" style="text-align: center;">
						<button type="button" class="slide_btn_prev">이전</button>
						<button type="button" class="slide_btn_next">다음</button>
					</div>

				</div><!-- slide_wrap -->

			</div><!-- 	content-wrap 끝 -->
			
		</div><!-- content 끝-->

	</div><!-- content-wrapper -->
</div><!-- wrap 끝 -->
		<c:import url="bottom.jsp"/>
<script src="../resources/js/custom/sub1/sub1.js"></script>

</body>
</html>