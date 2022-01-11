$(document).ready(function() {
	
	$('#delete_section #convertType').on('click', function() {
		$('#pw').toggleClass('active');
		if ($('#pw').hasClass('active')) {
			$(this).attr('class', "fa fa-eye-slash fa-lg");
			$('#pw').attr('type', "text");
		} else {
			$(this).attr('class', "fa fa-eye fa-lg");
			$('#pw').attr('type', 'password');
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
	
	
	$('.reason').click(function(){
		if ($('.reason:checked').val() == 6) {
			$('.reasonOther').css('display','block');
		} else {
			$('.reasonOther').css('display','none');
		}
		if ($('.reason:checked').val() == 1){
			$('#other').val("중복된 다른 계정이 있어요");
		}
		
		if ($('.reason:checked').val() == 2){
			$('#other').val("원하는 서비스가 없어요");
		}
		
		if ($('.reason:checked').val() == 3){
			$('#other').val("서비스 이용이 불편해요");
		}
		
		if ($('.reason:checked').val() == 4){
			$('#other').val("사용빈도가 낮아요");
		}
		
		if ($('.reason:checked').val() == 5){
			$('#other').val("개인정보가 걱정되어요");
		}
	});
	
	$('.login').on('keypress', function(e) {
		var keyCode = 0;
		var shiftKey = false;
		keyCode = e.keyCode;
		shiftKey = e.shiftKey;
		if ((keyCode >= 65 && keyCode <= 90) && !shiftKey) {
			$("#capslock").show();
			setTimeout(function() {	$("#capslock").hide(); },3500);
		} else {
			$("#capslock").hide();
			$('#fail').text('');
		}
	});

});