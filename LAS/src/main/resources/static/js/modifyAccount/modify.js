$(document).ready(function() {
	
	var disabledPhone = document.querySelector('#phone').disabled
	var disabledEmail = document.querySelector('#email').disabled
	if(disabledPhone) {
		$('#phone').css('border','none');
	}

	if(disabledEmail) {
		$('#email').css('border','none');
	}
	var phoneValue = $('#phone').val();
	var phoneNumberview = '';
	phoneNumberview += phoneValue.substring(0,3);
	phoneNumberview += '-';
	phoneNumberview += phoneValue.substring(3,7);
	phoneNumberview += '-';
	phoneNumberview += phoneValue.substring(7,11);
	$('#id').val(phoneNumberview);
});