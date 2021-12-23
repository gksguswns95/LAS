<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String lastname = request.getParameter("lastname");
	String firstname = request.getParameter("firstname");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
%>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/signup/signup_common.css">
<link rel="stylesheet" href="./css/signup/signup_createaccount.css">
<title>계정 만들기</title>


<style>
</style>

</head>
<body>
	<header>
		<div class="header">
			<div class="header-inner">
				<div class="logo">
					<h1>Account</h1>
				</div>
			</div>
		</div>
	</header>
	
	<main class="ma">
	<div class="main">
		<div class="main-inner">
			<div class="container">
				<div class="title">
					<h1>계정 만들기</h1>
				</div>
				<div class="signup-id-mail">계정으로 사용할 이메일 주소를 입력하세요. 
					<a href="create_account" id="signup-id-mail-to-phone">전화번호를 사용하려면 여기를 누르세요</a>.
				</div>
				<div class="signup-id-phonenum" style="display: none;">계정으로 사용할 전화번호를 입력하세요. 
					<a href="create_account" id="signup-id-phone-to-mail">이메일을 사용하려면 여기를 누르세요</a>.
				</div>
				
				<div class="content">
					<div class="content-form">
							<form name="signup-form" autocomplete="off" class="signup-form">
								<fieldset>
									<div id="signup-form-id" class="signup-form-id">									
										<label id="lb-id" for="signup-id">이메일</label>
										<input id="signup-id" name="signup-id" type="email">
									</div>
									<div id="signup-form-pw" class="signup-form-pw">
										<label id="lb-pw" for="signup-pw">비밀번호</label>
										<input id="signup-pw" name="signup-pw" type="password">
									</div>
									<div id="signup-form-pwcfm" class="signup-form-pwcfm">
										<label id="lb-pwcfm" for="signup-pwcfm">비밀번호 확인</label>
										<input id="signup-pwcfm" name="signup-cfm" type="password">
									</div>
									<div id="signup-form-lastname" class="signup-form-lastname">
										<label id="lb-lastname" for="signup-lastname">성</label>
										<input id="signup-lastname" name="signup-lastname" type="text" value="<%= lastname %>">
									</div>
									<div id="signup-form-firstname" class="signup-form-firstname">
										<label id="lb-firstname" for="signup-firstname">이름</label> 
										<input id="signup-firstname" name="signup-firstname" type="text" value="<%= firstname %>">
									</div>
									
									<div>
											<br>
											<input type="text" id="year" name="year" value="<%= year %>">
											<label for="year">년</label>
											
											<input type="text" id="month" name="month" value="<%= month %>">
											<label for="month">월</label>
											
											<input type="text" id="day" name="day" value="<%= day %>">
											<label for="day">일</label>
									</div>
								</fieldset>
							</form>
						</div>	
					</div>
				<div class="under-content">
					<div class="under-content-button">
						<button id="btn_back">뒤로</button>
						<button id="btn_next">다음</button>
					</div>
				</div>
			</div>
		</div>
		</div>
	</main>
	
	<footer>
	</footer>
</body>
</html>

<script language='javascript'>
$(document).ready(function() {
	$('#btn_back').click(function() {
		$(location).attr('href','/identity_verification');
	});
});
</script>

<script language='javascript'>
$(document).ready(function() {
	$('#btn_next').click(function() {
		
		var signup_id = $('#signup-id').val();
		var signup_pw = $('#signup-pw').val();
		var signup_pwcfm = $('#signup-pwcfm').val();
		
		/*
		alert("signup_id =" + signup_id + 
				"\nsignup_pw =" + signup_pw +
				"\nsignup_pwcfm =" + signup_pwcfm);
		*/
		$(location).attr('href','/welcome');
	});
});
</script>

<script language='javascript'>
	$(document).ready(function() {
		$('#signup-id-mail-to-phone').click(function() {
			$('.signup-id-phonenum').css('display',"");
			$('.signup-id-mail').css('display',"none");
			$('#lb-id').text("전화번호");
			alert("아이디 사용을 전화번호로 변경하였습니다.");
		});
		$('#signup-id-phone-to-mail').click(function() {
			$('.signup-id-phonenum').css('display',"none");
			$('.signup-id-mail').css('display',"");
			$('#lb-id').text("이메일");
			alert("아이디 사용을 이메일로 변경하였습니다.");
		});
	});
</script>
				
				


