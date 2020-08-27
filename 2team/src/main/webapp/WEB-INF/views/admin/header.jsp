<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="height:30px"><a href="/">관리자 페이지</a>
<c:choose>
	<c:when test="${mdto.role==null || str.trim().equals('')}">
	<input type="button" value="로그인" onclick="document.location.href='/admin/login'" />
	
	</c:when>
	<c:when test="${mdto.role=='admin'}">
	<input type="button" value="로그아웃" onclick="document.location.href='/logout'" />
	</c:when>
</c:choose>

</div>
<div id="menu">
	<ul>
		<!-- 매장 등록, 수정, 리뷰관리?도 같이. -->
		<li data-id="store_manage" class="menu"><a href="/admin/store_manage">매장 관리</a></li>
		<!-- 회원 정보 수정, 탈퇴 처리. -->
		<li data-id="mem_manage" class="menu"><a href="/admin/mem_manage">회원 관리</a></li>

		<!-- 결제 취소 -->
		<li data-id="reserv_manage" class="menu"><a href="/admin/reserv_manage">예약 관리</a></li>

		<!-- 음식점별 매출 현황 / 사장님 페이지를 별도로 만들어야하나? 그럼 role도 추가되고..-->
		<li data-id="report" class="menu"><a href="/admin/report">매출 현황</a></li>
	</ul>
</div>