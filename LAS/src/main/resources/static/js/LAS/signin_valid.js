$(function() {
	var userID = getCookie("userID");
	if(userID.length > 5) {
		$('.input-box-wrap').toggleClass('checked');
		$("#id").val(userID);
		$($('.tit').parents('.field')[1]).addClass("on").find(".input input");
	}
	
	$('#id').keyup(function() {
		$('.field .input-box-wrap').css('margin-top','1rem');
	});
	
	$('#id').focusout(function() {
		var first_phone = /^010/;
		var reg_phone = /([^0-9]+)/;
		var number = $('#id').val();
		var phoneNumber = "";
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+).(\.[0-9a-zA-Z_-]+){1,2}$/;
		var phoneNumerreset = $('#id').val().replaceAll('-', '');
		
		if (!reg_email.test(phoneNumerreset)) {
			if (reg_phone.test(phoneNumerreset) || !(phoneNumerreset.length == 11) || !first_phone.test(number)) {
				if(number.length != 0) {
					$('.field input')[0].noneError();
					$('.field input')[0].error();
					$('.field .input-box-wrap').css('margin-top','2rem');
				}
			} else {
				$('.field input')[0].noneError();
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
	
	$('#id').focusin(function() {
		var number = $('#id').val();
		var first_phone = /010/;
		var reg_hyphen = /-/g;
		var phoneNumerreset = $('#id').val().replaceAll('-', '');
		
		if(first_phone.test(number) && reg_hyphen.test(number) && number.length == 13) {
			$('#id').val(phoneNumerreset);			
		}
	});
	
	$('.input-box-wrap').click(function() {
		if( !($('.input-box-wrap').hasClass('checked'))) {
			deleteCookie("userID");
		}
	});
	
	$('#btn-signin').click(function() {
		// 아이디 기억하기
		if ($('.input-box-wrap').hasClass('checked')) {
			var userID = $("#id").val();
			setCookie("userID", userID, 7);
		}
		
		// 로그인 프로세스
		if($($('.field')[0]).hasClass('error')) {
			$('.field input')[0].noneError();
			$('#id').focus();
			$('.field input')[0].error();
		} else if($($('.field')[0]).hasClass('error')) {
			$('.field input')[2].noneError();
			$('#pw').focus();
			$('.field input')[2].error();
		} else {
			signinProcess($('#id').val(),$('#pw').val());
		}
	});
	
	function signinProcess(id,pw) {
		$.ajax({
			url: '/prototype/signin',
			method: 'post',
			data: {id:id,pw:pw},
			success: function(cnt) {
				if(cnt == 1) {
					location.href= '/prototype/account_view_my';
				} else {
					$('.field input')[2].noneError();
					$('.field input')[2].error();
				}
			},
			error : function() {alert('로그인 실패');}
		});
	}
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