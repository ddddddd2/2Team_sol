<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div id="menuBar" style="width: 100%; height: 200px; margin-top:20px">
	<div id="myActivity" style="background-color: pink; height: 40px; width: 10%; margin-left:8%; float:left; 
			font-weight:bold; text-align:center; line-height:36px;"><a href="/myPage" style="color:white;">나의 활동</a></div>
	<div id="mymy" style="width: 80%; height: 150px; margin-left: 20%"><!-- 첫 번째 큰 단락 div 시작 -->
			<div id="my1" style="float: left; width: 32%; height: 100%">
				<img src="../resources/image/custom/businessman.png" height="80%" style="margin: 20px; margin-left:170px;"></div>
			<div id="my2" style="float: left; width: 20%; height: 100%">
			
			<table>
					<tr>
						<td style="padding-top:20px"><p style="background-color: pink; color:white;  width:110%;">이 름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>${mdto.name}</td>	<!-- list.get(0) => mdto 객체 하나  -->
					</tr>
					<tr>
						<td style="padding-top:5px"><p style="background-color: pink; color:white;  width:110%;">가입일  &nbsp;&nbsp;&nbsp;&nbsp;</p>${fn:substring(mdto.createdate,0,10)}</td>
					</tr>
					<tr>
						<td style="padding-top:5px"><p style="background-color: pink; color:white;  width:110%;">회원 등급 </p>${mdto.grade_name}</td>
					</tr>
<!-- 					<tr>   일단 주석  -->
<!-- 						<td style="padding-top:20px"><button>프로필 사진 변경</button></td> -->
<!-- 					</tr> -->
			</table>

			</div>
			<div id="my3" style="float: left; width: 44%; height: 100%;">
				<p class="review"  style="padding-top:20px"></p>
				<p style="background-color: pink; color:white; width:19%;">리뷰</p><p>${myAct.rcnt}</p>
				<p class="favorites" style="padding-top:5px"></p>
				<p style="background-color: pink; color:white; width:19%;">즐겨찾기</p><p>${myAct.fcnt}</p>
				<p class="booking" style="padding-top:5px"></p>
				<p style="background-color: pink; color:white; width:19%;">예약</p><p>${myAct.bcnt}</p>
		</div>
	</div><!-- -----------------첫 번째 큰 단락 div 끝 -------------------->
</div>