<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/modifyAccount/myAccountInformation.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/signin/signin.js"></script>
<script src="./js/modifyAccount/myAccountInformation.js"></script>
</head>
<body>
    <div class="container">
    <div class="header">
    	<a href="/">L.A.S</a>
    	<div class="signinMenu">
	    	<c:if test="${user_name != null}">
				<a href="./signout">로그아웃</a>
				<a href="./myAccountInformation">마이페이지</a>
			</c:if>
		</div>
    	<img alt="btn" src="./img/gnb_btn.png">
    </div>
	<div id="section">
			<div id="loginBox">
				<div id="login_header">
					<h2>${user_name }님 안녕하세요.</h2>
					<input type="hidden" value="${user_id }" id="hiddenUserId">
				</div>
				<div id="login_section">
					<p>아이디 : ${user_id}</p>
					<p>이름 : ${user_name}</p>
					<p>이메일 : ${user_email}</p>
					<p>핸드폰 : <input type="text" id="phone" value="${user_phone}" disabled="disabled"></p>
					<p>생년월일 : ${user_birth}</p>
					<a href="./confirmAccountPassword">회원정보수정</a>
					<a href="./withdrawal">회원탈퇴</a>
				
				</div>
			</div>
	</div>
	<div class="footer">
			<a href="#">공지사항</a>
			<a href="#">문의하기</a>
			<a href="#">이용약관</a>
			<a href="#" id="bold">개인정보 처리방침</a>
			<p>Copyright ⓒ 2022 EvolveSoft</p>
		</div>
</div>
</body>
</html>