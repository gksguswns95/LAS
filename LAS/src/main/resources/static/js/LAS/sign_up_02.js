$(function() {
	var interval;
	var interval_resend;
	var duplicateId = true;
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+).(\.[0-9a-zA-Z_-]+){1,2}$/;
	var reg_phone = /([^0-9]+)/;
	var first_phone = /^010/;
	var doubleClickCount = 0;
	var doubleClickCount_resend = 0;
	//에러
	//$('.field input')[1].error();
	$($('.field')[1]).hide();
	$('.btn-set.mt45').hide();
	$('.info-txt.mt30').hide();
	$('#btn-auth-resend').hide();
	$('#btn-auth-alert').hide();
	
	//중복체크
	function checkid(id){
        $.ajax({
           url:'/idCheck', //Controller에서 인식할 주소
            type:'post', //POST 방식으로 전달
            data:{id:id},
            success:function(cnt) { ////컨트롤러에서 넘어온 cnt값을 받는다 
            	if(cnt != 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
        			$('#id').val('');
        			$('.field input')[0].noneError();
        			$('.field input')[0].error();
        			$('.info-txt').css('margin', '3rem 0 0');
					$('#btn-auth-send').prop('disabled',true);
                } else {
        			$('.info-txt').css('margin', '1rem 0 0');
					$('#btn-auth-send').prop('disabled',false);
				}
            },
            error:function(){
            	alert("에러입니다");
            }
        });
    };
    
    $('#id').focusout(function() {
		var userId = $('#id').val();
		var userPhoneId = userId.replaceAll('-','');
		if( userId.length > 7) {
			if (!reg_phone.test(userPhoneId) && userPhoneId.length == 11 && first_phone.test(userId)) {
				checkid(userPhoneId);
				$('#id').val(userPhoneId);
			} else if(reg_email.test(userId)) {
				checkid(userId);
			}else {
				/*checkid(userId);*/
				$('.field input')[0].noneError();
				$('.field input')[0].error();
				$('.info-txt').css('margin', '3rem 0 0');
			}
		} else {
			$('#btn-auth-send').prop('disabled',true);
			$('.info-txt').css('margin', '3rem 0 0');
			$('.field input')[0].noneError();
			$('.field input')[0].error();
		}
	});
    
    //인증번호 전송 클릭 시
	$('#btn-auth-send').on('click',function() {
		doubleClickCount++;
		var id = $('#id').val();
		var phoneNumerreset = $('#id').val().replaceAll('-', '');
		if(doubleClickCount < 2) {
			if (reg_email.test(id)) {
				emailAuth(id);
			}else if (!reg_phone.test(phoneNumerreset) || phoneNumerreset.length == 11 || first_phone.test(id)) {
				phoneAuth(id);
			}else {	//핸드폰
				$('.info-txt').css('margin', '3rem 0 0');
				$('.field input')[0].noneError();
				$('.field input')[0].error();
			}
		}
	});
    
	//인증번호 재전송 클릭 시
	$('#btn-auth-resend').on('click',function() {
		doubleClickCount_resend++;
		var id = $('#id').val();
		var phoneNumerreset = $('#id').val().replaceAll('-', '');
		if(doubleClickCount_resend < 2) {
			$('.info-txt.mt30').show();
			startTimer_resend(29);
			if (reg_email.test(id)) {
				emailAuth(id);
			}
			if (!reg_phone.test(phoneNumerreset) || phoneNumerreset.length == 11 || first_phone.test(id)) {
				phoneAuth(id);
			}
		}
	});
	
	$('#btn-auth-extension').click(function() {
		if($('#signup_type').val() == 'email') {
			extensionValidityTime($('#id').val());			
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
				$('.btn-auth-resend').css('color','#CD0B41');
				$('.btn-auth-resend').css('border-color','#CD0B41');
			}
		}, 1000);
	}
	
	function startTimer_resend(duration) {
		clearInterval(interval_resend);
		var timer = duration, seconds;
		interval_resend = setInterval(function() {
			seconds = parseInt(timer % 60, 10);
			
			seconds = seconds < 10 ? "0" + seconds : seconds;
			$('.timer_resend').text(seconds);
			$('#btn-auth-send').hide();
				$('#btn-auth-resend').show();
			if (--timer < 0) {
				timer = duration;
			}
			if (timer === 0) {
				clearInterval(interval_resend);
				$('#btn-auth-alert').hide();
				$('#btn-auth-resend').show();
				doubleClickCount_resend = 0;
				$('.alert-wrap').removeClass('active');
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
				alert('입력시간 연장하기를 다시 눌러 주세요.');
			}
		});
	}

	// 이메일 전송
	function emailAuth(email) {
		$.ajax({
			url: '/emailauthcheck',
			type: "post",
			data: { email: email },
			success: function() {
				$($('.field')[1]).show();
				$('.btn-set.mt45').show();
				$('#signup_type').val('email');
				$('#btn-auth-send').hide();
				$('#btn-auth-resend').show();
				
				startTimer(299);
				$('#id').prop('readonly',true);
				$('#btn-auth-send').prop('disabled',false);
				$('#numbver').focus();
			},
			error: function() {
				alert('메일 전송 실패!');
			}
		});
	};
	
	// 핸드폰 인증번호 생성
	function phoneAuth(phone) {
		$.ajax({
			url: '/phoneauthcheck',
			type: "post",
			data: { phone: phone },
			success: function() {
				$($('.field')[1]).show();
				$('.btn-set.mt45').show();
				$('#btn-auth-send').text('인증번호 재전송');
				$('#signup_type').val('phone');
				
				startTimer(299);
				$('#id').prop('readonly',true);
				$('#btn-authKeyCheck').prop('disabled',false);
				$('#numbver').focus();
			},
			error: function() {
				alert('핸드폰 인증번호 전송 실패!');
			}
		});
	};
	
	//이메일 인증번호 확인
	function emailAuthKeyCheck(email,mailAuthKey) {
    	$.ajax({
    		url:'/emailauthkeycheck',
    		type: "post",
    		data:{mailAuthKey:mailAuthKey,email:email},
    		success: function(cnt) {
    			if(cnt == 1) {
					location.href = './signup_account?agree='+$('#agree').val();
    			} else {
					$('.info-txt').css('margin', '4rem 0 0');
    				$('.field input')[3].noneError();
    				$('.field input')[3].error();
    			}
    		},
    		error:function() {
    			alert('인증 실패!');
    		}
    	});
    };
    
    //핸드폰 인증번호 확인
    function phoneAuthKeyCheck(phone,phoneAuthKey) {
		$.ajax({
    		url:'/phoneauthkeycheck',
    		type: "post",
    		data:{phoneAuthKey:phoneAuthKey,phone:phone},
    		success: function(cnt) {
    			if(cnt == 1) {
					location.href = './signup_account?agree='+$('#agree').val();
    			} else {
					$('.info-txt').css('margin', '4rem 0 0');
					$('.field input')[3].noneError();
					$('.field input')[3].error();
	    		}
    		},
    		error:function() {
    			alert('인증 실패!');
    		}
    	});
	}
	
	$('#btn-authKeyCheck').click(function() {
		if($('#numbver').val().length == 6) {
			if($('#signup_type').val() == 'email') {
				emailAuthKeyCheck($('#id').val(),$('#numbver').val());				
			} else {
				phoneAuthKeyCheck($('#id').val(),$('#numbver').val());
			}
		} else {
			$('.info-txt').css('margin', '4rem 0 0');
			$('.field input')[3].noneError();
			$('.field input')[3].error();
		}
	});
	
	$('#numbver, #id').keyup(function() {
		$('.info-txt').css('margin', '1rem 0 0');
	});
	
	$('#numbver').keyup(function() {
		if($(this).val().length == 6) {
			$('#btn-authKeyCheck').prop('disabled',false);			
		} else {
			$('#btn-authKeyCheck').prop('disabled',true);			
		}
	});
	

});