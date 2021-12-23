<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/modifyAccount/modifyAccount.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/signin/signin.js"></script>
<script src="./js/modifyAccount/modify.js"></script>
<script src="./js/deleteAccount/withdrawal.js"></script>
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
			<div id="DeleteBox">
				<div id="delete_section">
					<h2>회원정보수정</h2>
					<form action="/modifyAccount" method="post">
						<div id="inputArea">
							<p>아이디</p>
							<input type="text" name="id" id="id" disabled="disabled" value="${user_id }" required>
							<p>비밀번호</p>
							<input type="password" name="pw" id="pw" required placeholder="비밀번호를 입력해주세요.">
							<p>비밀번확인</p>
							<input type="password" name="pwCheck" id="pwCheck" required placeholder="비밀번호를 다시한번 입력해주세요.">
							<p>성</p>
							<input type="text" name="last_name" id="last_name" value="${user_lastName }" disabled="disabled" required>
							<p>이름</p>
							<input type="text" name="first_name" id="first_name" value="${user_firstName }" disabled="disabled" required>
							<p>이메일</p>
							<input type="text" name="email" id="email" value="${user_email }" required <c:if test="${ user_signuptype == 'email'}">disabled="disabled"</c:if>>
							<p>핸드폰</p>
							<input type="text" name="phone" id="phone" value="${user_phone }" required <c:if test="${ user_signuptype == 'phone'}">disabled="disabled"</c:if>>
							<div id="submit_btn">
								<button type="submit">확인</button>
								<button type="button" id="cancle_btn">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="footer">Footer</div>
	</div>
</body>
</html>