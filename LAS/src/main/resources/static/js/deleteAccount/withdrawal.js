$(document).ready(function() {
	
	$('#delete_section i').on('click', function() {
		$('#passwd').toggleClass('active');
		if ($('#passwd').hasClass('active')) {
			$(this).attr('class', "fa fa-eye-slash fa-lg");
			$('#passwd').attr('type', "text");
		} else {
			$(this).attr('class', "fa fa-eye fa-lg");
			$('#passwd').attr('type', 'password');
		}
	});

	var height = $(window).height();
	if (height >= $(".container").height() + 160) {
		$(".footer").css("top", $(window).height() - 80);
	} else {
		$(".footer").css("bottom", '-240px');
	}
	
	$('#cancle_btn').on("click",function() {
		location.href='/';
	});
	
	$('.cancle_btn').on("click",function() {
		location.href='/';
	});
	
	$('#reasonwithdrawal').submit(function() {
		if (!confirm("정말로 회원 탈퇴를 하시겠습니까?")) {
			return false;
		}
	});
	
	$('.reason').click(function(){
		if ($('.reason:checked').val() == 4) {
			$('.reasonOther').css('display','block');
		} else {
			$('.reasonOther').css('display','none');
		}
		if ($('.reason:checked').val() == 1){
			$('#other').val("사용하지 않는 계정 정리");
		}
		
		if ($('.reason:checked').val() == 2){
			$('#other').val("재가입을 위한 탈퇴");
		}
		
		if ($('.reason:checked').val() == 3){
			$('#other').val("서비스 및 고개지원 불만족");
		}
	});

});