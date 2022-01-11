$(document).ready(function() {
	if($('#error').val() == 'loginError') {
		$('#fail').html("아이디 또는 비밀번호가 잘못 입력 되었습니다.<br> 아이디와 비밀번호를 정확히 입력해 주세요.");
		$('#section').css('height','520px')
	}
	
	if($('#error').val() == 'passwordConfirmError' || $('#error').val() == 'withdrawalAccountError') {
		$('#fail').html("입력하신 비밀번호가 틀립니다. 다시 한번 입력해주세요.");
	}
	
	if($('#error').val() == 'passwordModifyError') {
		$('#fail').html("입력하신 현재 비밀번호가 틀립니다. 다시 한번 입력해주세요.");
	}
	
	if($('#error').val() == 'NotSame') {
		$('#fail').text("입력하신 정보와 일치하는 회원이 없습니다.");
	}
	
	if($('#error').val() == 'authFail') {
		$('#fail').text("인증번호가 틀립니다.");
	}
	

});