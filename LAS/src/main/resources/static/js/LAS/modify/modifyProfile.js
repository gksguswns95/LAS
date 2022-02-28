$(function() {
	var doubleClickCount = 0;
	var interval;
	 
	if($('#optional_agreed').val() == 'Y') {
		$('.switch input').prop('checked',true);
	}
	console.log(doubleClickCount);
	$('.switch input').click(function() {
		doubleClickCount++;
		if(doubleClickCount < 2) {
			if($('.switch input').prop('checked')) {
				optional_agreed_YN('Y');
			} else {
				optional_agreed_YN('N');
			}
		} else {
			if($('.switch input').prop('checked')) {
				$('.switch input').prop('checked',false);
				$('.alert-wrap').toggleClass('active');
			} else {
				$('.switch input').prop('checked',true);
				$('.alert-wrap').toggleClass('active');
			}
		}
	});
	
	function optional_agreed_YN(agreed) {
		$.ajax({
			url : '/prototype/optional_agreed_Y',
			type:'post',
			data:{agreed:agreed},
			success:function() {
				startTimer(9);
			},
			error:function() {
				alert("마케팅 수신동의 실패! 다시시도해주세요.");
			}
		});
	};
	
	function startTimer(duration) {
		clearInterval(interval);
		var timer = duration, seconds;
		interval = setInterval(function() {
			seconds = parseInt(timer % 60, 10);
			
			seconds = seconds < 10 ? "0" + seconds : seconds;
			$('.timer').text(seconds);
			
			if (--timer < 0) {
				timer = duration;
			}
			if (timer === 0) {
				clearInterval(interval);
				doubleClickCount = 0;
				$('.alert-wrap').removeClass('active');
			}
		}, 1000);
	}
});