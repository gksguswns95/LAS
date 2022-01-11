$(document).ready(function() {
	var interval;
	
	function startTimer(duration) {
  	  var timer = duration, minutes, seconds;
  	  interval = setInterval(function () {
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
  	      $('#emailAuthTimer').text("세션 만료!");
  	      $('#emailAuthTimer').css('color','red');
  	      $('.authResned_btn').css('display','inline-block');
  	    }
  	  }, 1000);
  	}
	
	startTimer(299);
	
	$('.authResned_btn').click(function() {
		emailAuth($('#id').val());
	});
	
	$('#emailAuthCheck_btn').click(function() {
		emailAuthKeyCheck($('#id').val(),$('#emailAuth').val());
	});
	
	function emailAuth(email) {
    	$.ajax({
    		url:'/emailauthcheck',
    		type: "post",
    		data:{email:email},
    		success: function() {
				$('.authResned_btn').css('display','none');
				clearInterval(interval);
				startTimer(299);
    		},
    		error:function() {
    			alert('메일 전송 실패!');
    		}
    	});
    };
    
    function emailAuthKeyCheck(email,mailAuthKey) {
    	$.ajax({
    		url:'/emailauthkeycheck',
    		type: "post",
    		data:{mailAuthKey:mailAuthKey,email:email},
    		success: function(cnt) {
    			if(cnt == 1) {
    				$(location).attr('href','/modifypassword');
    			} else {
    				$('#fail').text('메일인증 번호가 틀립니다.');
    			}
    		},
    		error:function() {
    			alert('인증 실패!');
    			
    		}
    	});
    }
});