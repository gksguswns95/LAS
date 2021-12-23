$(document).ready(function() {
	var urlParam = location.search.substr(location.search.indexOf("?") + 1);
	var paramArr = urlParam.split('=');
	console.log(urlParam);
	console.log(urlParam.split('='));
	if(paramArr[0] == 'error' && paramArr[1] == 'login') {
		$('.layer').fadeIn();
	}
	
	$('.btn-layerClose').on('click',function() {
		$('.layer').fadeOut();
	})

});