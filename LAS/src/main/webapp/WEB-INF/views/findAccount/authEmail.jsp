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
<link rel="stylesheet" href="./css/modifyAccount/authemail.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<title>L.A.S - 비밀번호 찾기</title>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/error.js"></script>
<script src="./js/mobile.js"></script>
<script src="./js/modifyAccount/findPW.js"></script>
<script src="./js/modifyAccount/authEmail.js"></script>
</head>
<body>
    <div class="container">
    <jsp:include page="../common/header.jsp"></jsp:include>
	<div id="section">
		<div class="content">
			<h2>비밀번호 찾기 - 이메일 인증</h2>
			<div class="box">
				<div class="email-box">
					<form action="/pwemailauth" id="fm" method="post">
					<div class="email-box-header">
						<span>아래의 이메일로 전송된 인증번호를 입력하세요.</span>
						<label id="member_email">${customer_id } </label><a href="#" class="authResned_btn">인증번호 재전송</a>
						<input type="hidden" value="${customer_id }" name="id" id="id">
					</div>
						<div class="box-inner cf" id="email-inner">
							<label id="authInputLabel">인증번호</label>
							<span id="emailAuthTimer"></span>
							<input type="text" name="emailAuth" id="emailAuth" maxlength="8"> 
						</div>
					</form>
				</div>
				<input type="hidden" value="${param.error }" id='error'>
				<div id="fail"></div>
			</div>
			<div class="btn-area">
				<a href="#" id="emailAuthCheck_btn">인증번호 확인</a>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<div class="transparency"></div>
</body>
</html>