$(document).ready(function() {
	
	/*$('input[name="AuthWay"]').change(function() {
		var AuthValue = $("input[name='AuthWay']:checked").val();
		$('.box-inner').css('display','none');
		if(AuthValue === 'email') {
			$('#email-inner').css('display','block');
		}
		if(AuthValue === 'phone') {
			$('#phone-inner').css('display','block');
		}
	});*/
	
	var height = $(window).height();
	console.log(height)
	console.log($(".container").height())
	if (height >= $(".container").height() + 200) {
		$(".footer").css("top", $(window).height() - 80);
	} else {
		$(".footer").css("bottom", '-120px');
	}
	var mailAuthBool = false;
	$('#emailAuth_btn').click(function () {
    	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		var email = $('#email').val();
		if(reg_email.test(email)) {
			name_email_Check($('#email-name').val(),email);
		} else {
			$('#fail').text('제대로된 이메일을 입력해주세요.');
		}
	});
	
	$('input[type="text"]').keyup(function() {
		$('#fail').text('');
	});
	
	$('#next_btn').click(function() {
		if($('#name').val().length < 2) {
			$('#fail').text('이름을 입력해주세요.');
			return false;
		}
		if($('#birth').val().length != 8) {
			$('#fail').text('생년월일을 입력해주세요.');
			return false;
		}
		$('#fm').submit();
	});
	
	//아이디 *** 표시
	
	
	//이름 생일 ajax 처리
	$('#nextAuth_btn').click(function() {
		nameBirthCheck($('#name').val(),$('#birth').val(),$('#id').val());
	});
	
	function nameBirthCheck(name,birth,id) {
    	$.ajax({
    		url:'/namebirthcheck',
    		type: "post",
    		data:{name:name,birth:birth,id:id},
    		success: function(cnt) {
				if(cnt == 1) {
					$(location).attr('href','/findid_list');
				} else {
					$('#fail').text('이름과 생년월일이 틀립니다.');
				}
    		},
    		error:function() {
    			alert('메일 전송 실패!');
    		}
    	});
    };
    
    /*
    // 이메일 인증 구현
    function emailAuth(email) {
    	$.ajax({
    		url:'/emailauthcheck',
    		type: "post",
    		data:{email:email},
    		success: function() {
				$('#emailAuthTimer').css('color','green');
    			startTimer(299);
    		},
    		error:function() {
    			alert('메일 전송 실패!');
    		}
    	});
    };
    
    function name_email_Check(name,email) {
    	$.ajax({
    		url:'/nameemailcheck',
    		type: "post",
    		data:{name:name,email:email},
    		success: function(cnt) {
  				if(cnt ==1 ) {
					$('#emailAuth_btn').css('display','none');
					$('#emailAuth').prop('disabled',false);
					//이메일전송
					emailAuth(email);
					startTimer(299);
				} else {
					$('#fail').text('회원가입한 이름과 이메일이 일치하지 않습니다.');
				}
    		},
    		error:function() {
    			alert('이름과 이메일 확인 실패!');
    		}
    	});
    };
    
    function name_phone_Check(name,email) {
    	$.ajax({
    		url:'/namephonecheck',
    		type: "post",
    		data:{name:name,email:email},
    		success: function(cnt) {
  				if(cnt ==1 ) {
					$('#phoneAuth_btn').css('display','none');
				} else {
					$('#fail').text('회원가입한 이름과 휴대전화가 일치하지 않습니다.');
				}
    		},
    		error:function() {
    			alert('이름과 이메일 확인 실패!');
    		}
    	});
    };
    
    function startTimer(duration) {
    	  var timer = duration, minutes, seconds;
    	  var interval = setInterval(function () {
    	    minutes = parseInt(timer / 60, 10)
    	    seconds = parseInt(timer % 60, 10);

    	    minutes = minutes < 10 ? "0" + minutes : minutes;
    	    seconds = seconds < 10 ? "0" + seconds : seconds;

    	    $('#emailAuthTimer').text(minutes + ":" + seconds);
    	    if (--timer < 0) {
    	      timer = duration;
    	    }
    	    if(timer === 0) {
    	      clearInterval(interval);
    	      $('#emailAuthTimer').text("세션 만료! 인증번호를 다시받아주세요.");
    	      $('#emailAuthTimer').css('color','red');
    	      $('#emailAuth_btn').css('display','inline-block');
    	      mailAuthBool = false;
    	    }
    	  }, 1000);
    }
    
    $('#next_btn, #phoneAuth_btn').click(function() {
		if($("input[name='AuthWay']:checked").val() == 'email') {
			emailAuthKeyCheck($('#email').val(),$('#emailAuth').val());
			if(mailAuthBool) {
				alert('인증완료!');
				$(location).attr('href', '/findid_list');
			}			
		}
		if($("input[name='AuthWay']:checked").val() == 'phone') {
			alert('인증완료!');
			$(location).attr('href', '/findid_list');
		}
	});
	
	function emailAuthKeyCheck(email,mailAuthKey) {
    	$.ajax({
    		url:'/emailauthkeycheck',
    		type: "post",
    		data:{mailAuthKey:mailAuthKey,email:email},
    		success: function(cnt) {
    			if(cnt == 1) {
    				mailAuthBool = true; 				
    			} else {
    				$('#fieldset-emailAuthKey-error').text('메일인증 번호가 틀립니다. 다시입력해주세요.');
	    			$('#fieldset-emailAuthKey-error').css('color','red');
    			}
    		},
    		error:function() {
    			alert('인증 실패!');
    		}
    	});
    };*/
});