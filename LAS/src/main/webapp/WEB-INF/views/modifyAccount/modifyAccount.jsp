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
<title>L.A.S - 회원정보 수정</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/signin/signin.js"></script>
<script src="./js/modifyAccount/modify.js"></script>
<script src="./js/deleteAccount/withdrawal.js"></script>
<script src="./js/mobile.js"></script>
</head>
<body>
    <div class="container">
	    <jsp:include page="../common/header.jsp"></jsp:include>
		<div id="section">
			<div id="DeleteBox">
				<div id="delete_section">
					<h2>회원정보수정 - 개인정보수정</h2>
					<form action="/modifyAccount" method="post" id="modifyAccount">
						<div id="inputArea">
							<p>아이디<a href="/modifyAccountPassword" id="passwordChange">비밀번호 변경</a></p>
							<label>${user_id }</label>
							<input type="hidden" name="id" id="id" disabled="disabled" value="${user_id }" required>
							<p>이름</p>
							<label>${user_name }</label>
							<input type="hidden" name="name" id="name" value="${user_name }" disabled="disabled" required>
							<p>이메일</p>
							<input type="text" name="email" id="email" value="${user_email }" required <c:if test="${ user_signuptype == 'email'}">disabled="disabled"</c:if>>
							<p>핸드폰</p>
							<input type="text" name="phone" id="phone" value="${user_phone }" required <c:if test="${ user_signuptype == 'phone'}">disabled="disabled"</c:if>>
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
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	<div class="transparency"></div>
</body>
</html>