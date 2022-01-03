$(document).ready(function() {
	$('.btn-layerClose').on('click',function() {
		$('.layer').fadeOut();
	});
	
	$('#mobile_btn').click(function() {
		$('.container').toggleClass('active');
		$('.mobile_nav').toggleClass('active');
		if($('.container').hasClass('active') && $('.mobile_nav').hasClass('active')) {
			$('.transparency').css('display','block');
		}
	});
	
	$('.transparency').on('click',function() {
		$('.container').removeClass('active');
		$('.mobile_nav').removeClass('active');
		$('.transparency').css('display','none');
	});
	

});