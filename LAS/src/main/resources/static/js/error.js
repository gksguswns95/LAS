$(document).ready(function() {
	if($('#error').val() == 'loginError') {
		$('#fail').html("아이디 또는 비밀번호가 잘못 입력 되었습니다.<br> 아이디와 비밀번호를 정확히 입력해 주세요.");
		$('#section').css('height','520px')
	}
	
	if($('#error').val() == 'withdrawalAccount') {
		$('#fail').html("회원탈퇴하여 로그인이 불가능합니다.");
		$('#section').css('height','500px')
	}
	
	if($('#error').val() == 'passwordConfirmError' || $('#error').val() == 'withdrawalAccountError') {
		$('#fail').html("입력하신 비밀번호가 틀립니다. 다시 한번 입력해주세요.");
	}
	
	if($('#error').val() == 'passwordModifyError') {
		$('#fail').html("입력하신 현재 비밀번호가 틀립니다. 다시 한번 입력해주세요.");
	}
	

});