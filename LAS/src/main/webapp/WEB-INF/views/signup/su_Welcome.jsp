<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="./css/footer.css">
<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet" href="./css/mobile.css">
<link rel="stylesheet" href="./css/signup/signup_welcome.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />

<title>Welcome</title>
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="./js/signin/signin.js"></script>
<script src="./js/mobile.js"></script>

</head>
<body>
	<div class="container">
		<jsp:include page="../common/header.jsp"></jsp:include>
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
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	<div class="transparency"></div>
</body>
<script>
	$(document).ready(function() {
		$('#btn_main').click(function() {
			$(location).attr('href', '/signin');
		});
	});
</script>
</html>
