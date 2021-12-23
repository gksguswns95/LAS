$(document).ready(function() {
	var phoneValue = $('#phone').val();
	console.log($('#phone').val())
	var phoneNumberview = '';
	phoneNumberview += phoneValue.substring(0,3);
	phoneNumberview += '-';
	phoneNumberview += phoneValue.substring(3,7);
	phoneNumberview += '-';
	phoneNumberview += phoneValue.substring(7,11);
	console.log(phoneNumberview);
	$('#phone').val(phoneNumberview);
});