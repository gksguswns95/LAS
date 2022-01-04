<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="header">
    <a href="/">L.A.S</a>
	<div class="signinMenu">
		<c:if test="${user_name != null}">
			<a href="./signout">로그아웃</a>
			<a href="./myAccountInformation">마이페이지</a>
		</c:if>
		<c:if test="${user_name == null}">
			<a href="./signin">로그인</a>
		</c:if>
	</div>
	
	<img alt="btn" src="./img/gnb_btn.png" id="mobile_btn">
	<div class="mobile_nav">
		<ul>
			<li><a href="./signin">L.A.S HOME</a></li>
			<c:if test="${user_name != null}">
				<li><a href="./myAccountInformation">MyPage</a></li>
				<li><a href="./signout">Logout</a></li>
			</c:if>
			<c:if test="${user_name == null}">
				<li><a href="./signin">Login</a></li>
			</c:if>
		</ul>
	</div>
</div>