$(document).ready(function() {
	//높이 설정
	var height = $(window).height();
	console.log(height)
	console.log($(".container").height())
	if (height >= $(".container").height() + 200) {
		$(".footer").css("top", $(window).height() - 80);
	} else {
		$(".footer").css("bottom", '-120px');
	}
	
	
	$('input[type="text"]').keyup(function() {
		$('#fail').text('');
	});
	
	$('#nextAuth_btn').click(function() {
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+).(\.[0-9a-zA-Z_-]+){1,2}$/;
		var reg_phone = /([^0-9]+)/;
		var birth = $('#birth').val();
		var id = $('#id').val();
		var phoneReset = $('#id').val().replaceAll('-','');
		if( !(reg_email.test(id)) ) {
			if( reg_phone.test(phoneReset) && !(phoneReset.length == 11) ) {
				$('#fail').text('이메일 또는 핸드폰번호를 입력해주세요.');
				return false;				
			} else {
				$('#id').val(phoneReset);
			}
		}
		if($('#name').val().length < 2) {
			$('#fail').text('이름을 입력해주세요.');
			return false;
		}
		if( parseInt(birth.substring(4,6)) > 12 || parseInt(birth.substring(6,8)) > 31 || birth.length != 8 ) {
			$('#fail').text('태어난 년도 8자리를 정확하게 입력해주세요.');
			return false;
		}
		$('#fm').submit();
	});
	
	
	
	$('#emailAuthCheck_btn').click(function() {
		if($('#emailAuth').val().length != 8) {
			$('#fail').text('인증번호 8자리를 입력하세요.');
		}
		if($('#emailAuthTimer').text() == '세션 만료!') {
		}
		
		emailAuthKeyCheck
	});
	
	function emailAuthKeyCheck(email,mailAuthKey) {
    	$.ajax({
    		url:'/emailauthkeycheck',
    		type: "post",
    		data:{mailAuthKey:mailAuthKey,email:email},
    		success: function(cnt) {
    			if(cnt == 1) {
    				stopTimer();
    				$('#emailAuthKeyInputCheck_btn').css('display','none');
    				$('#emailAuthKeyInput').css('display','none');
    				$('#emailAuthKeyInput').css('display','none');
    				$('#fieldset-emailAuthKey-error').text('');
    				$('#emailAuthSuccess').text('메일인증이 완료되었습니다.');
    				$('#id').prop('disabled',true);
    				idAuthCheckBool = true;    				
    			} else {
    				$('#fieldset-emailAuthKey-error').text('메일인증 번호가 틀립니다. 다시입력해주세요.');
	    			$('#fieldset-emailAuthKey-error').css('color','red');
    			}
    		},
    		error:function() {
    			alert('인증 실패!');
    			
    		}
    	});
    };
});