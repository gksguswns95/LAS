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
<link rel="stylesheet" href="./css/mobile.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/signin/signin.js"></script>
<script src="./js/modifyAccount/myAccountInformation.js"></script>
<script src="./js/mobile.js"></script>
</head>
<body>
    <div class="container">
    <jsp:include page="../common/header.jsp"></jsp:include>
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
					<p>핸드폰 : <label id="phone">${user_phone}</label></p>
					<p>생년월일 : ${user_birth}</p>
					<a href="./confirmAccountPassword">회원정보수정</a>
					<a href="./withdrawal">회원탈퇴</a>
				
				</div>
			</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	<div class="transparency"></div>
</body>
</html>