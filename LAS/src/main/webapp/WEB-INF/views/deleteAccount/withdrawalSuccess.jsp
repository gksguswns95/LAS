<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/deleteAccount/withdrawalSuccess.css">
<link rel="stylesheet" href="./css/mobile.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/signin/signin.js"></script>
<script src="./js/deleteAccount/withdrawal.js"></script>
<script src="./js/mobile.js"></script>
</head>
<body>
    <div class="container">
    <jsp:include page="../common/header.jsp"></jsp:include>
	<div id="section">
			<div id="DeleteBox">
				<div id="delete_section">
					<h2>회원탈퇴</h2>
					<span>회원 탈퇴가 성공적으로 완료되었습니다.</span>
					<button type="button" class="cancle_btn">메인으로</button>
				</div>
			</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
<div class="transparency"></div>
</body>
</html>