<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Add fancyBox main CSS files -->
<link rel="stylesheet" type="text/css" href="../resources/css/custom/sub2/jquery.fancybox.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/custom/sub2/sub2.css" />
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
 
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
               	  	<c:when test="${resdto.c_no != null}">
               	  		<c:if test="${resdto.c_no == 2}">
               	  			<span class="picture_present" style="background-image:url('http://placehold.it/800x270/444444&text=korean food')"></span>
               	  		</c:if>
               	  		<c:if test="${resdto.c_no == 3}">
               	  			<span class="picture_present" style="background-image:url('http://placehold.it/800x270/444444&text=china food')"></span>
               	  		</c:if>
               	  		<c:if test="${resdto.c_no == 4}">
               	  			<span class="picture_present" style="background-image:url('http://placehold.it/800x270/444444&text=western food')"></span>
               	  		</c:if>
               	  		<c:if test="${resdto.c_no == 5}">
               	  			<span class="picture_present" style="background-image:url('http://placehold.it/800x270/444444&text=japan food')"></span>
               	  		</c:if>
               	  		<c:if test="${resdto.c_no == 6}">
               	  			<span class="picture_present" style="background-image:url('http://placehold.it/800x270/444444&text=cafe food')"></span>
               	  		</c:if>
               	  	</c:when>
               	  	
               	  	<c:when test="${resdto.c_no == null}">
               	  	    <span class="picture_present" style="background-image:url('http://placehold.it/800x270/444444&text=none')"></span>
               	  	</c:when>

               	  </c:choose>
                  <span class="frame_g"></span>
               </a>
            </div>
            
            <!-- 헤더의 내용영역 -->
            <div class="header_details">
            
               <div class="details_inner">
                  <h2 class="inner_title">${resdto.name}</h2>
                  <!-- 헤더의 평점영역 -->
                  <div class="inner_evaluation">
                     <span class="category_title">${resdto.c_name}</span>
                     
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
                     	${resdto.address1}
                     </span>
                     <span class="txt_addrnum">
                       상세주소 
                        <span class="bg_bar"></span>
                       	${resdto.address2}
                     </span>
                  </div>
               </div>

               <div class="outer_hourinfo">
                  <h4 style="float:left">
                     <span class="ico_comm ico_operation">운영시간 안내</span>
                  </h4>
                  <div class="location_detail">
                     <span class="time_operation">${resdto.hour}</span>
                  </div>
               </div>

               <div class="outer_contactinfo">
                  <h4 style="float:left">
                     <span class="ico_comm ico_contact">연락처</span>
                  </h4>
                  <div class="location_detail">
                     <span class="txt_contact">${resdto.tel}</span>
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
         			<c:forEach var="menudto" items="${mlist}">
         			   
         			    <li class="menu_element">
         					<div class="menu_info">
         						<span class="menu_name">${menudto.name}</span>
         						<span class="menu_price">${menudto.price}</span>
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
         			<input type="hidden" name="no" value= "${resdto.no}" />
         			         			
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
         				<input type="file" name="file2" accept=".png, .jpg, .jpeg" onchange="validateFileType()"/>
         			</div>
         		</form>
         		
         		<div class="review_enroll">
         			<span class="num_letter txt_len_wrap">
         				<span class="txt_len">0</span>
         				<span class="num_total"> / 200</span>
         			</span>
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
         				<c:forEach var="revdto" items="${rlist}">
         			   
         				<li>
         					<!-- 프로필 -->
         					<a class="profile_info">
         						<!-- <img src="#" width="48" height="48" class="thumb_g"> -->
         					</a>
         				
         					<!-- 별점 -->
         					<div class="star_info">
         						<div class="grade_star">
         							<span class="ico_star star_rate">
         								<span class="ico_star inner_star" style="width: ${revdto.rating * 20}%;"></span>
         							</span>
         							<span class="num_rate">
         								${revdto.rating}
         							</span>
         						</div>
         					</div>
         				
         					<c:if test="${revdto.file1 != null}">
         						<a href="../upload/${revdto.file1}"  class="link_photo fancybox" data-fancy-group="gallary">
         							<img src="../upload/${revdto.file1}" class="photo_img" width="78" height="78">
         						</a>         					
         					</c:if>			

         				
         					<!-- content -->
         					<div class="content_info">
         						<p class="txt_content">${revdto.content}</p>
         						
         						<div class="item_content">
         							
         							<c:if test="${revdto.like_on == 0 }">
         								<a href="/custom/like?rev_no=${revdto.no}" class="link_like">
         									<span class="ico_comm ico_like"></span>
         									좋아요
         								
         									<c:if test="${revdto.like_cnt != 0}">
         										<span class="num_g" style="display: inline-block;">${revdto.like_cnt}</span>
         									</c:if>
         								</a>
         							</c:if>
         							<c:if test="${revdto.like_on != 0}">
         								<a href="/custom/like?rev_no=${revdto.no}" class="link_like like_on">
         									<span class="ico_comm ico_like"></span>
         									좋아요
         								
         									<c:if test="${revdto.like_cnt != 0}">
         										<span class="num_g" style="display: inline-block;">${revdto.like_cnt}</span>
         									</c:if> 
         							</a>
         							</c:if>
         							
         						
         						
         							<span class="bg_bar"></span>
         						
         							<a class="link_user">${revdto.mem_id }</a>
         						
         							<span class="bg_bar"></span>
         						
         							<span class="time_write">${revdto.date1 }</span>
         							
         						</div>
         					</div>
         				</li>
         				
         				</c:forEach>
         			</c:if>
         			
         		</ul>

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
   <script src="../resources/js/custom/sub2/star.js"></script>
   <script src="../resources/js/custom/sub2/jquery.fancybox.js"></script>
   <script src="../resources/js/custom/sub2/sub2.js"></script>
  
</body>
</html>