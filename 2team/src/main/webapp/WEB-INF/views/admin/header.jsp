<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="menu">
	<div style="height:30px">관리자 페이지</div>
	<ul>
		<!-- 매장 등록, 수정, 리뷰관리?도 같이. -->
		<a href="/admin/store_manage"><li data-id="store_manage" class="menu">매장 관리</li></a>

		<!-- 회원 정보 수정, 탈퇴 처리. -->
		<a href="/admin/mem_manage"><li data-id="mem_manage" class="menu">회원 관리</li></a>

		<!-- 결제 취소 -->
		<a href="/admin/reserv_manage"><li data-id="reserv_manage" class="menu">예약 관리</li></a>

		<!-- 음식점별 매출 현황 / 사장님 페이지를 별도로 만들어야하나? 그럼 role도 추가되고..-->
		<a href="/admin/report"><li data-id="report" class="menu">매출 현황</li></a>
	</ul>
</div>