<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/adminMain.css" />
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/adminIndex.js"></script>
<style type="text/css">
.slide_wrap { position: relative; width: 900px; margin: auto; padding-bottom: 30px; }
.slide_box { width: 100%; margin: auto; overflow-x: hidden; }
.slide_content { display: table; float: left; width: 300px; height: 400px; }
.slide_list div p {background-color: red;}
</style>
<script type="text/javascript">
window.onload = function(){
// const slideList = document.querySelector('.slide_list'); // Slide parent dom
// const slideContents = document.querySelectorAll('.slide_content'); // each slide dom
// const slideBtnNext = document.querySelector('.slide_btn_next'); // next button
// const slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button
// const pagination = document.querySelector('.slide_pagination');
// const slideLen = slideContents.length; // slide length
// const slideWidth = 40; // slide width
// const slideSpeed = 30; // slide speed
// slideList.style.width = slideWidth * (slideLen) + "px";
// let curIndex = 0; // current slide index (except copied slide)
// /** Next Button Event */
// slideBtnNext.addEventListener('click', function() {
// if (curIndex < slideLen - 3) {
// slideList.style.transition = slideSpeed + "ms";
// slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 1)) + "px, 0px, 0px)";
// }
// curSlide = slideContents[++curIndex];
// colsole.log(curSlide);
// });
// /** Prev Button Event */
// slideBtnPrev.addEventListener('click', function() {
// 	if (curIndex > slideLen - 3) {
// 	slideList.style.transition = slideSpeed + "ms";
// 	console.log(slideWidth);
// 	console.log(curIndex);
// 	console.log(slideList.style.transform);
// 	slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex - 1)) + "px, 0px, 0px)";
// 	console.log(slideList.style.transform);
// 	}
// 	curSlide = slideContents[--curIndex];
// 	});

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
	console.log("클릭:"+curIndex);
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
console.log("숫자 4일 때 클릭 결과 :"+curIndex);
}
curSlide.classList.remove('slide_active');
curSlide = slideContents[++curIndex];
curSlide.classList.add('slide_active');
console.log("최종 결과 :"+curIndex);
});
/** Prev Button Event */
slideBtnPrev.addEventListener('click', function() {
	console.log("클릭시:"+curIndex);
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
	<div id="main-wrapper">
		<div id="content-wrap">
			<div class="slide_wrap">
			<div class="slide_box">
			<div class="slide_list clearfix" style="text-align:center;">
			<div class="slide_content slide01">
			<p>1</p>
			</div>
			<div class="slide_content slide02">
			<p>2</p>
			</div>
			<div class="slide_content slide03">
			<p>3</p>
			</div>
			<div class="slide_content slide04">
			<p>4</p>
			</div>
			<div class="slide_content slide05">
			<p>5</p>
			</div>
			</div>
			<!-- // .slide_list -->
			</div>
			<!-- // .slide_box -->
			<div class="slide_btn_box" style="text-align:center;">
			<button type="button" class="slide_btn_prev">Prev</button>
			<button type="button" class="slide_btn_next">Next</button>
			</div>
			<!-- // .slide_btn_box -->
			<ul class="slide_pagination"></ul>
			<!-- // .slide_pagination -->
			</div>
			<!-- // .slide_wrap -->
			<!-- // .container -->
		</div>
	</div>
	
</body>
</html>