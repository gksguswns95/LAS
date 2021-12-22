$(document).ready(function() {
	var userID = getCookie("userID");
	$("#id").val(userID);

	if ($("#idCheck").val() != "") {
		$("#idCheck").attr("checked", true);
	}
	
	$('#login_section i').on('click', function() {
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

	$('#id').focusout(function() {
		var first_phone = /^010/g;
		var reg_phone = /^[0-9]*$/g;
		var number = $('#id').val();
		var phoneNumber = "";
		
		if(reg_phone.test(number) && first_phone.test(number) && number.length == 11) {
			phoneNumber += number.substring(0,3);
			phoneNumber += '-';
			phoneNumber += number.substring(3,7);
			phoneNumber += '-';
			phoneNumber += number.substring(7,11);
			$('#id').val(phoneNumber);
		}
	});
	
	$('#submit').submit(function() {
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	var reg_phone = /^[0-9]*$/g;
		if (!reg_email.test($('#id').val())) {
			if (!reg_phone.test($('#id').val()) || ($("#id").val().length > 11 || $("#id").val().length < 11)) {		
				alert("핸드폰 번호 또는 이메일을 입력해주세요.");
				return false;
			}
		}
		
		if ($("#idCheck").is(":checked")) {
			var userID = $("#id").val();
			setCookie("userID", userID, 7);
		} else {
			deleteCookie("userID");
		}
		
	});
	$('.btn_join').on('click', function(){location.href="/terms_agreement"});
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