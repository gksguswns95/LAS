$(document).ready(function() {
	$('#btn_back').click(function() {
		$(location).attr('href', '/terms_agreement');
	});
	
	var mailAuth_btnBool = true;
	var idAuthCheckBool = false;
	$('#id').on('focusout', function() {
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		var reg_phone = /^[0-9]*$/g;
		var id = $('#id').val();
		var idlength = $('#id').val().length;
		var phoneNumerreset = $('#id').val().replaceAll('-','');
		
			if(id == 0){
				$('#id-error-txt').text('필수 입력 사항입니다.');
			}
			if (reg_email.test(phoneNumerreset)) {	//이메일인지 체크
				$('#id-error-txt').text('');
				$('#signup_type').val('email');
				checkid(id);
			}
			else if(reg_phone.test(phoneNumerreset) && (phoneNumerreset.length == 11)&& phoneNumerreset.substring(0,3)=='010') {
				$('#id-error-txt').text('');
				$('#id').val(phoneNumerreset);
				$('#signup_type').val('phone');
				checkid(phoneNumerreset);
			}else{
				if(idlength == 0){
					$('#id-error-txt').text('');
				}else{
					$('.field input')[0].error();
					$('#id-error-txt').css('color', 'red');
					$('#id-error-txt').text("제대로된 이메일 및 핸드폰번호를 입력하세요.")
				}
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
            		$('#id-error-txt').css({"color":"green"});
        			$('#id-error-txt').text('입력하신\t'+ id + '\t는(은) 사용 가능합니다.');
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                	$('#fieldset-id-error').show();
                	$('#id-error-txt').css({"color":"red"});
                	$('#id-error-txt').text('입력하신\t'+ id + '\t는(은) 이미 사용중입니다.');
        			$('#id').val('');
        			$('.field input')[0].error();
                }
            	
            },
            error:function(){
            	alert("에러입니다");
            }
        });
    };
	
	$('#pw').keyup(function() {
		var regUpper = /[A-Z]/g;
		var regLower = /[a-z]/g;
		var regNumber = /[0-9]/g;
		var regSpecialCharacter = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
		var pw = $('#pw').val();
		
		//대문자 체크
		if(regUpper.test(pw)) {
			if($('#upper').hasClass('fontColor1')) {
				$('#upper').removeClass('fontColor1');				
			}
			if(!($('#upper').hasClass('fontColor2'))) {
				$('#upper').toggleClass('fontColor2');
			}
		} else {
			if($('#upper').hasClass('fontColor2')) {
				$('#upper').removeClass('fontColor2');				
			}
			if(!($('#upper').hasClass('fontColor1'))) {
				$('#upper').toggleClass('fontColor1');
			}
		}
		
		//소문자 체크
		if(regLower.test(pw)) {
			if($('#lower').hasClass('fontColor1')) {
				$('#lower').removeClass('fontColor1');				
			}
			if(!($('#lower').hasClass('fontColor2'))) {
				$('#lower').toggleClass('fontColor2');
			}
		} else {
			if($('#lower').hasClass('fontColor2')) {
				$('#lower').removeClass('fontColor2');				
			}
			if(!($('#lower').hasClass('fontColor1'))) {
				$('#lower').toggleClass('fontColor1');
			}
		}
		
		//숫자 체크
		if(regNumber.test(pw)) {
			if($('#number').hasClass('fontColor1')) {
				$('#number').removeClass('fontColor1');				
			}
			if(!($('#number').hasClass('fontColor2'))) {
				$('#number').toggleClass('fontColor2');
			}
		} else {
			if($('#number').hasClass('fontColor2')) {
				$('#number').removeClass('fontColor2');				
			}
			if(!($('#number').hasClass('fontColor1'))) {
				$('#number').toggleClass('fontColor1');
			}
		}
		
		//특수문자 체크
		if(regSpecialCharacter.test(pw)) {
			if($('#specialCharacter').hasClass('fontColor1')) {
				$('#specialCharacter').removeClass('fontColor1');				
			}
			if(!($('#specialCharacter').hasClass('fontColor2'))) {
				$('#specialCharacter').toggleClass('fontColor2');
			}
		} else {
			if($('#specialCharacter').hasClass('fontColor2')) {
				$('#specialCharacter').removeClass('fontColor2');				
			}
			if(!($('#specialCharacter').hasClass('fontColor1'))) {
				$('#specialCharacter').toggleClass('fontColor1');
			}
		}
	});
	
	$('#pw, #pwcfm').on('focusout', function(){
		//var reg_pw = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
		var reg_pw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/g;
		var pw = $('#pw').val();
		var pwcfm = $('#pwcfm').val();
		var pwnone = $('#pw').val().length;
		var pwcfmnone = $('#pwcfm').val().length;
			
		if(!reg_pw.test(pw)){
			$('.field input')[1].error();
			$('#pw-error-txt').css({"color":"red"});
			$('#pw-error-txt').text('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
			if(pw != pwcfm && pwcfmnone > 0) {
				$('#pwcfm-error-txt').text('입력하신 비밀번호와 틀립니다. 비밀번호를 다시 확인해주세요.');
				$('#pwcfm-error-txt').css({"color":"red"});
			}
		}else{
			$('#pw-error-txt').css({"color":"green"});
			$('#pw-error-txt').text('사용 가능한 비밀번호 입니다.');
			if(pw != pwcfm && pwcfmnone > 0) {
				$('.field input')[2].error();
				$('#pwcfm-error-txt').text('입력하신 비밀번호와 다릅니다. 비밀번호를 다시 확인해주세요.');
				$('#pwcfm-error-txt').css({"color":"red"});				
			}
		}
		
		if(pw != pwcfm && pwcfmnone != 0){
			$('.field input')[2].error();
			$('#pwcfm-error-txt').text('입력하신 비밀번호와 다릅니다. 비밀번호를 다시 확인해주세요.');
			$('#pwcfm-error-txt').css({"color":"red"});
		}
		if(pw == pwcfm && pwcfmnone != 0){
			$('#pwcfm-error-txt').text('비밀번호가 동일합니다.');
			$('#pwcfm-error-txt').css({"color":"green"});
		}
		if(pwcfmnone == 0){
			$('#pwcfm-error-txt').text('');
		}
	});
	
	$('#name').on('focusout', function(){
		var name = $('#name').val().length;
		
		if(name < 2){
			$('.field input')[3].error();
			$('#name-error-txt').css({"color":"red"});
			$('#name-error-txt').text('필수 입력 사항입니다.');
			return false;
		}else{
			$('#name-error-txt').css({"color":"green"});
			$('#name-error-txt').text('확인되었습니다.');
		}
	});
	
	$('#name').keyup(function() {
		var name = $('#name').val().length;

		if (name > 6) {
			$('.field input')[3].error();
			$('#name').val($(this).val().substring(0, 0));
			$('#name-error-txt').css({"color":"red"});
			$('#name-error-txt').text('이름은 6글자를 넘길 수 없습니다.');
			$('#name').focus();
		}
	});
	
	$('#birth').on('focusout', function(){
		var birth = $('#birth').val();
		if(birth.length == 8){
			if(parseInt(birth.substring(4,6)) > 12 || parseInt(birth.substring(6,8)) > 31) {
				$('.field input')[4].error();
				$('#birth-error-txt').text('태어난 년도 8자리를 정확하게 입력해주세요.');
				$('#birth-error-txt').css({"color":"red"});
				$('#birth').val('');
			} else {
				$('#birth-error-txt').css({"color":"green"});
				$('#birth-error-txt').text('확인되었습니다.');
			}
		}else{
			$('.field input')[4].error();
			$('#birth-error-txt').css({"color":"red"});
			$('#birth-error-txt').text('태어난 년도 8자리를 정확하게 입력해주세요.');
		}
	});
	
	$('#birth').keyup(function() {
		var birth = $('#birth').val().length;

		if (birth > 8) {
			$('.field input')[4].error();
			$('#birth').val($(this).val().substring(0, 0));
			$('#birth-error-txt').css({"color":"red"});
			$('#birth-error-txt').text('생년월일 8자릿수를 정확하게 입력해주세요.');
			$('#birth').focus();
		}
	});
	
	$('#email').on('focusout', function(){
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		var email = $('#email').val();
		
		if (reg_email.test(email)) {
			$('#email-error-txt').css({"color":"green"});
			$('#email-error-txt').text('이메일 입니다.');
		}else{
			$('#email-error-txt').css({"color":"red"});
			$('#email-error-txt').text('이메일 형식이 아닙니다.');
		}
	});
	
	$('#phone').on('focusout', function(){
		var reg_mobile = /^010[0-9]*$/g;
		var mobile = $('#phone').val();
		
		if (reg_mobile.test(mobile) && mobile.length == 11) {
			$('#phone-error-txt').css({"color":"green"});
			$('#phone-error-txt').text('사용가능한 핸드폰 번호입니다.');
		}else{
			$('#phone-error-txt').css({"color":"red"});
			$('#phone-error-txt').text('핸드폰 번호 11자릿수를 정확하게 입력해주세요.');
		}
	});
	
	$('#btn-next').click(function() {
	
		if($('#id').val().length < 8) {
			$('#id').focus();
			$('.field input')[0].error();
		} else if($('#pw-error-txt').text() != '사용 가능한 비밀번호 입니다.') {
			$('#pw').focus();
			$('.field input')[1].error();
		} else if($('#pwcfm-error-txt').text() != '비밀번호가 동일합니다.') {
			$('#pwcfm').focus();
			$('.field input')[2].error();
		} else if($('#name-error-txt').text() != '확인되었습니다.') {
			$('#name').focus();
			$('.field input')[3].error();
		}else if($('#birth-error-txt').text() != '확인되었습니다.') {
			$('#birth').focus();
			$('.field input')[4].error();
		} else if($('#signup_type').val() == 'email' ? false : $('#email-error-txt').text() != '이메일 입니다.') {
			$('#email').focus();
			$('.field input')[5].error();
		} else if($('#signup_type').val() == 'phone' ? false : $('#phone-error-txt').text() != '사용가능한 핸드폰 번호입니다.') {
				$('#phone').focus();
				$('.field input')[6].error();
		} else {
			$('#id').prop('disabled',false);
			if($('#signup_type').val() == 'email') {
				$('#email').prop('disabled',false);
			} else if($('#signup_type').val() == 'phone'){
				$('#phone').prop('disabled',false);
			} 
			$('#identity_verification').submit();
		}
		
	});
	
	
});