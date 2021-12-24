$(document).ready(function() {
	var urlParam = location.search.substr(location.search.indexOf("?") + 1);
	var paramArr = urlParam.split('=');
	if(paramArr[0] == 'error' && paramArr[1] == 'login') {
		$('.layer').fadeIn();
		//$('#faill').text("아이디 또는 비밀번호가 잘못 입력 되었습니다.<br>아이디와 비밀번호를 정확히 입력해 주세요.");
		//$('#faill').css('color','red');
	}
	
	$('.btn-layerClose').on('click',function() {
		$('.layer').fadeOut();
	});
	

});