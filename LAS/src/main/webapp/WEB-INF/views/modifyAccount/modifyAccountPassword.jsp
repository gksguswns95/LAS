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
<link rel="stylesheet" href="./css/mobile.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/signin/signin.js"></script>
<script src="./js/modifyAccount/modify.js"></script>
<script src="./js/deleteAccount/withdrawal.js"></script>
<script src="./js/error.js"></script>
<script src="./js/mobile.js"></script>
</head>
<body>
    <div class="container">
	    <jsp:include page="../common/header.jsp"></jsp:include>
		<div id="section">
			<div id="DeleteBox">
				<div id="delete_section">
					<h2>회원정보수정 - 비밀번호확인</h2>
					<form action="/modifyAccountPassword" method="post" id="modifyPasswordCheck">
						<div id="inputArea">
							<p>아이디</p>
							<input type="text" name="id" id="id" class="login" disabled="disabled" value="${user_id }" required>
							<p>현재 비밀번호</p>
							<input type="password" name="pw" id="pw" class="login" required placeholder="비밀번호를 입력해주세요.">
							<p>새로운 비밀번호</p>
							<input type="password" name="changePw" id="changePw" class="login" required placeholder="비밀번호를 다시한번 입력해주세요.">
							<p>새로운 비밀번호확인</p>
							<input type="password" name="changePwCheck" id="changePwCheck" class="login" required placeholder="비밀번호를 다시한번 입력해주세요.">
							<input type="hidden" value="${error }" id='error'>
							<div id="capslock">CapsLock이 켜져있습니다.</div>
							<div id="fail"></div>
							<div id="submit_btn">
								<button type="submit" id="passwordSubmit_btn" disabled="disabled">확인</button>
								<button type="button" id="cancle_btn">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	<div class="transparency"></div>
</body>
</html>