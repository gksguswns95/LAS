<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/signup/signup_common.css">
<link rel="stylesheet"
	href="./css/signup/signup_identityverification.css">

<link rel="stylesheet" href="./css/signin/signin.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<title>본인인증</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
</style>

</head>
<body>
	<div class="container">
		<div class="header"><a href="/">L.A.S</a></div>
		<main class="main">
			<div class="main-inner">
				<div class="title">
					<h1>계정 생성</h1>
				</div>
				<div class="content">
					
					<div class="content-form">
							<form action="/identity_verification" method="post" id="intput-form" name="input-form" autocomplete="off" class="input-form">
								<fieldset>
									<input type="hidden" value="${param.checkboxYN }" name="add_agreement">
									<div id="fieldset-id" class="fieldset-id">
										<label for="id">아이디</label>
										<input type="text" id="id" name="id" autocomplete="off" required="required" placeholder="이메일 또는 핸드폰 번호를 입력해주세요.">
										<label id="fieldset-id-error" style="display:; color: red; font-weight: 300; font-size: small;"></label>
									</div>

									<div id="fieldset-pw" class="fieldset-pw">
										<label for="pw">비밀번호</label>
										<span>(최소 8자~16자 및 특수,영문,숫자 1개 포함)</span>
										<input type="password" id="pw" name="pw" autocomplete="off" required="required">
										<label id="fieldset-pw-error" style="display:; color: red; font-weight: 300; font-size: small;"></label>
									</div>
									
									<div id="fieldset-pwcfm" class="fieldset-pwcfm">
										<label for="pwcfm">비밀번호 확인</label> 
										<input type="password" id="pwcfm" name="pwcfm" autocomplete="off" required="required">
										<label id="fieldset-pwcfm-error" style="display:; color: red; font-weight: 300; font-size: small;"></label>
									</div>

									<div id="fieldset-email" class="fieldset-email" >
										<label for="email">이메일</label>
										<input type="email" id="email" name="email" autocomplete="off" required="required" placeholder="예) test@test.com">
										<label id="fieldset-email-error" style="display:; color: red; font-weight: 300; font-size: small;"></label>
									</div>
									<div id="fieldset-mobile" class="fieldset-mobile">
										<label for="mobile">휴대폰 번호 (-없이 11자리 입력)</label>
										<input type="tel" id="mobile" name="phone" maxlength="11" autocomplete="off" placeholder="예) 01045671234" required="required">
										<label id="fieldset-mobile-error" style="display:; color: red; font-weight: 300; font-size: small;"></label>
									</div>

									<div id="fieldset-name" class="fieldset-name">
										<label for="name">이름</label>
										<input type="text" id="name" name="name" autocomplete="off" required="required">
										<label id="fieldset-name-error" style="display:; color: red; font-weight: 300; font-size: small;"></label>
									</div>

									<div id="fieldset-birth" class="fieldset-birth">
										<label for="birth">생년월일</label>
										<input type="number" class="birth" id="birth" name="birth" maxlength="8" autocomplete="off" placeholder="예) 19990113" required="required">
										<label id="fieldset-birth-error" style="display:; color: red; font-weight: 300; font-size: small;"></label>
									</div>
									
									
								</fieldset>
									<div class="under-content-button">
										<button id="btn_back">뒤로</button>
										<button type="submit" id="btn_next">다음</button>
									</div>
							</form>
					</div>
				</div>
			</div>
		</main>
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
function checkID(){
	var id = $('#id').length;
	console.log(id);
}
</script>

<script language='javascript'>
	$(document).ready(function() {
		$('#btn_back').click(function() {
			$(location).attr('href', '/terms_agreement');
		});
	});
</script>

<script language='javascript'>
$(document).ready(function() {
	
	//유효성 검사 script
	
	$('#id').on('focusout', function() {
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		var reg_phone = /^[0-9]*$/g;
		var id = $('#id').val();
		
		var phoneNumerreset = $('#id').val().replaceAll('-','');
		
			if(id == 0){
				$('#fieldset-id-error').text('필수 입력 사항입니다.');
			}
			if (reg_email.test(phoneNumerreset)) {
				$('#fieldset-id-error').css({"color":"green"});
				$('#fieldset-id-error').text('이메일 입니다.');
				$('#email').val(id);
				$('#email').prop("disabled",true);
				$('#mobile').prop("disabled",false);
				$('#mobile').val('');
			}
			else if(reg_phone.test(phoneNumerreset) && (phoneNumerreset.length == 11)&& phoneNumerreset.substring(0,3)=='010') {
				$('#fieldset-id-error').css({"color":"green"});
				$('#fieldset-id-error').text("핸드폰 번호 입니다.");
				$('#id').val(phoneNumerreset);
				$('#mobile').val(phoneNumerreset);
				$('#mobile').prop("disabled",true);
				$('#email').prop("disabled",false);
				$('#email').val('');
			}else{
				$('#fieldset-id-error').text("핸드폰 번호 또는 이메일을 입력해주세요.");
				$('#fieldset-id-error').css({"color":"red"});
				$('#mobile').prop("disabled",false);
				$('#email').prop("disabled",false);
				$('#mobile').val('');
				$('#email').val('');
				
			}
		});
	
	
	$('#pw').on('focusout', function(){
		//var reg_pw = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
		var reg_pw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/g;
		var pw = $('#pw').val();
			
		if(!reg_pw.test(pw)){
			$('#fieldset-pw-error').css({"color":"red"});
			$('#fieldset-pw-error').text('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
			$('#fieldset-pwcfm-error').text('입력하신 비밀번호와 다릅니다. 비밀번호를 다시 확인해주세요.');
			$('#fieldset-pwcfm-error').css({"color":"red"});
		}else{
			$('#fieldset-pw-error').css({"color":"green"});
			$('#fieldset-pw-error').text('사용 가능한 비밀번호 입니다.');
			$('#fieldset-pwcfm-error').text('입력하신 비밀번호와 다릅니다. 비밀번호를 다시 확인해주세요.');
			$('#fieldset-pwcfm-error').css({"color":"red"});
		}
	});
	
	$('#pwcfm').on('focusout', function(){
		var pw = $('#pw').val();
		var pwcfm = $('#pwcfm').val();
		var pwnone = $('#pw').val().length;
		var pwcfmnone = $('#pwcfm').val().length;
		
		if(pw != pwcfm){
			$('#fieldset-pwcfm-error').text('입력하신 비밀번호와 다릅니다. 비밀번호를 다시 확인해주세요.');
			$('#fieldset-pwcfm-error').css({"color":"red"});
		}
		if(pw == pwcfm){
			$('#fieldset-pwcfm-error').text('비밀번호가 동일합니다.');
			$('#fieldset-pwcfm-error').css({"color":"green"});
		}
		if(pwnone == 0 && pwcfmnone == 0){
			$('#fieldset-pwcfm-error').text('비밀번호를 입력해주세요.');
			$('#fieldset-pwcfm-error').css({"color":"red"});
		}
	});
	
	$('#email').on('focusout', function(){
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		var email = $('#email').val();
		
		if (reg_email.test(email)) {
			$('#fieldset-email-error').css({"color":"green"});
			$('#fieldset-email-error').text('이메일 입니다.');
		}else{
			$('#fieldset-email-error').css({"color":"red"});
			$('#fieldset-email-error').text('이메일 형식이 아닙니다.');
		}
	});
	
	$('#mobile').on('focusout', function(){
		var reg_mobile = /^010[0-9]*$/g;
		var mobile = $('#mobile').val();
		
		if (reg_mobile.test(mobile)) {
			$('#fieldset-mobile-error').css({"color":"green"});
			$('#fieldset-mobile-error').text('사용가능한 핸드폰 번호입니다.');
		}else{
			$('#fieldset-mobile-error').css({"color":"red"});
			$('#fieldset-mobile-error').text('핸드폰 번호 11자릿수를 정확하게 입력해주세요.');
		}
	});
	
	$('#name').on('focusout', function(){
		var name = $('#name').val().length;
		
		if(name < 2){
			$('#fieldset-name-error').css({"color":"red"});
			$('#fieldset-name-error').text('필수 입력 사항입니다.');
			return false;
		}else{
			$('#fieldset-name-error').css({"color":"green"});
			$('#fieldset-name-error').text('확인되었습니다.');
		}
	});
	
	
	$('#birth').on('focusout', function(){
		var birth = $('#birth').val().length;
		if(birth == 8){
			$('#fieldset-birth-error').css({"color":"green"});
			$('#fieldset-birth-error').text('확인되었습니다.');
		}else{
			$('#fieldset-birth-error').css({"color":"red"});
			$('#fieldset-birth-error').text('태어난 년도 8자리를 정확하게 입력해주세요.');
		}
	});
	
	
	$('#submit').submit(function() {
		if($('#fieldset-id-error').text().equals("핸드폰 번호 또는 이메일을 입력해주세요.")){
			return false;
		}
		
	});
});
</script>


<script language='javascript'>
	$(document).ready(function() {
		$('#name').keyup(function() {
			var name = $('#name').val().length;

			if (name > 20) {
				$('#name').val($(this).val().substring(0, 0));
				alert("이름은 최대 20글자까지만 가능합니다.");
				$('#name').focus();
			}
		})
	})
</script>

<script language='javascript'>
	$(document).ready(function() {
		$('#birth').keyup(function() {
			var birth = $('#birth').val().length;

			if (birth > 8) {
				$('#birth').val($(this).val().substring(0, 0));
				alert("형식을 맞게 입력해주세요");
				$('#birth').focus();
			}
		})
	})
</script>


<script language='javascript'>
	$(document).ready(function() {
		$('#btn_next').click(function() {
			/*날짜 1900년도 이하 입력시 다음페이지 이동 불가*/
			var yearmin = $('#year').val();
			if (yearmin < 1920) {
				$('#year').val($(this).val().substring(0,0));
				alert("1920년도 이하는 입력하실 수 없습니다");
				$('#year').focus();
				return false;
			}else{
				var name = $('#name').val();
				var firstname = $('#firstname').val();
				var year = $('#year').val();
				var month = $('#month').val();
				var day = $('#day').val();
				var gender = $('input:radio[name="gender"]:checked').val();
				var mobile_carrier = $('input:radio[name="mobile_carrier"]:checked').val();
				var mobilenum = $('#mobile_number').val();
				var personalinfoTA = $('input:checkbox[name="checkbox1"]:checked').val();
				var uniqueinfoTA = $('input:checkbox[name="checkbox2"]:checked').val();
				var mobileTA = $('input:checkbox[name="checkbox3"]:checked').val();
				var useTA = $('input:checkbox[name="checkbox4"]:checked').val();

			/*
			alert("name =" + name + 
				"\nfirstname =" + firstname +
				"\nyear =" + year + 
				"\nmonth =" + month +
				"\nday =" + day +
				"\ngender =" + gender +
				"\nmobile_carrier =" + mobile_carrier +
				"\nmobilenum =" + mobilenum + 
				"\npersonalinfoTA =" + personalinfoTA +
				"\nuniqueinfoTA =" + uniqueinfoTA +
				"\nmobileTA =" + mobileTA +
				"\nuseTA =" + useTA
				);
			 */
		}
	});
		
		
		
});
</script>
