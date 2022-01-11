$(document).ready(function() {
	$('#changePwCheck, #changePw').focusout(function(){
		var reg_pw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/g;
		var chagePasswordCheck = $('#changePw').val();
			
		if(!reg_pw.test(chagePasswordCheck) && chagePasswordCheck != ''){
			$('#fail').show();
			$('#fail').css("color","red");
			$('#fail').text('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
		} else {
			if($('#changePwCheck').val() != '') {
				if(chagePasswordCheck != $('#changePwCheck').val()) {
					$('#fail').show();
					$('#fail').css("color","red");
					$('#fail').text("비밀번호가 틀립니다. 다시입력해주세요.");
				} else if(chagePasswordCheck == $('#changePwCheck').val()){
					$('#fail').show();
					$('#fail').text("새로운 비밀번호가 일치합니다.");
					$('#fail').css("color","green");
				}
			} else {
				$('#fail').hide();				
			}
		}
	});	
	
	$('#delete_section #convertTypeNew').on('click', function() {
		$('#changePw').toggleClass('active');
		if ($('#changePw').hasClass('active')) {
			$(this).attr('class', "fa fa-eye-slash fa-lg");
			$('#changePw').attr('type', "text");
		} else {
			$(this).attr('class', "fa fa-eye fa-lg");
			$('#changePw').attr('type', 'password');
		}
	});
	
	$('#delete_section #convertTypeNewCheck').on('click', function() {
		$('#changePwCheck').toggleClass('active');
		if ($('#changePwCheck').hasClass('active')) {
			$(this).attr('class', "fa fa-eye-slash fa-lg");
			$('#changePwCheck').attr('type', "text");
		} else {
			$(this).attr('class', "fa fa-eye fa-lg");
			$('#changePwCheck').attr('type', 'password');
		}
	});
	
	$('#modifyPasswordCheck').submit(function() {
		if($('#fail').text() != '새로운 비밀번호가 일치합니다.') {
			return false;
		}
	});
	
	
});