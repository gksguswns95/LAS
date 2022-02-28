$(function() {
	$('#name').css('background','#ebebeb');
	$('#pw').css('background','#ebebeb');
	$('#birth').css('background','#ebebeb');
	$('#favor-Stroe').css('background','#ebebeb');
	
	if($('#phone').prop('readonly')) {
		$('#phone').css('background','#ebebeb');
	}
	
	if($('#email').prop('readonly')) {
		$('#email').css('background','#ebebeb');
	}
});