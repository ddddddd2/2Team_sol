<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div id="menuBar" style="width: 100%; height: 200px;">
	<div id="myActivity" style="background-color: pink; width: 14%; height: 40px; margin-left:2%; float:left;"><a href="/myPage">나의 활동</a></div>
	<div id="mymy" style="width: 80%; height: 150px; margin-left: 20%"><!-- 첫 번째 큰 단락 div 시작 -->
			<div id="my1" style="float: left; width: 32%; height: 100%">
				<img src="../resources/image/custom/businessman.png" height="80%" style="margin: 20px;"></div>
			<div id="my2" style="float: left; width: 32%; height: 100%">
			
			<table>
					<tr>
						<td style="padding-top:20px">이 름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ${mdto.name}</td>	<!-- list.get(0) => mdto 객체 하나  -->
					</tr>
					<tr>
						<td style="padding-top:5px">가입일  &nbsp;&nbsp;&nbsp; : ${fn:substring(mdto.createdate,0,10)}</td>
					</tr>
					<tr>
						<td style="padding-top:5px">회원 등급 : ${mdto.grade_name}</td>
					</tr>
					<tr>
						<td style="padding-top:20px"><button>프로필 사진 변경</button></td>
					</tr>
			</table>

			</div>
			<div id="my3" style="float: left; width: 32%; height: 100%;">
				<p class="review"  style="padding-top:20px">
				리뷰: ${myAct.rcnt} 
 				</p>
				<p class="favorites" style="padding-top:5px">
				즐겨찾기: ${myAct.fcnt}
				<p class="booking" style="padding-top:5px">
				예약: ${myAct.bcnt}
 			</p>
		</div>
	</div><!-- -----------------첫 번째 큰 단락 div 끝 -------------------->
</div>