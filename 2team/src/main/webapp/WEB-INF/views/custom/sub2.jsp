<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

/*===========================================초기설정=============================================== */

*{
   margin:0;
   padding:0;
}
   
body{
   background-color:#f3f3f3;
}

body, button, input, select, td, textarea, th {
   font-size: 14px;
   line-height: 1.5;
   font-family:  Malgun Gothic, sans-serif;
   color: #000;
   letter-spacing: -1px;
}

/*========================================== 탑 과 푸터 ============================================ */

/* 임시 탑 */
.sub2_top {
	padding-top: 20px;
    width: 100%;
    height: 68px;
    font-size: 12px;
    line-height: 18px;
    text-align: center;
    background: url(//t1.daumcdn.net/localimg/localimages/07/2017/pc/bg_header.png) repeat-x;
}

/* 임시 푸터 */
.sub2_footer{
	padding-top: 40px;
}
.sub2_footer2{
	width: 100%;
    height: 50px;
    padding: 33px 0;
    border-top: 1px solid #e2e2e2;
    font-size: 12px;
    line-height: 18px;
    text-align: center;
    clear: both;
    color: #444;
    background: #fafafa;
}


/*=============================================매장소개 및  상세정보 ========================================= */

/* sub2 의 전체적 구조 */
.sub2_wrap{
   width: 800px;
   padding-top: 16px;
   margin: 0 auto;
   display: block;
}

/* sub 의 기사(내용) */
.sub2_article{
   display:block;
}

/* 기사(내용)의 헤더(첫번째 블록) */
.article_header {
   position: relative;
   border: 1px solid #ebebeb;
   background: #fff;
}

/* 헤더의 사진영역 */
.header_picture{
   position: relative;
   min-height: 144px;
   margin: -1px -1px 0;
}

.header_picture .picture_present{
   display: block;
   position: relative;
   overflow: hidden;
   width: 100%;
   height: 270px;
   background-size: cover;
   background-position: 50% 50%;
}

.header_picture .picture_present:after{
   position: absolute;
   bottom: 0;
   left: 0;
   width: 100%;
   height: 65px;
   content: "";
}

.frame_g {
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   border: 1px solid rgba(0, 0, 0, .08);
   box-sizing: border-box;
}

/* 헤더의 내용영역 */
.header_details{
   position: relative;
   z-index: 10;
   width: 744px;
   padding-bottom: 4px;
   margin: -64px auto 0;
   background:url(//t1.daumcdn.net/localimg/localimages/07/2017/pc/bg_shadow_bottom.png) no-repeat 0 100%;
   text-align: center;
}

/* 헤더 내용의 inner 영역 */
.header_details .details_inner{
   min-height: 187px;
   padding-top: 27px;
   background:url(//t1.daumcdn.net/localimg/localimages/07/2017/pc/bg_shadow_side.png) repeat-y;
   display: block;
   border-bottom: 2px SOLID #DDDDDD;
}

/* inner의 타이틀 */
.inner_title{
   padding: 2px 33px 0;
   font-size: 40px;
   line-height: 50px;
   letter-spacing: -2px;
}

/* 헤더의 평점영역 */
.details_inner .inner_evaluation{
   height: 30px;
   padding-top: 8px;
   text-align: center;
}

/* 카테고리(업종) 과 아이콘 영역  */
.details_inner .category_title,
.details_inner .evaluation_title,
.details_inner .review_title,
.details_inner .ico_dot{
   display: inline-block;
   font-size: 16px;
   line-height: 25px;
   letter-spacing: -1px;
   vertical-align: top;
   text-decoration: none;
}

/* 평점영역의 점(.) 아이콘   */
.details_inner .ico_dot{
   width: 3px;
   height: 3px;
   margin: 12px 4px 0;
   background-position: -120px -60px;
   vertical-align: top;
}

.ico_comm{
   display:block;
   overflow: hidden;
   font-size:1px;
   line-height:0;
   background: url(//t1.daumcdn.net/localimg/localimages/07/2018/pc/ico_detail_200518.png) no-repeat;
   background-repeat: no-repeat;
   text-indent: -9999px;
}

.color_b{
   display: inline-block;
   padding-top: 3px;
   font-family: Arial, sans-serif;
   font-size: 16px;
   line-height: 24px;
   letter-spacing: 0;
   vertical-align: top;
   color: #3396ff;
}

.color_g{
   display: inline-block;
   padding-top: 2px;
   font-family: Arial, sans-serif;
   font-size: 16px;
   letter-spacing: 0;
   vertical-align: top;
   color: #888;
}

.details_inner .inner_booking{
	position: relative;
    width: 350px;
    height: 46px;
    padding: 23px 0 28px;
    margin: 0 auto;
}

.inner_booking .booking_btn{
    width: 120px;
    height: 45px;
    border:0 none;
    color: #fff;
    background: #3396ff;
    cursor:pointer;
    font-size: 18px;
}

/* inner bookmark */
.header_details .inner_bookmark {
    position: absolute;
    top: 0;
    right: 2px;
    width: 43px;
    height: 43px;
    border-bottom: 1px solid #f2f2f2;
    border-left: 1px solid #f2f2f2;
}

.header_details .inner_bookmark .ico_bookmark {
    width: 14px;
    height: 19px;
    margin: 12px auto 0;
}


/* 헤더 내용의 outer 영역  */
.details_outer{
   position: relative;
   padding: 25px 79px 40px;
   background-color:#fff;
}

/* outer의 타이틀 */
.details_outer .outer_title{
   padding-bottom: 17px;
   font-weight: 700;
}

.outer_title{
   height: 23px;
   padding: 10px 0 0;
   font-size: 17px;
   letter-spacing: -2px;
   line-height: 24px;
}

/* outer의 장소,시간,연락처  */
.details_outer .outer_placeinfo,
.details_outer .outer_hourinfo,
.details_outer .outer_contactinfo{
   min-height: 22px;
    padding-bottom: 10px;
    line-height: 22px;
}

/* outer의 장소 */
.outer_placeinfo .ico_address{
   width: 13px;
    height: 18px;
    margin: 3px 0 0 2px;
    background-position: -40px -30px;
}

/* outer의 시간 */
.outer_hourinfo .ico_operation{
   width: 14px;
    height: 14px;
    margin: 5px 0 0 1px;
    background-position: -60px -30px;
}

/* outer의 연락처 */
.outer_contactinfo .ico_contact{
   width: 15px;
    height: 15px;
    margin: 6px 0 0 1px;
    background-position: -100px -30px;
}

/* outer 상세 주소  */
.details_outer .location_detail {
    position: relative;
    padding-left: 24px;
}

.details_outer .txt_address{
    display: block;
    word-break: break-all;
}

.location_detail .txt_addrnum {
    display: block;
    height: 17px;
    padding-top: 3px;
    line-height: 17px;
    color: #666;
}

.txt_addrnum .bg_bar {
    margin: 4px 6px 0;
}

.bg_bar {
    display: inline-block;
    width: 1px;
    height: 10px;
    background: #e5e5e5;
    vertical-align: top;
    text-indent: -9999px;
}

/* outer 상세 시간  */
.details_outer .time_operation {
    display: inline-block;
    padding-left: 4px;
    padding-top: 4px;
    font-family: Arial,sans-serif;
    line-height: 14px;
    letter-spacing: 0;
    vertical-align: top;
}

/* outer 상세 연락처 */
.details_outer .txt_contact {
    font-family: Arial,sans-serif;
    font-size: 14px;
    letter-spacing: 0;
}

/*===========================================매장 메뉴 ============================================= */

/* 기사(내용)의 메뉴영역(두번째 블록) */
.article_menu {
    padding: 29px 79px 44px;
    margin-top: 10px;
    border: 1px solid #eaeaea;
    background: #fff;
}

/* 메뉴 타이틀 */
.menu_title{
    height: 23px;
	padding-top: 10px;
	float: left;
    padding: 4px 13px 0 0;
    font-size: 17px;
    letter-spacing: -2px;
    line-height: 24px;
    
}

/* 메뉴 이미지 wrap */
.menu_image_wrap{
    overflow: hidden;
    width: 640px;
}

.menu_image_wrap .menu_image{
    overflow: hidden;
    width: 642px;
    padding-top: 19px;
}

.menu_image .image_view{
    position: relative;
    float: left;
    width: 319px;
    height: 110px;
    margin: 1px;
    background: #d8d8d8;
    background-size: cover;
    background-position: 50% 50%;
}

/* 메뉴 개수 */
.menu_num_wrap{
	position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 39px;
    background: url(//t1.daumcdn.net/localimg/localimages/07/2017/pc/bg_gradient2.png) repeat-x;
}

.menu_num_wrap .menu_num{
	overflow: hidden;
    float: right;
    height: 22px;
    margin: 14px 14px 0 0;
    font-family: Arial,sans-serif;
    font-size: 15px;
    color: #fff;
    letter-spacing: 0;
}

.article_menu .ico_menu{
	float: left;
    width: 13px;
    height: 13px;
    margin: 4px 5px 0 0;
    background-position: -170px -480px;
}

/* 메뉴 리스트 */
.menu_list li{
	overflow: hidden;
    position: relative;
    width: 640px;
}

.menu_list .menu_element{
	padding: 2px 0;
    border-bottom: 0;
    background: url(//t1.daumcdn.net/localimg/localimages/07/2017/pc/bg_dot.png) repeat-x 0 50%;
}

.menu_list .menu_fst{
	padding-top: 12px;
    background-position: 0 22px;
}

.menu_list .menu_last{
	margin-bottom: 13px;
}

.menu_element .menu_info{
	overflow:hidden;
	float:none;
}

.menu_element .menu_name{
	float: left;
    width: auto;
    max-width: 475px;
    padding-right: 6px;
    line-height: 23px;
    background: #fff;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-break: break-word;
}

.menu_element .menu_price{
    float: right;
    padding: 0 0 0 6px;
    color: #888;
    background: #fff;
    display: block;
    font-size: 15px;
    font-family: Arial,sans-serif;
    letter-spacing: 0;
}

/*===========================================매장 리뷰 ============================================= */
/* 기사(내용)의 리뷰영역(세번째 블록) */
.article_review{
	padding: 29px 79px 31px;
    margin-top: 10px;
    border: 1px solid #eaeaea;
    background: #fff;
}

/* 리뷰 타이틀 */
.article_review .review_title{
	height: 23px;
    padding: 10px 0 0;
    font-size: 17px;
    letter-spacing: -2px;
    line-height: 24px;
    overflow:hidden;
}

/* 리뷰 작성폼 틀*/
.review_wrap{
	margin-top: 11px;
    border: 1px solid #ddd;
}

/* 리뷰 작성폼 별점 평점 영역 */

.review_wrap .grade_star{
	overflow: hidden;
    padding: 19px 19px 20px;
    border-bottom: 1px solid #f2f2f2;
}

.ico_star{
	display: block;
    background: url(//t1.daumcdn.net/localimg/localimages/07/2018/pc/ico_star_180723.png) no-repeat;
}

.review_wrap .star_rate{
	width:151px;
	float: left;
    height: 27px;
    margin-right: 4px;
    cursor: pointer;
}

.star_rate .inner_star{
	height: 100%;
    background-position: 0 -30px;
}


/* 임시 ... 리뷰 작성폼 별점 평점 영역 */

.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle; background:url(//t1.daumcdn.net/localimg/localimages/07/2018/pc/ico_star_180723.png) no-repeat ;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:5px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 -30px;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}


/* 리뷰 작성폼 별점당 점수 */
.review_wrap .num_rate{
	float: left;
    height: 27px;
    margin: 0 13px 0 12px;
    font-family: Arial,sans-serif;
    font-size: 20px;
    letter-spacing: 0;
}

/* 별점당 텍스트 */
.review_wrap .txt_word{
	float: left;
    font-size: 20px;
    line-height: 25px;
}

/* 리뷰 content 영역 */
.review_wrap .review_content{
	overflow: visible;
    width: 595px;
    height: 44px;
    padding: 14px 23px 9px 20px;
    line-height: 22px;
    border: 0 none;
    font-size: 14px;
    letter-spacing: -1px;
    vertical-align: middle;
    color: #444;
    resize: none;
    -webkit-appearance: none;   
}

/* 리뷰 file upload 영역 */
.review_wrap .review_fileupload{
	border-top: 1px solid #e2e2e2;
}


/* 리뷰 등록 버튼 */
.review_wrap .review_enroll{
    position: relative;
    width: 541px;
    height: 40px;
    padding: 0 77px 0 20px;
    border-top: 1px solid #e2e2e2;
}

.review_wrap .btn_enroll{
    position: absolute;
    top: -1px;
    right: -1px;
    width: 78px;
    height: 42px;
    border:0 none;
    padding-bottom: 1px;
    color: #fff;
    background: #3396ff;
    cursor:pointer;
}

/* 매장 리뷰 rate(점수)  */
.review_rate{
	overflow: hidden;
    padding: 6px 0 0;
}

/* 매장 리뷰 점수에서 숫자 */
.review_rate .num_rate{
	float: left;
    height: 40px;
    font-family: Arial,sans-serif;
    font-size: 28px;
    line-height: 40px;
    letter-spacing: 0;
}

/* 매장 리뷰 점수에서 글자 -> 점 이라는 텍스트 표시 */
.review_rate .txt_score{
	display: inline-block;
    margin-left: 4px;
    font-family: "\B9D1\C740 \ACE0\B515",Malgun Gothic,sans-serif;
    font-size: 25px;
    line-height: 33px;
    vertical-align: top;
}

/* 매장 리뷰 별점 표시  */
.review_rate .star_rate{
    width: 151px;
    height: 27px;
    background-position: 0 0;
	float: left;
    margin: 5px 0 0 10px;
}

/* 매장 전체 리뷰 영역 */
.review_view{
	padding-top: 14px;
}

/* 매장 전체 리뷰 영역에서 각각 리뷰들 */
.review_view li{
	overflow: hidden;
    position: relative;
    min-height: 52px;
    padding: 17px 0 18px;
    border-top: 1px solid #f2f2f2;
    list-style:none;
}

/* 각각 리뷰에서 프로필 사진(defalut) 영역 */
.review_view .profile_info{
	float: left;
    position: relative;
    width: 48px;
    height: 48px;
    margin-right: 31px;
    background: url(//t1.daumcdn.net/localimg/localimages/07/2018/pc/value_img_profile_default.png) no-repeat;
	cursor: pointer;
}

.review_view .profile_info:after{
	overflow: hidden;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 10;
    width: 48px;
    height: 48px;
    background: url(//t1.daumcdn.net/localimg/localimages/07/2018/pc/value_img_profile_frame.png) no-repeat;
    content: "";
}

/* 각각 리뷰에서 프로필 사진(내 프로필) img 영역 */
.review_view .thumb_g{
	display: block;
    width: 48px;
    height: 48px;
    border:0 none;
}

/* 각각 리뷰에서 별점 영역 */
.review_view .star_info{
	overflow: hidden;
    padding-right: 12px;
} 

.review_view .grade_star{
	overflow: hidden;
}

.review_view .star_rate{
	float: left;
    width: 88px;
    height: 16px;
    background-position: 0 -60px;
}

.review_view .star_rate .inner_star{
	height: 100%;
	background-position: 0 -80px;
}

.review_view .num_rate{
	float: left;
    height: 16px;
    padding: 0 6px;
    font-family: Arial,sans-serif;
    font-size: 15px;
    line-height: 18px;
    letter-spacing: 0;
}

/* 각각 리뷰에서 content(리뷰 글) 영역 */
.review_view .content_info{
	overflow: hidden;
    padding: 9px 12px 0 0;
}

.review_view .txt_content{
	overflow: hidden;
    color: #444;
    line-height: 21px;
    white-space: pre-wrap;
    word-break: break-all;
}

/* 각각 리뷰에서 좋아요 , 아이디, 작성 날짜 영역  */
.review_view .item_content{
	overflow: hidden;
    height: 22px;
    padding: 6px 0 0 2px;
    font-size: 13px;
}

.review_view .link_like{
	float:left;
    overflow: hidden;
    line-height: 22px;
    color: #444;
    text-decoration: none;
}

.review_view .ico_like{
	float: left;
    width: 13px;
    height: 13px;
    margin: 5px 4px 0 0;
    background-position: -60px -50px;
}

.review_view .num_g{
    font-family: Arial,sans-serif;
    line-height: 20px;
    letter-spacing: 0;
}

.review_view .like_on{
	color: #1f8cff;
}

.review_view .like_on .ico_like{
	background-position: -80px -50px;
}

/* 리뷰쓴 유저 id */
.review_view .link_user{
	float: left;
    color: #888;
}

.review_view .bg_bar{
	float:left;
	height: 11px;
    margin: 6px 7px 0 8px;
    background: #e2e2e2;
}

/* 리뷰 등록일 */
.review_view .time_write{
	float: left;
    font-family: arial;
    line-height: 21px;
    color: #888;
    letter-spacing: 0;
}

/* 리뷰 페이징 */
.review_view .review_paging{
	padding-bottom: 19px;
    border-top: 1px solid #f2f2f2;
	overflow: hidden;
    padding-top: 22px;
    font-family: Arial,sans-serif;
    font-size: 14px;
    line-height: 28px;
    text-align: center;
    vertical-align: top;
}

/* 페이지 번호 */
.review_paging .link_page{
	display: inline-block;
    width: 28px;
    height: 28px;
    line-height: 28px;
    text-decoration: none;
    vertical-align: top;
    letter-spacing: 0;
    color:#000;
    cursor: pointer;
}

.review_paging .link_page em{
	width: 26px;
    height: 26px;
    line-height: 26px;
    border: 1px solid #3396ff;
    color: #3396ff;
    font-weight: 700;
    font-style: normal;
    display: inline-block;
}

.review_paging .link_page:hover{
	text_decoration:none;
	color:#00aef6;
}


/* 선택된 페이지 번호 */
.review_paging em.link_page{
	width: 26px;
    height: 26px;
    line-height: 26px;
    border: 1px solid #3396ff;
    color: #3396ff;
    font-weight: 700;
}

/* 다음 페이지  */
.review_paging .btn_next{
	display: inline-block;
    height: 28px;
    margin-left: 10px;
    font-size: 13px;
    line-height: 27px;
    color: #666;
    background-position: 100% -10px;
    vertical-align: top;
    text-decoration: none;
    cursor: pointer;
}

.review_paging .ico_next{
	display: inline-block;
    width: 7px;
    height: 11px;
    margin: 8px 0 0 4px;
    background-position: -190px -50px;
    vertical-align: top;
}

/* 이전 페이지 */

.review_paging .btn_prev {
    display: inline-block;
    height: 28px;
    margin-right: 10px;
    font-size: 13px;
    line-height: 27px;
    color: #666;
    background-position: 0 10px;
    text-decoration: none;
    vertical-align: top;
}

.review_paging .ico_prev {
    display: inline-block;
    width: 7px;
    height: 11px;
    margin: 8px 4px 0 0;
    background-position: -180px -50px;
    vertical-align: top;
}

/*======================================================================================== */


</style>

</head>

<body>
	<div class="sub2_top">
		임시 탑영역 입니다. 
	</div>

   <!-- 본문 -->
   <div class="sub2_wrap">
      <div class="sub2_article">
         <!-- 기사 헤더 -->
         <div class="article_header">
         
            <!-- 헤더의 사진영역 -->
            <div class="header_picture" style="background: none">
               <a>
               	  <c:choose>
               	  	<c:when test="${tdto.c_no != null}">
               	  		<c:if test="${tdto.c_no == 1}">
               	  			<span class="picture_present" style="background-image:url('http://placehold.it/800x270/444444&text=korean food')"></span>
               	  		</c:if>
               	  		<c:if test="${tdto.c_no == 2}">
               	  			<span class="picture_present" style="background-image:url('http://placehold.it/800x270/444444&text=china food')"></span>
               	  		</c:if>
               	  		<c:if test="${tdto.c_no == 3}">
               	  			<span class="picture_present" style="background-image:url('http://placehold.it/800x270/444444&text=japan food')"></span>
               	  		</c:if>
               	  		<c:if test="${tdto.c_no == 4}">
               	  			<span class="picture_present" style="background-image:url('http://placehold.it/800x270/444444&text=snack food')"></span>
               	  		</c:if>
               	  	</c:when>
               	  	
               	  	<c:when test="${tdto.c_no == null}">
               	  	    <span class="picture_present" style="background-image:url('http://placehold.it/800x270/444444&text=none')"></span>
               	  	</c:when>

               	  </c:choose>
                  <span class="frame_g"></span>
               </a>
            </div>
            
            <!-- 헤더의 내용영역 -->
            <div class="header_details">
            
               <div class="details_inner">
                  <h2 class="inner_title">${tdto.name}</h2>
                  <!-- 헤더의 평점영역 -->
                  <div class="inner_evaluation">
                     <span class="category_title">${tdto.c_name}</span>
                     
                     <span class="ico_comm ico_dot"></span>
                     
                     <span class="evaluation_title">평점</span> 
                     <span class="color_b">${avg}</span>
                     <span class="color_g">(${count})</span>
                     
                     <span class="ico_comm ico_dot"></span>
                     
                     <span class="review_title">리뷰</span>
                     <span class="color_b">${count}</span>
                  </div>
                  
                  <div class="inner_booking">
                  	 <button class="booking_btn" onclick="location.href='#'">예약하기</button>	  
                  </div>
                  
                  <c:choose>
                  	<c:when test="${favoriteCheck != null }">
                  		<c:if test="${fn:contains(favoriteCheck,'t')}">
                  			<a class="inner_bookmark" href="/custom/favorites" style="color:#000; text-decoration:none;">
                     			<span class="ico_comm ico_bookmark" style="background-position: -120px -480px;">즐겨찾기 해제</span>
                  			</a>
                  		</c:if>
                  		
                  		<c:if test="${fn:contains(favoriteCheck,'f')}">
                  			<a class="inner_bookmark" href="/custom/favorites" style="color:#000; text-decoration:none;">
                     			<span class="ico_comm ico_bookmark" style="background-position: -100px -480px;">즐겨찾기 추가</span>
                  			</a>
                  		</c:if>
                  	</c:when>
                  	
                  	<c:when test="${favoriteCheck == null }">
                  		
                  	</c:when>
                  </c:choose>
               </div><!-- details_inner end -->
            </div><!-- header_details end -->

            <div class="details_outer">
            
               <h3 class="outer_title">상세정보</h3>

               <div class="outer_placeinfo">
                  <h4 style="float:left">
                     <span class="ico_comm ico_address">위치</span>
                  </h4>
                  <div class="location_detail">
                     <span class="txt_address">
                     	${tdto.address1}
                     </span>
                     <span class="txt_addrnum">
                       상세주소 
                        <span class="bg_bar"></span>
                       	${tdto.address2}
                     </span>
                  </div>
               </div>

               <div class="outer_hourinfo">
                  <h4 style="float:left">
                     <span class="ico_comm ico_operation">운영시간 안내</span>
                  </h4>
                  <div class="location_detail">
                     <span class="time_operation">${tdto.hour}</span>
                  </div>
               </div>

               <div class="outer_contactinfo">
                  <h4 style="float:left">
                     <span class="ico_comm ico_contact">연락처</span>
                  </h4>
                  <div class="location_detail">
                     <span class="txt_contact">${tdto.tel}</span>
                     <span class="color_g"> 대표번호</span>
                  </div>
               </div>
               
            </div><!-- details_outer end -->

         </div><!-- article_header end -->
         
         <!-- 기사 메뉴 -->
         <div class="article_menu">
         	<div>
         		<h3 class="menu_title">메뉴</h3>
         	</div>
         	
         	<div class="menu_image_wrap">
         		<div class="menu_image">
         			<a class="image_view" style="background-image:url('http://placehold.it/319x110/444444&text=image')">
         				
         			</a>
         			<a class="image_view" style="background-image:url('http://placehold.it/319x110/444444&text=image')">
         				
         				<span class="menu_num_wrap">
         					<span class="menu_num">
         						<span class="ico_comm ico_menu">갯수 : </span>
         						00
         					</span>
         				</span>
         			</a>
         		</div>
         	</div>
         	
         	<ul class="menu_list" style="list-style:none;">
         		<c:if test="${mlist.size() == 0 }">
         			<li class="menu_element">
         				등록된 메뉴가 없습니다...
         			</li>
         		</c:if>
         		
         		<c:if test="${mlist.size() != 0 }">
         			<c:forEach var="ndto" items="${mlist}">
         			   
         			    <li class="menu_element">
         					<div class="menu_info">
         						<span class="menu_name">${ndto.name}</span>
         						<span class="menu_price">${ndto.price}</span>
         					</div>
         				</li>
         				
         			</c:forEach>
         		</c:if>
         		
         	</ul>
         </div><!-- article_menu end -->
         
         <!-- 기사 리뷰 -->
         <div class="article_review">
         	<h3 class="review_title">리뷰작성</h3>
         	
         	<!-- 리뷰작성  -->
         	<div class="review_wrap">
         		<!-- 리뷰폼  -->
         		<form id="review_form" action="/custom/reviewInsert" enctype="multipart/form-data" method="post">
         			<input type="hidden" name="rating" value="" />
         			<input type="hidden" name="no" value= "${tdto.no}" />
         			         			
         			<!-- star area -->
         			<!--
         			<div class="grade_star">
         				<span class="ico_star star_rate">
         					<span class="ico_star inner_star">
         						<label style="width:30px"></label>
         						<label style="width:60px"></label>
         						<label style="width:90px"></label>
         						<label style="width:120px"></label>
         						<label style="width:150px"></label>
         					</span>
         				</span>
         				
         				<span class="num_rate">
         					0
         					<span>/5</span>
         				</span>
         				
         				<span class="txt_word">평가해주세요</span>
         			</div>
         			-->
         			<!-- 임시 star area -->
         			<div class="grade_star">
						<span class="star-input"> 
							<span class="input"> 
								<input type="radio" name="star_input" value="1" id="p1">
								<label for="p1">1</label> 
								<input type="radio" name="star_input" value="2" id="p2"> 
								<label for="p2">2</label> 
								<input type="radio" name="star_input" value="3" id="p3"> 
								<label for="p3">3</label>
								<input type="radio" name="star_input" value="4" id="p4">
								<label for="p4">4</label> 
								<input type="radio" name="star_input" value="5" id="p5"> 
								<label for="p5">5</label>
							</span> 
							<output for="star-input">
								<b>0</b>점
							</output>
						</span>
					</div>
					
					<!-- content area -->
         			<div class="review_content_wrap" style="position: relative;">
         				<textarea class="review_content" name="content"></textarea>
         			</div>
         			
         			<!-- upload area -->
         			<div class="review_fileupload">
         				<input type="file" name="file2" />
         			</div>
         		</form>
         		
         		<div class="review_enroll">
         			<button class="btn_enroll">등록</button>
         		</div>
         	</div>
         	
         	<!-- 리뷰 전체 수 -->
         	<div style="position:relative; margin-top:20px;">
         		<span class="review_title">
         		전체  &nbsp;
         			<span class="color_b">${count}</span>
         		</span>
         	</div>
         	
         	<!-- 리뷰 점수 -->
         	<div class="review_rate">
         		<span class="num_rate">
         		${avg}
         			<span class="txt_score">점</span>
         		</span>
         		
         		<span class="ico_star star_rate">
         			<span class="ico_star inner_star" style="width:${avg * 20}%"></span>	
         		</span>
         	</div>
         	
         	<!-- 전체 리뷰 보기 -->
         	<div class="review_view">
         		<ul style="list-style:none;">
         			
         			<c:if test="${rlist.size() == 0 }">
         				<li class=" ">
         					등록된 리뷰가 없습니다...
         				</li>
         			</c:if>
         		
         			<c:if test="${rlist.size() != 0 }">
         				<c:forEach var="rdto" items="${rlist}">
         			   
         				<li>
         					<!-- 프로필 -->
         					<a class="profile_info">
         						<!-- <img src="#" width="48" height="48" class="thumb_g"> -->
         					</a>
         				
         					<!-- 별점 -->
         					<div class="star_info">
         						<div class="grade_star">
         							<span class="ico_star star_rate">
         								<span class="ico_star inner_star" style="width: ${rdto.rating * 20}%;"></span>
         							</span>
         							<span class="num_rate">
         								${rdto.rating}
         							</span>
         						</div>
         					</div>
         				
         					<!-- content -->
         					<div class="content_info">
         						<p class="txt_content">${rdto.content}</p>
         						
         						<div class="item_content">
         							
         							<c:if test="${rdto.like_on == 0 }">
         								<a href="/custom/like?rev_no=${rdto.no}" class="link_like">
         									<span class="ico_comm ico_like"></span>
         									좋아요
         								
         									<c:if test="${rdto.like_cnt != 0}">
         										<span class="num_g" style="display: inline-block;">${rdto.like_cnt}</span>
         									</c:if>
         								</a>
         							</c:if>
         							<c:if test="${rdto.like_on != 0}">
         								<a href="/custom/like?rev_no=${rdto.no}" class="link_like like_on">
         									<span class="ico_comm ico_like"></span>
         									좋아요
         								
         									<c:if test="${rdto.like_cnt != 0}">
         										<span class="num_g" style="display: inline-block;">${rdto.like_cnt}</span>
         									</c:if> 
         							</a>
         							</c:if>
         							
         						
         						
         							<span class="bg_bar"></span>
         						
         							<a class="link_user">${rdto.mem_id }</a>
         						
         							<span class="bg_bar"></span>
         						
         							<span class="time_write">${rdto.date1 }</span>
         							
         							<span class="bg_bar"></span>
         							
         							<button style="font-size: 10px;">상세보기</button>
         						</div>
         					</div>
         				</li>
         				
         				</c:forEach>
         			</c:if>
         			
         		</ul>

				<!-- Modal -->
<!-- 				<div id="modal" class="modal modal__bg" role="dialog" aria-hidden="true">
					<div class="modal__dialog">
						<div class="modal__content">
							<h1>Modal</h1>
							<p>Church-key American Apparel trust fund, cardigan mlkshk
								small batch Godard mustache pickled bespoke meh seitan. Wes
								Anderson farm-to-table vegan, kitsch Carles 8-bit gastropub
								paleo YOLO jean shorts health goth lo-fi. Normcore chambray
								locavore Banksy, YOLO meditation master cleanse readymade
								Bushwick.</p>

							modal close button
							<a href="" class="modal__close demo-close"> <svg class="" viewBox="0 0 24 24">
									<path d="M19 6.41l-1.41-1.41-5.59 5.59-5.59-5.59-1.41 1.41 5.59 5.59-5.59 5.59 1.41 1.41 5.59-5.59 5.59 5.59 1.41-1.41-5.59-5.59z" />
									<path d="M0 0h24v24h-24z" fill="none" /></svg>
							</a>

							</div>
						</div>
					</div> -->

					<div class="review_paging">
         		
         		<c:if test="${pdto.startPage > pdto.pageBlock}">
         			<a href="/custom/sub2?currentPage=${pdto.startPage - pdto.pageBlock}&currPageBlock=${pdto.currPageBlock-1}" class="btn_prev">
         				이전
         				<span class="ico_comm ico_prev"></span>
         			</a>
         		</c:if>
         			
         		<c:forEach var = "i" begin="${pdto.startPage}" end="${pdto.endPage}">
         			
         			<a href="/custom/sub2?currentPage=${i}&currPageBlock=${pdto.currPageBlock}" class="link_page">
         				<c:if test="${pdto.currentPage == i}"> 
         					<em><c:out value="${i}"/></em>
         				</c:if>
         				<c:if test="${pdto.currentPage != i}">
         					<c:out value="${i}"/>
         				</c:if>
         			</a>
         		</c:forEach>
         			
         		<c:if test="${pdto.endPage < pdto.allPage}">	
         			<a href="/custom/sub2?currentPage=${pdto.endPage+1}&currPageBlock=${pdto.currPageBlock+1}" class="btn_next">
         				다음
         				<span class="ico_comm ico_next"></span>
         			</a>
         		</c:if>
         		</div>
         	</div><!-- review_view end -->
         	
         </div><!-- article_review end -->
      </div><!-- article end -->
   </div><!-- sub2_wrap end -->
   
   <div class="sub2_footer">
   		<div class="sub2_footer2">
   			임시 푸터 영역 입니다.
   		</div>
   </div>

   <script src="../resources/js/jquery-1.10.2.min.js"></script>
   <script src="../resources/js/custom/star.js"></script>
   <script type="text/javascript">
   
   		// 첫번째 , 마지막 메뉴에 class 속성 추가 
   		$(function(){
   			$(".menu_list li:first").addClass("menu_fst");
   			$(".menu_list li:last").addClass("menu_last");
   			
   		});
   		
   	    // 리뷰 작성 버튼 클릭 시 이벤트 
   		$(".btn_enroll").click(function(){
   			var star_rating = $("output>b").text();
   			
   			if(star_rating <= 0)
   			{
   				alert("별점을 선택해 주세요 ...!!! ");
   				return false;
   			}
   			
   			$("#review_form [name = 'rating']").val(star_rating);	
   			
   			$("#review_form").submit();
   		
   		});
   	    
   </script>
</body>
</html>