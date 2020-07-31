<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="menu">
	<ul>
		<!-- 매장 등록, 수정, 리뷰관리?도 같이. -->
		<a href="/admin/mem_manage"><li data-id="st_manage" class="menu">매장 관리</li></a>
		<!-- 회원 정보 수정, 탈퇴 처리. -->
		<li data-id="mem_manage" class="menu">회원 관리</li>

		<!-- 결제 취소 -->
		<li data-id="reserv_manage" class="menu">예약 관리</li>

		<li data-id="report" class="menu">매출 현황</li>
		<!-- 음식점별 매출 현황 / 사장님 페이지를 별도로 만들어야하나? 그럼 role도 추가되고..-->
	</ul>
</div>