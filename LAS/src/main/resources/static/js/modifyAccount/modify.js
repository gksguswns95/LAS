$(document).ready(function() {
	$('#changePwCheck, #changePw').focusout(function(){
		var reg_pw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/g;
		var chagePasswordCheck = $('#changePw').val();
			
		if(!reg_pw.test(chagePasswordCheck) && chagePasswordCheck != ''){
			$('#fail').show();
			$('#fail').css("color","red");
			$('#fail').text('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
			$('#passwordSubmit_btn').prop('disabled',true);
		} else {
			if($('#pw').val() == $('#changePw').val()) {
				$('#samePw').show();
				$('#samePw').text("현재 비밀번호와 새로운 비밀번호가 같습니다.");
				$('#passwordSubmit_btn').prop('disabled',true);
			} else {
					$('#samePw').hide();
			}
			
			if($('#changePwCheck').val() != '') {
				if(chagePasswordCheck != $('#changePwCheck').val()) {
					$('#fail').show();
					$('#fail').css("color","red");
					$('#fail').text("변경하는 비밀번호가 틀립니다. 다시입력해주세요.");
					$('#passwordSubmit_btn').prop('disabled',true);
				} else if(chagePasswordCheck == $('#changePwCheck').val()){
					$('#fail').show();
					$('#fail').text("새로운 비밀번호가 일치합니다.");
					$('#fail').css("color","green");
					$('#passwordSubmit_btn').prop('disabled',false);
					$('#chagePasswordCheck').hide();			
				}
			} else {
				$('#fail').hide();				
				$('#passwordSubmit_btn').prop('disabled',true);
			}
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