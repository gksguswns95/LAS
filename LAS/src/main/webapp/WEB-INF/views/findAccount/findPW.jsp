<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/mobile.css">
<link rel="stylesheet" href="./css/modifyAccount/findIdAccount.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<title>L.A.S - 비밀번호 찾기</title>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/error.js"></script>
<script src="./js/mobile.js"></script>
<script src="./js/modifyAccount/findPW.js"></script>
</head>
<body>
    <div class="container">
    <jsp:include page="../common/header.jsp"></jsp:include>
	<div id="section">
		<div class="content">
			<h2>비밀번호 찾기</h2>
			<div class="box">
				<div class="email-box">
<!-- 				<input type="radio" name="AuthWay" checked="checked" value="email"><label>이메일</label> -->
					<div class="box-inner cf" id="email-inner">
						<form action="/namebirthidcheck" id="fm" method="post">
						<dl>
							<dt><label>아이디</label></dt>
							<dd><input type="text" name="id" id="id" maxlength="30" placeholder="가입자의 아이디를 입력하세요."></dd>
							<dt><label>이름</label></dt>
							<dd><input type="text" name="name" id="name" maxlength="6" placeholder="가입자의 본명을 입력하세요."></dd>
							<dt><label>생년월일</label></dt>
							<dd><input type="text" name="birth" id="birth" maxlength="8" placeholder="생년월일 8자리 입력하세요.(ex: 19960203)"></dd>
						</dl>
						</form>
					</div>
				</div>
				<!-- <div class="phone-box">
					<input type="radio" name="AuthWay" value="phone"> <label>휴대전화로 인증</label>
					<div class="box-inner cf" id="phone-inner">
						<dl>
							<dt><label>이름</label></dt>
							<dd><input type="text" name="phone-name" maxlength="6"></dd>
							<dt><label>핸드폰</label></dt>
							<dd><input type="text" maxlength="11" name="phone">
							<a href="#" id="phoneAuth_btn">인증번호 받기</a></dd>
							<dt><label>인증번호</label></dt>
							<dd><input type="text" disabled name="phoneAuth"><span id="emailAuthTimer"></dd>
						</dl>
					</div>
				</div> -->
				<input type="hidden" value="${param.error }" id='error'>
				<div id="fail"></div>
			</div>
			<div class="btn-area">
				<a href="#" id="nextAuth_btn">계속</a>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<div class="transparency"></div>
</body>
</html>