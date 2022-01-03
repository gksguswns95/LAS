<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/signin/signin.css">
<link rel="stylesheet" href="./css/mobile.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<title>로그인</title>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/signin/signin.js"></script>
<script src="./js/error.js"></script>
<script src="./js/mobile.js"></script>
</head>
<body>
    <div class="container">
    <div class="header">
    	<a href="/">L.A.S</a>
    	<jsp:include page="./common/mobile.jsp"></jsp:include>
    </div>
	<div id="section">
			<div id="loginBox">
				<div id="login_header">
					<c:if test="${user_name != null}">
						<h2>${user_name }님 환영합니다.</h2>
						<input type="hidden" value="${user_id }" id="hiddenUserId">
					</c:if>
					<c:if test="${user_name == null}">
						<h3>로그인</h3>
					</c:if>
				</div>
				<div id="login_section">
				<c:if test="${user_name == null}">
				<form id="submit" action="/signin" method="post">
					<span id="login_inputHeader">아이디</span>
					<input type="text" id="id" class="login" name="id"  placeholder="이메일 또는 휴대번호를 입력하세요." required />
					<div id="idRemember">
						<input type="checkbox" id="idCheck"/>
						<label id="idCheck">아이디 기억하기</label>
					</div>
						<span id="login_inputHeader">비밀번호</span>
					<div class="pwArea">
						<i class="fa fa-eye fa-lg"></i>
						<input type="password" id="pw" class="login" name="pw"  placeholder="비밀번호를 입력하세요." required />
					</div>
					<input type="hidden" value="${error }" id='error'>
					<div id="capslock">CapsLock이 켜져있습니다.</div>
					<div id="fail"></div>
					<input type="submit" class="btn_submit" value="로그인">
					<input type="button" class="btn_join" value="회원가입">
					
					<div id="find">
						<a href="#" id="findId">아이디 찾기</a>
						<a href="#" id="findPw">비밀번호 찾기</a>
					</div>
				</form>
				</c:if>
				
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
<div class="transparency"></div>
</body>
</html>