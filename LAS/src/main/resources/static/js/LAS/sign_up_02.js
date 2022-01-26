$(function() {
	var interval;
	//에러
	//$('.field input')[1].error();
	$($('.field')[1]).hide();
	//인증번호 전송 클릭 시
	$('#btn-auth-send').click(function() {
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+).(\.[0-9a-zA-Z_-]+){1,2}$/;
		if (reg_email.test($('#id').val())) {
			alert('!');
			emailAuth($('#id').val());
			if ($(this).hasClass('outline')) {
				$(this).toggleClass('on');
				$(this).text('인증번호 재전송');
				$($('.field')[1]).show();
			}
		}
	});

	function startTimer(duration) {
		clearInterval(interval);
		var timer = duration, minutes, seconds;
		interval = setInterval(function() {
			minutes = parseInt(timer / 60, 10);
			seconds = parseInt(timer % 60, 10);

			minutes = minutes < 10 ? "0" + minutes : minutes;
			seconds = seconds < 10 ? "0" + seconds : seconds;

			$('.timer').text(minutes + ":" + seconds);
			if (--timer < 0) {
				timer = duration;
			}
			if (timer === 0) {
				clearInterval(interval);
				$('.timer').text("");
			}
		}, 1000);
	}

	function stopTimer() {
		clearInterval(interval);
	}

	// 이메일 전송
	function emailAuth(email) {
		$.ajax({
			url: '/emailauthcheck',
			type: "post",
			data: { email: email },
			success: function() {
				startTimer(299);
			},
			error: function() {
				alert('메일 전송 실패!');
			}
		});
	};
	
	$('#btn-authKeyCheck').click(function() {
		
	});
	
	

});