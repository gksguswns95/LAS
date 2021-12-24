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
<script src="./js/error.js"></script>
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
			<div id="DeleteBox">
				<div id="delete_section">
					<h2>회원정보수정 - 비밀번호확인</h2>
					<form action="/modifyAccountPassword" method="post" id="modifyPasswordCheck">
						<div id="inputArea">
							<p>아이디</p>
							<input type="text" name="id" id="id" disabled="disabled" value="${user_id }" required>
							<p>현재 비밀번호</p>
							<input type="password" name="pw" id="pw" required placeholder="비밀번호를 입력해주세요.">
							<p>변경 할 비밀번호</p>
							<input type="password" name="changePw" id="changePw" required placeholder="비밀번호를 다시한번 입력해주세요.">
							<p>변경 할 비밀번호확인</p>
							<input type="password" name="changePwCheck" id="changePwCheck" required placeholder="비밀번호를 다시한번 입력해주세요.">
							<input type="hidden" value="${error }" id='error'>
							<div id="fail"></div>
							<div id="submit_btn">
								<button type="submit">확인</button>
								<button type="button" id="cancle_btn">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="footer">
			<a href="#">공지사항</a>
			<a href="#">문의하기</a>
			<a href="#">이용약관</a>
			<a href="#">개인정보</a>
			<a href="#">처리방침</a>
			<p>Copyright ⓒ 2022 LG Electronics. All Rights Reserved</p>
		</div>
	</div>
</body>
</html>