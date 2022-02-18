$(function() {
	var interval;
	var duplicateId = true;
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+).(\.[0-9a-zA-Z_-]+){1,2}$/;
	var reg_phone = /([^0-9]+)/;
	var first_phone = /^010/;
	//에러
	//$('.field input')[1].error();
    if($('.timer').text() == '05:00') {
	    startTimer(299);	
	}
    
	$('#btn-auth-extension').click(function() {
		if(reg_email.test( $('#id').text() ) ) {
			extensionValidityTime($('#id').text());			
		} else {
			startTimer(299);
		}
	})
	
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
				$('.timer').text("만료!");
			}
		}, 1000);
	}
	
	function extensionValidityTime(id) {
		$.ajax({
			url: '/prototype/extensionValidityTime',
			type: 'post',
			data: {id: id},
			success: function() {
				startTimer(299);
			},
			error: function() {
				alert('입력시간 연장하기를 실패했습니다.');
			}
		});
	}
	
	//이메일 인증번호 확인
	function emailAuthKeyCheck(email,mailAuthKey) {
    	$.ajax({
    		url:'/emailauthkeycheck',
    		type: "post",
    		data:{mailAuthKey:mailAuthKey,email:email},
    		success: function(cnt) {
    			if(cnt == 1) {
					location.href = '/prototype/reset_pw_newpw';
    			} else {
    				$('.field input')[0].error();
    			}
    		},
    		error:function() {
    			alert('인증 실패!');
    		}
    	});
    };
    
    //핸드폰 인증번호 확인
    function phoneAuthKeyCheck(phone,authKey) {
		if(authKey == 'asd123') {
			location.href = '/prototype/reset_pw_newpw';
		} else {
			$('.field input')[0].error();
		}
	}
	
	$('#btn-authKeyCheck').click(function() {
		if($('#numbver').val().length == 6) {
			if(reg_email.test( $('#id').text() )) {
				emailAuthKeyCheck($('#id').text(),$('#numbver').val());				
			} else {
				phoneAuthKeyCheck($('#id').text(),$('#numbver').val());
			}
		} else {
			$('.field input')[0].error();
		}
	});
	
	

});