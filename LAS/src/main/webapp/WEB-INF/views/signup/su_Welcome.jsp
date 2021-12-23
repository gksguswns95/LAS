<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="./css/footer.css">
<link rel="stylesheet" href="./css/header.css">

<link rel="stylesheet" href="./css/signin/signin.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />

<title>Welcome</title>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>

</head>
<body>
	<div class="container">
		<div class="header">
			Header <img alt="btn" src="./img/gnb_btn.png">
		</div>
		<div class="nav">Nav</div>
		<div id="section">
			<div id="loginBox">
				<div id="login_header">
					<h3>환영합니다!</h3>
				</div>
				<div id="login_section">

					<span id="login_inputHeader">회원가입이 완료되었습니다.</span> <span
						id="login_inputHeader">로그인 페이지로 이동하시겠습니까?</span>
					<button type="button" id="btn_gomain">로그인 페이지로 이동</button>
				</div>
			</div>
		</div>
		<div class="footer">Footer</div>
	</div>
</body>
</html>

<script>
	$(document).ready(function() {
		$('#btn_gomain').click(function() {
			$(location).attr('href', '/signin');
		});
	});
</script>