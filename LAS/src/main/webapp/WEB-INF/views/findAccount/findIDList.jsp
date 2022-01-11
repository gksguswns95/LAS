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
<link rel="stylesheet" href="./css/modifyAccount/findIdAccountList.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<title>L.A.S - 아이디 찾기</title>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/error.js"></script>
<script src="./js/mobile.js"></script>
<script src="./js/modifyAccount/findID.js"></script>
</head>
<body>
    <div class="container">
    <jsp:include page="../common/header.jsp"></jsp:include>
	<div id="section">
		<div class="content">
			<h2>아이디 찾기 - ID 목록</h2>
			<div class="box">
				<div class="email-box">
<!-- 				<input type="radio" name="AuthWay" checked="checked" value="email"><label>이메일</label> -->
					<div class="box-inner cf" id="email-inner">
						<label>${emailCount }개의 이메일 ID를 찾았습니다.</label>
						<dl>
							<dt>가입날짜</dt>
							<dd>아이디</dd>
							<c:forEach items="${findIdList }" var="emailList">
								<c:if test="${emailList.signup_type eq 'email' }">
									<dt>${emailList.signup_date }</dt>
									<dd>${emailList.id }</dd>
								</c:if>
							</c:forEach>
						</dl>
					</div>
					<div class="box-inner cf" id="phone-inner">
						<label>${phoneCount }개의 핸드폰 ID를 찾았습니다.</label>
						<c:if test="${phoneCount > 0}">
						<dl>
							<dt>가입날짜</dt>
							<dd>아이디</dd>
							<c:forEach items="${findIdList }" var="phoneList">
								<c:if test="${phoneList.signup_type eq 'phone' }">
									<dt>${phoneList.signup_date }</dt>
									<dd>${phoneList.id }</dd>
								</c:if>
							</c:forEach>
						</dl>
						</c:if>
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
			</div>
			<div class="btn-area">
				<a href="/signin" id="nextLogin_btn">로그인 바로가기</a>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<div class="transparency"></div>
</body>
</html>