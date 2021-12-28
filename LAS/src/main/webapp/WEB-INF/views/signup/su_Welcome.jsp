<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="./css/footer.css">
<link rel="stylesheet" href="./css/header.css">

<link rel="stylesheet" href="./css/signup/signup_welcome.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />

<title>Welcome</title>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/signin/signin.js"></script>

</head>
<body>
	<div class="container">
		<div class="header"><a href="/">L.A.S</a><img alt="btn" src="./img/gnb_btn.png">
		</div>
		<div id="section" align="center">
			<div id="WelcomeBox">
				<div id="Welcome_header">
					<h3>환영합니다!</h3>
				</div>
				<div id="Welcome_body">
					<span>회원가입이 완료되었습니다.</span>
					<br>
					<span>로그인 페이지로 이동하시겠습니까?</span>
					<br>
					<div>
					<button id="btn_main">로그인 페이지로 이동</button>
					</div>
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
</body>
</html>

<script>
	$(document).ready(function() {
		$('#btn_main').click(function() {
			$(location).attr('href', '/signin');
		});
	});
</script>