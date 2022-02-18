$(function() {
	$($('.input-box-wrap')[0]).click(function() {
		checkbox_allFalse();
		checkbox_check(0);
	});
	$($('.input-box-wrap')[1]).click(function() {
		checkbox_allFalse();
		checkbox_check(1);	
	});
	$($('.input-box-wrap')[2]).click(function() {
		checkbox_allFalse();
		checkbox_check(2);
	});
	$($('.input-box-wrap')[3]).click(function() {
		checkbox_allFalse();
		checkbox_check(3);
	});
	$($('.input-box-wrap')[4]).click(function() {
		checkbox_allFalse();
		checkbox_check(4);
	});
	
	function checkbox_check(i) {
		$($('.input-box-wrap')[i]).toggleClass('checked');
		$('#del-reason').val(i+1);
		if( !($('#del-reason').prop('checked'))) {
			$('#del-reason').prop('checked',true);
		}
	}
	
	function checkbox_allFalse() {
		$($('.input-box-wrap')[0]).removeClass('checked');
		$($('.input-box-wrap')[1]).removeClass('checked');
		$($('.input-box-wrap')[2]).removeClass('checked');
		$($('.input-box-wrap')[3]).removeClass('checked');
		$($('.input-box-wrap')[4]).removeClass('checked');
	}
	
	$($('.input-box-wrap')[5]).click(function() {
		if($($('.input-box-wrap')[5]).hasClass('checked') && $($('.input-box-wrap')[6]).hasClass('checked')) {
			$('#btn_next_pwinput').prop('disabled',false);
		} else {
			$('#btn_next_pwinput').prop('disabled',true);
		}
	});
	
	$($('.input-box-wrap')[6]).click(function() {
		if($($('.input-box-wrap')[5]).hasClass('checked') && $($('.input-box-wrap')[6]).hasClass('checked')) {
			$('#btn_next_pwinput').prop('disabled',false);
		} else {
			$('#btn_next_pwinput').prop('disabled',true);
		}
	});
	
	$('#btn_next_pwinput').click(function() {
		if( ( $($('.input-box-wrap')[0]).hasClass('checked') || $($('.input-box-wrap')[1]).hasClass('checked') || $($('.input-box-wrap')[2]).hasClass('checked')
		|| $($('.input-box-wrap')[3]).hasClass('checked') || $($('.input-box-wrap')[4]).hasClass('checked') ) && $($('.input-box-wrap')[5]).hasClass('checked') && $($('.input-box-wrap')[6]).hasClass('checked')) {
			$('#form-reason').submit();
		}
	});
	
	$('#btn_next_accountDel').click(function() {
		if($('#pwAuth').val().length > 7) {
			accountDel_PasswordCheck($('#pwAuth').val());			
		} else {
			alery('!')
			$('.field input')[0].noneError();
			$('.field input')[0].error();
		}
	});
	
	function accountDel_PasswordCheck(pw) {
		$.ajax({
			url : '/prototype/accountDel_PasswordCheck',
			type:'post',
			data:{pw:pw},
			success:function(Accountcount) {
				if(Accountcount == 1) {
					location.href = '/prototype/accountDel';
				} else {
					$('.field input')[0].noneError();
					$('.field input')[0].error();
					$('#pw-error-txt').css({"color":"red"});
					$('#pw-error-txt').text('비밀번호가 일치하지 않습니다.');
				}
			},
			error:function() {
				alert("비밀번호 조회 실패! 다시시도해주세요.");
			}
		})
	}
});