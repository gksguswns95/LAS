$(document).ready(function() {
	$('#modifyAccountPassword').submit(function() {
		if($('#pw').val() == $('#changePw').val()) {
			$('#fail').text("변경하는 비밀번호가 현재 비밀번호랑 같습니다. 다시입력해주세요.");
			return false;
		}
	});
	
	$('#changePwCheck, #changePw').focusout(function() {
		if($('#changePw').val() != $('#changePwCheck').val() && $('#changePwCheck').val() != '') {
			$('#fail').css("color","red");
			$('#fail').text("변경하는 비밀번호가 틀립니다. 다시입력해주세요.");
			$('#passwordSubmit_btn').prop('disabled',true);
		} else if($('#changePw').val() == $('#changePwCheck').val()){
			$('#fail').text("새로운 비밀번호가 일치합니다.");
			$('#fail').css("color","green");
			$('#passwordSubmit_btn').prop('disabled',false);
		}
	});
	
	var disabledPhone = document.querySelector('#phone').disabled
	var disabledEmail = document.querySelector('#email').disabled
	if(disabledPhone) {
		console.log("disabledPhone : "+disabledPhone);
		$('#phone').css('border','none');
	}

	if(disabledEmail) {
		console.log("disabledEmail : "+disabledEmail);
		$('#email').css('border','none');
	}
	
	var phoneValue = $('#phone').val();
	var phoneNumberview = '';
	phoneNumberview += phoneValue.substring(0,3);
	phoneNumberview += '-';
	phoneNumberview += phoneValue.substring(3,7);
	phoneNumberview += '-';
	phoneNumberview += phoneValue.substring(7,11);
	$('#phone').val(phoneNumberview);
	
	
	$('#modifyAccount').submit(function() {
		var phoneRest = $('#phone').val().replaceAll('-','')
		$('#phone').val(phoneRest);
		console.log($('#phone').val($('#phone').val()));
	});
	
});