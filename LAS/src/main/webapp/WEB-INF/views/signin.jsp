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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/signin/signin.js"></script>
</head>
<body>
    <div class="container">
    <div class="header">
    	<a href="/">Evolve</a>
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
					<c:if test="${user_name != null}">
						<h2>${user_name }님 로그인 성공</h2>
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
	<div class="footer">Footer</div>
</div>
</body>
</html>