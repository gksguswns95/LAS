$(function() {
	var interval;
	var duplicateId = true;
	//에러
	//$('.field input')[1].error();
	$($('.field')[1]).hide();
	$('.btn-set.mt45').hide();
	
	//중복체크
	function checkid(id){
        $.ajax({
           url:'/idCheck', //Controller에서 인식할 주소
            type:'post', //POST 방식으로 전달
            data:{id:id},
            success:function(cnt) { ////컨트롤러에서 넘어온 cnt값을 받는다 
            	if(cnt != 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
        			$('#id').val('');
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
		if( $(this).val().length > 7) {
			checkid($(this).val());			
		} else {
			$('#btn-auth-send').prop('disabled',true);
			$('.info-txt').css('margin', '3rem 0 0');
			$('.field input')[0].error();
		}
	});
    
	//인증번호 전송 클릭 시
	$('#btn-auth-send').click(function() {
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+).(\.[0-9a-zA-Z_-]+){1,2}$/;
		var id = $('#id').val();
		if (reg_email.test(id)) {
			emailAuth(id);
		} else {	//핸드폰
			$('.info-txt').css('margin', '3rem 0 0');
			$('.field input')[0].error();
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

	// 이메일 전송
	function emailAuth(email) {
		$.ajax({
			url: '/emailauthcheck',
			type: "post",
			data: { email: email },
			success: function() {
				$($('.field')[1]).show();
				$('.btn-set.mt45').show();
				$('#btn-auth-send').text('인증번호 재전송');
				
				startTimer(299);
				$('#id').prop('disabled',true);
				$('#btn-authKeyCheck').prop('disabled',false);
				$('#numbver').focus();
			},
			error: function() {
				alert('메일 전송 실패!');
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
					location.href = './signup_account?id='+email+'&agree='+$('#agree').val()+'&type=email';
    			} else {
					$('.info-txt').css('margin', '4rem 0 0');
    				$('.field input')[2].error();
    			}
    		},
    		error:function() {
    			alert('인증 실패!');
    		}
    	});
    };
	
	$('#btn-authKeyCheck').click(function() {
		if($('#numbver').val().length == 8) {
			emailAuthKeyCheck($('#id').val(),$('#numbver').val());			
		} else {
			$('.info-txt').css('margin', '4rem 0 0');
			$('.field input')[2].error();
		}
	});
	
	$('#numvber, #id').keyup(function() {
		$('.info-txt').css('margin', '1rem 0 0');
	});
	

});