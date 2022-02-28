$(function() {
	var doubleClickCheck = 0;
	
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
	
	$('#pw').on('focusout', function(){
		//var reg_pw = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
		var reg_pw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/g;
		var pw = $('#pw').val();
			
		if(!reg_pw.test(pw)){
			$('.field input')[0].noneError();
			$('.field input')[0].error();
			$('#pw-error-txt').css({"color":"red"});
			$('#pw-error-txt').text('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
		}else{
			$('.field input')[0].noneError();
			$('#pw-error-txt').css({"color":"green"});
			$('#pw-error-txt').text('사용 가능한 비밀번호 입니다.');
		}
	});
	
	$('#btn_next_editfrom').click(function() {
		if($('#pwAuth').val().length > 7) {
			confirmAccountPassword($('#pwAuth').val());			
		} else {
			$('.field input')[0].noneError();
			$('.field input')[0].error();
		}
	});
	
	function confirmAccountPassword(pw) {
		$.ajax({
			url : '/prototype/confirmAccountPassword',
			type:'post',
			data:{pw:pw},
			success:function(Accountcount) {
				if(Accountcount == 1) {
					location.href = '/prototype/account_edit_editform';
				} else {
					$('.field input')[0].noneError();
					$('.field input')[0].error();
					$('#pw-error-txt').css({"color":"red"});
					$('#pw-error-txt').text('비밀번호가 일치하지 않습니다.');
				}
			},
			error:function() {
				alert("비밀번호 조회 실패! 다시시도해주세요.");
			}
		});
	}
	
	$('#btn_next_accountModify').click(function() {
		var first_phone = /^010/;
		var reg_phone = /([^0-9]+)/;
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+).(\.[0-9a-zA-Z_-]+){1,2}$/;
		var phoneRest = $('#phone').val().replaceAll('-','');
		if(!(phoneRest.length == 11) || !first_phone.test(phoneRest) || reg_phone.test(phoneRest)) {
			$('.field input')[3].noneError();
			$('.field input')[3].error();
			$('#pw').focus();
		} else if(!reg_email.test( $('#email').val() ) ) {
			$('.field input')[4].noneError();
			$('.field input')[4].error();
			$('#email').focus();
		} else {
			$('#phone').val(phoneRest);
			$('#form-accountModify').submit();
		}
		
	});
	
});