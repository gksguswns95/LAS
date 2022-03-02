$(function() {
	var doubleClickCheck = 0;
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+).(\.[0-9a-zA-Z_-]+){1,2}$/;
	var reg_phone = /([^0-9]+)/;
	var first_phone = /^010/;
	
	$('#btn_next_birth').click(function() {
		if(reg_email.test($('#id').val())) {
			checkid($('#id').val(),'email');
		} else {
			checkid($('#id').val(),'phone');
		}
	});
	
	    
	$('#btn_next_pin').click(function() {
		doubleClickCheck++;
		reg_number = /[^0-9]/g;
		if(doubleClickCheck < 2) {
			if($('#name').val().length < 2) {
				$('.field input')[0].error();
			} else if($('#birth').val().length != 8 || reg_number.test($('#birth').val()) ) {
				$('.field input')[1].error();
			} else {
				nameBirth_check($('#name').val(),$('#birth').val());
			}
		}
		
	});
	
	function checkid(id,type){
        $.ajax({
           url:'/prototype/pw_idCheck', 
            type:'post', 
            data:{id:id,type:type},
            success:function(cnt) {
            	if(cnt != 1){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
        			$('.field input')[0].noneError();
        			$('.field input')[0].error();
                } else {
					location.href= '/prototype/reset_pw_birth';
				}
            },
            error:function(){
            	alert("아이디 중복확인이 실패했습니다. 다시시도해주세요.");
            }
        });
    };

	function nameBirth_check(name,birth){
        $.ajax({
           url:'/prototype/pw_nameBirthCheck', 
            type:'post', 
            data:{name:name,birth:birth},
            success:function(cnt) {  
            	if(cnt != 1){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
        			$($('.field')[2]).toggleClass('error');
                } else {
					location.href= '/prototype/reset_pw_pin';
				}
            },
            error:function(){
            	alert("이름 및 생년월일 확인을 실패했습니다. 다시시도해주세요.");
            }
        });
    };
    
    
    $('#pwAuth').keyup(function() {
		$('.field input')[0].noneError();
	});
    
    $('#pw').keyup(function() {
		var regUpper = /[A-Z]/g;
		var regLower = /[a-z]/g;
		var regNumber = /[0-9]/g;
		var regSpecialCharacter = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
		var pw = $('#pw').val();
		
		//대문자 체크
		if(regUpper.test(pw)) {
			if($('#upper').hasClass('fontColor1')) {
				$('#upper').removeClass('fontColor1');				
			}
			if(!($('#upper').hasClass('fontColor2'))) {
				$('#upper').toggleClass('fontColor2');
			}
		} else {
			if($('#upper').hasClass('fontColor2')) {
				$('#upper').removeClass('fontColor2');				
			}
			if(!($('#upper').hasClass('fontColor1'))) {
				$('#upper').toggleClass('fontColor1');
			}
		}
		
		//소문자 체크
		if(regLower.test(pw)) {
			if($('#lower').hasClass('fontColor1')) {
				$('#lower').removeClass('fontColor1');				
			}
			if(!($('#lower').hasClass('fontColor2'))) {
				$('#lower').toggleClass('fontColor2');
			}
		} else {
			if($('#lower').hasClass('fontColor2')) {
				$('#lower').removeClass('fontColor2');				
			}
			if(!($('#lower').hasClass('fontColor1'))) {
				$('#lower').toggleClass('fontColor1');
			}
		}
		
		//숫자 체크
		if(regNumber.test(pw)) {
			if($('#number').hasClass('fontColor1')) {
				$('#number').removeClass('fontColor1');				
			}
			if(!($('#number').hasClass('fontColor2'))) {
				$('#number').toggleClass('fontColor2');
			}
		} else {
			if($('#number').hasClass('fontColor2')) {
				$('#number').removeClass('fontColor2');				
			}
			if(!($('#number').hasClass('fontColor1'))) {
				$('#number').toggleClass('fontColor1');
			}
		}
		
		//특수문자 체크
		if(regSpecialCharacter.test(pw)) {
			if($('#specialCharacter').hasClass('fontColor1')) {
				$('#specialCharacter').removeClass('fontColor1');				
			}
			if(!($('#specialCharacter').hasClass('fontColor2'))) {
				$('#specialCharacter').toggleClass('fontColor2');
			}
		} else {
			if($('#specialCharacter').hasClass('fontColor2')) {
				$('#specialCharacter').removeClass('fontColor2');				
			}
			if(!($('#specialCharacter').hasClass('fontColor1'))) {
				$('#specialCharacter').toggleClass('fontColor1');
			}
		}
	});
	
	$('#pw, #pwcfm').on('focusout', function(){
		//var reg_pw = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
		var reg_pw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/g;
		var pw = $('#pw').val();
		var pwcfm = $('#pwcfm').val();
		var pwnone = $('#pw').val().length;
		var pwcfmnone = $('#pwcfm').val().length;
			
		if(!reg_pw.test(pw)){
			$('.field input')[0].noneError();
			$('.field input')[0].error();
			$('#pw-error-txt').css({"color":"red"});
			$('#pw-error-txt').text('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
			if(pw != pwcfm && pwcfmnone > 0) {
				$('#pwcfm-error-txt').text('입력하신 비밀번호와 틀립니다. 비밀번호를 다시 확인해주세요.');
				$('#pwcfm-error-txt').css({"color":"red"});
			}
		}else{
			$('.field input')[0].noneError();
			$('#pw-error-txt').css({"color":"green"});
			$('#pw-error-txt').text('사용 가능한 비밀번호 입니다.');
			if(pw != pwcfm && pwcfmnone > 0) {
				$('.field input')[1].error();
				$('#pwcfm-error-txt').text('입력하신 비밀번호와 다릅니다. 비밀번호를 다시 확인해주세요.');
				$('#pwcfm-error-txt').css({"color":"red"});				
			}
		}
		
		if(pw != pwcfm && pwcfmnone != 0){
			$('.field input')[1].noneError();
			$('.field input')[1].error();
			$('#pwcfm-error-txt').text('입력하신 비밀번호와 다릅니다. 비밀번호를 다시 확인해주세요.');
			$('#pwcfm-error-txt').css({"color":"red"});
		}
		if(pw == pwcfm && pwcfmnone != 0){
			$('.field input')[1].noneError();
			$('#pwcfm-error-txt').text('비밀번호가 동일합니다.');
			$('#pwcfm-error-txt').css({"color":"green"});
		}
		if(pwcfmnone == 0){
			$('#pwcfm-error-txt').text('');
		}
	});
	
	$('#btn_next_comp').click(function() {
	
		if($('#pw-error-txt').text() != '사용 가능한 비밀번호 입니다.') {
			$('#pw').focus();
			$('.field input')[0].noneError();
			$('.field input')[0].error();
		} else if($('#pwcfm-error-txt').text() != '비밀번호가 동일합니다.') {
			$('#pwcfm').focus();
			$('.field input')[1].noneError();
			$('.field input')[1].error();
		} else {
			$('#form-resetPW').submit();
		}
		
	});
	
	$('#btn_next_profile').click(function() {
	
		if($('#pw-error-txt').text() != '사용 가능한 비밀번호 입니다.') {
			$('#pw').focus();
			$('.field input')[0].noneError();
			$('.field input')[0].error();
		} else if($('#pwcfm-error-txt').text() != '비밀번호가 동일합니다.') {
			$('#pwcfm').focus();
			$('.field input')[1].noneError();
			$('.field input')[1].error();
		} else {
			$('#form-resetPW').submit();
		}
		
	});

});