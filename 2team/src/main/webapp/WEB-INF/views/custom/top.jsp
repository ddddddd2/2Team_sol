<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
	<header id="header">
			<div id="logo">
				<a href="/" ><img src="../resources/image/custom/logo.gif" alt="toplogo"></a>
			</div>
			<div id="space">
				<div id="search">
					<form method="post" action="">
						<div>
<<<<<<< HEAD
							<select id="select">
								<option value="구선택">구선택</option>
								<option value="중랑구">중랑구</option>
								<option value="종로구">종로구</option>
								<option value="방구">방구</option>
							</select>
						</div>
						<div class="search">
=======
>>>>>>> refs/heads/newMaster
							<input type="text" id="keyword">
							<input type="submit" id="searchAction" value="검색">
						</div>
					</form>
				</div>
			</div>
				<ul class="lnb">
				<c:choose>
					<c:when test="${idKey == null}">
						<li class="select_list"><a href="/custom/login" class="selected">로그인</a>
							<ul class="select_sub">
								<li><a href="#">뭐나옴??</a></li>
								<li><a href="#">뭐나옴??</a></li>
							</ul>
						</li>
						<li><a href="/custom/signUp">회원가입</a></li>
					</c:when>
					<c:when test="${idKey != null}">
						<li class="select_list">
							<a href="/logout" class="selected">로그아웃</a>
							<ul class="select_sub">
								<li><a href="#">뭐나옴??</a></li>
								<li><a href="#">뭐나옴??</a></li>
							</ul>
						</li>

						<li><a href="/myPage">마이페이지</a></li>
					</c:when>
				</c:choose>
			</ul>

		</header><!-- //header -->