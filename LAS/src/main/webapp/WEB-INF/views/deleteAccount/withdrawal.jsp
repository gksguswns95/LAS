<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/deleteAccount/withdrawal.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/signin/signin.js"></script>
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
					<h2>회원탈퇴</h2>
					<p>회원 탈퇴 전 아래 사항을 확인해주시기 바랍니다.<br><br>
					<span id="red">- 한 번 탈퇴한 아이디는 다시 사용이 불가합니다.</span><br><br>
					- 탈퇴 시 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당정보를 지체없이 파기 합니다. 단, 일부 정보에 대해서는 부정이용 방지 및 관계법령의 규정에 의하여 일정 기간 보관합니다.<br><br><br>
					회원님의 계정을 다시 한번 확인합니다.</p>
					<form action="/withdrawal" method="post" id="withdrawalAccount">
						<div id="inputArea">
							<p>탈퇴 사유</p>
							<input type="radio" value="1" name="reason" class="reason" required><span>중복된 다른 계정이 있어요</span>
							<input type="radio" value="2" name="reason" class="reason" required><span>원하는 서비스가 없어요</span>
							<input type="radio" value="3" name="reason" class="reason" required><span>서비스 이용이 불편해요</span>
							<input type="radio" value="4" name="reason" class="reason" required><span>사용빈도가 낮아요</span>
							<input type="radio" value="5" name="reason" class="reason" required><span>개인정보가 걱정되어요</span>
							<input type="radio" value="6" name="reason" class="reason" required><span>기타</span>
							<div class="reasonOther"><input type='text' name='reasonOther' id="other"></div>
							ID : <input type="text" id="id" disabled="disabled" value="${user_id }">	
							<i class="fa fa-eye fa-lg"></i>
							PW : <input type="password" id="pw" class="login" name="pw"  placeholder="비밀번호를 입력하세요." required />
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