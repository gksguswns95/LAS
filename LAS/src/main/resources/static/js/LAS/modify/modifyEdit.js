$(function() {
	$('#btn_next_accountModify').click(function() {
		var first_phone = /^010/;
		var reg_phone = /([^0-9]+)/;
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+).(\.[0-9a-zA-Z_-]+){1,2}$/;
		var phoneRest = $('#phone').val().replaceAll('-','');
		if(!(phoneRest.length == 11) || !first_phone.test(phoneRest) || reg_phone.test(phoneRest)) {
			$('.field input')[3].noneError();
			$('.field input')[3].error();
			$('#pw').focus();
		} else if(!reg_email.test( $('#email').val() ) ) {
			$('.field input')[4].noneError();
			$('.field input')[4].error();
			$('#email').focus();
		} else {
			$('#phone').val(phoneRest);
			$('#form-accountModify').submit();
		}
		
	});
	
	$('#1, #2, #3').change(function() {
		var change_name = $('#1').val()+" "+$('#2').val()+" "+$('#3').val();
		$('#favor-Stroe').val(change_name)
	})
});