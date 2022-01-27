$(function() {
	$('#id').focusout(function() {
		var first_phone = /^010/;
		var reg_phone = /([^0-9]+)/;
		var number = $('#id').val();
		var phoneNumber = "";
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+).(\.[0-9a-zA-Z_-]+){1,2}$/;
		var phoneNumerreset = $('#id').val().replaceAll('-', '');
		
		if (!reg_email.test(phoneNumerreset)) {
			if (reg_phone.test(phoneNumerreset) || !(phoneNumerreset.length == 11) || !first_phone.test(number)) {
				$(".container #section").css('height', '520px');
				$('#fail').text("핸드폰 번호 또는 이메일을 입력해주세요.");
			} else {
				$('#fail').text('');
			}
		}

		if (!reg_phone.test(number) && first_phone.test(number) && number.length == 11) {
			phoneNumber += number.substring(0, 3);
			phoneNumber += '-';
			phoneNumber += number.substring(3, 7);
			phoneNumber += '-';
			phoneNumber += number.substring(7, 11);
			$('#id').val(phoneNumber);
		}
		
	});
	

});

function setCookie(cookieName, value, exdays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName) {
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if (start != -1) {
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if (end == -1) end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}