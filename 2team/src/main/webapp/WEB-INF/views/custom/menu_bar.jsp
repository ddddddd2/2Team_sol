<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div id="menuBar" style="width: 100%; height: 200px;">
	<div id="myActivity" style="background-color: pink; width: 10%; height: 40px;"><a href="/myPage">나의 활동</a></div>
		<div id="mymy" style="width: 50%; height: 200px;"><!-- 첫 번째 큰 단락 div 시작 -->
			<div id="my1" style="float: left; width: 32%; height: 200px;">
				
				<img src="../resources/image/custom/businessman.png" width="100%" height="80%">
			</div>
			<div id="my2" style="float: left; width: 32%; height: 200px;">
			
			<table>
					<tr>
						<td>이 름: ${mdto.name}</td>	<!-- list.get(0) => mdto 객체 하나  -->
					</tr>
					<tr>
						<td>가입일: ${mdto.createdate}</td>
					</tr>
					<tr>
						<td>회원 등급: ${mdto.grade_name}</td>
					</tr>
					<tr>
						<td><button>사진 변경</button></td>
					</tr>
			</table>

			</div>
			<div id="my3" style="float: left; width: 32%; height: 200px;">
				<br>
					
				<p class="review">
				리뷰: ${myAct.rcnt} <!-- MyAct.rcnt (x) -->
				
				<%-- <c:choose>
					<c:when test="${madto.size()==0}">
						<tr>
							<td colspan="2">사이즈가 0일 때</td>
							<td>${madto.size()}</td>
						</tr>
					</c:when>
					<c:when test="${madto.size()!=0}">
						리뷰 ${madto.size()}
 					</c:when>
 				</c:choose> --%>
 				</p>
				<p class="favorites">
				즐겨찾기: ${myAct.fcnt}
				<%-- <c:choose>
					<c:when test="${{madto.size()==0}">
						<tr>
							<td colspan="2">사이즈가 0일 때</td>
							<td>${madto.size()}</td>
						</tr>
					</c:when>
					<c:when test="${madto.size()!=0}">
						찜한매장 ${madto.size()}
 					</c:when>
 				</c:choose> --%>
				<p class="booking">
				예약: ${myAct.bcnt}
				<%-- <c:choose>
					<c:when test="${madto.size()==0}">
						<tr>
							<td colspan="2">사이즈가 0일 때</td>
							<td>${madto.size()}</td>
						</tr>
					</c:when>
					<c:when test="${madto.size()!=0}">
						예약횟수 ${madto.size()}
 					</c:when>
 				</c:choose> --%>
 			</p>
		</div>
	</div><!-- -----------------첫 번째 큰 단락 div 끝 -------------------->
</div>
