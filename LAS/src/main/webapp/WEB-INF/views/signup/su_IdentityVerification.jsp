<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/signup/signup_common.css">
<link rel="stylesheet"
	href="./css/signup/signup_identityverification.css">

<link rel="stylesheet" href="./css/signin/signin.css">
<link rel="stylesheet" href="./css/mobile.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<title>본인인증</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="./js/mobile.js"></script>
<style>
</style>

</head>
<body>
	<div class="container">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<main class="main">
			<div class="main-inner">
				<div class="title">
					<h1>계정 생성</h1>
				</div>
				<div class="content">
					
					<div class="content-form">
							<form action="/identity_verification" method="post" id="intput-form" name="input-form" class="input-form">
								<fieldset>
									<input type="hidden" value="${paramValues.checkboxYN[2] }" name="add_agreement">
									<div id="fieldset-id" class="fieldset-id">
										<label for="id">아이디</label>
										<input type="text" id="id" name="id" required="required" placeholder="이메일 또는 핸드폰 번호를 입력해주세요." />
										<label id="fieldset-id-error" style="display:; color: red; font-weight: 300; font-size: small;"></label>
										<p id="insert-id" hidden="true" style="font-weight: 500; font-size: small;"></p>
										<p id="check-id" hidden="true" style="font-weight: 500; font-size: small;"></p>
									</div>
									
									<!-- hidden -->
									<div id="fieldset-signup-type" class="fieldset-signup-type" hidden="true">
										<label for="signup_type">가입경로</label>
										<input type="text" class="signup_type" id="signup_type" name="signup_type">
									</div>

									<div id="fieldset-pw" class="fieldset-pw">
										<label for="pw">비밀번호</label>
										<span>(최소 8자~16자 및 특수,영문,숫자 1개 포함)</span>
										<input type="password" id="pw" name="pw" required="required">
										<label id="fieldset-pw-error" style="display:; color: red; font-weight: 300; font-size: small;"></label>
									</div>
									
									<div id="fieldset-pwcfm" class="fieldset-pwcfm">
										<label for="pwcfm">비밀번호 확인</label> 
										<input type="password" id="pwcfm" name="pwcfm" required="required">
										<label id="fieldset-pwcfm-error" style="display:; color: red; font-weight: 300; font-size: small;"></label>
									</div>

									<div id="fieldset-email" class="fieldset-email" >
										<label for="email">이메일</label>
										<input type="email" id="email" name="email" required="required" placeholder="예) example@example.com">
										<label id="fieldset-email-error" style="display:; color: red; font-weight: 300; font-size: small;"></label>
									</div>
									<div id="fieldset-mobile" class="fieldset-mobile">
										<label for="mobile">휴대폰 번호 (-없이 11자리 입력)</label>
										<input type="tel" id="mobile" name="phone" maxlength="11" placeholder="예) 01045671234" required="required">
										<label id="fieldset-mobile-error" style="display:; color: red; font-weight: 300; font-size: small;"></label>
									</div>

									<div id="fieldset-name" class="fieldset-name">
										<label for="name">성명</label>
										<input type="text" id="name" name="name" required="required">
										<label id="fieldset-name-error" style="display:; color: red; font-weight: 300; font-size: small;"></label>
									</div>

									<div id="fieldset-birth" class="fieldset-birth">
										<label for="birth">생년월일</label>
										<input type="number" class="birth" id="birth" name="birth" maxlength="8" placeholder="예) 19990113" required="required">
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
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	<div class="transparency"></div>
</body>
</html>

<!-- 
<script>
function checkID(){
	var id = $('#id').length;
}
</script>
 -->

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
		var idlength = $('#id').val().length;
		var phoneNumerreset = $('#id').val().replaceAll('-','');
		
			if(id == 0){
				$('#fieldset-id-error').text('필수 입력 사항입니다.');
			}
			if (reg_email.test(phoneNumerreset)) {
				/* $('#fieldset-id-error').css({"color":"green"});
				$('#fieldset-id-error').text('이메일 입니다.'); */
				$('#fieldset-id-error').text('');
				$('#email').val(id);
				$('#email').prop("readonly",true);
				$('#mobile').prop("readonly",false);
				$('#mobile').val('');
				$('#insert-id').hide();
				$('#signup_type').val('email');
				checkid(id);	
				//$('#signup_type').prop("readonly",true);
			}
			else if(reg_phone.test(phoneNumerreset) && (phoneNumerreset.length == 11)&& phoneNumerreset.substring(0,3)=='010') {
				/* $('#fieldset-id-error').css({"color":"green"});
				$('#fieldset-id-error').text("핸드폰 번호 입니다."); */
				$('#fieldset-id-error').text('');
				$('#id').val(phoneNumerreset);
				$('#mobile').val(phoneNumerreset);
				$('#mobile').prop("readonly",true);
				$('#email').prop("readonly",false);
				$('#email').val('');
				$('#insert-id').hide();
				$('#signup_type').val('phone');
				checkid(id);
			}else{
				if(idlength == 0){
					$('#insert-id').hide();
					$('#insert-id').css('color', 'red');
				}else{
					$('#insert-id').css('color', 'red');
					$('#insert-id').text("입력하신\t"+ id + "\t는 사용하실 수 없습니다.")
					$('#insert-id').show();
					$('#check-id').hide();
				}
				$('#fieldset-id-error').text("핸드폰 번호 또는 이메일을 입력해주세요.");
				$('#fieldset-id-error').css({"color":"red"});
				$('#mobile').prop("readonly",false);
				$('#email').prop("readonly",false);
				$('#mobile').val('');
				$('#email').val('');
				$('#id').val('');
				$('#signup_type').val('');
			}
		});
	
	function checkid(id){
        $.ajax({
           url:'/idCheck', //Controller에서 인식할 주소
            type:'post', //POST 방식으로 전달
            data:{id:id},
            success:function(cnt) { ////컨트롤러에서 넘어온 cnt값을 받는다 
            	if(cnt != 1){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
            		$('#check-id').show();
            		$('#fieldset-id-error').hide();
            		$('#check-id').css({"color":"green"});
        			$('#check-id').text('입력하신\t'+ id + '\t는(은) 사용 가능합니다.');
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                	$('#fieldset-id-error').show();
                	$('#check-id').css({"color":"red"});
                	$('#check-id').css({"color":"red"});
                	$('#check-id').text('입력하신\t'+ id + '\t는(은) 이미 사용중입니다.');
        			$('#id').val('');
        			$('#check-id').show();
                }
            	
            },
            error:function(){
            	alert("에러입니다");
            }
        });
    };
	
	
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
				$('#fieldset-name-error').css({"color":"red"});
				$('#fieldset-name-error').text('이름은 20글자를 넘길 수 없습니다.');
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
				$('#fieldset-birth-error').css({"color":"red"});
				$('#fieldset-birth-error').text('생년월일 8자릿수를 정확하게 입력해주세요.');
				$('#birth').focus();
			}
		})
	})
</script>
