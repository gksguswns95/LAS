<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<meta charset="UTF-8">
<link rel="stylesheet" href="./css/signup/signup_common.css">
<link rel="stylesheet" href="./css/signup/signup_termsagreement.css">
<title>약관동의</title>

<style>
</style>


</head>
<body>
	<header>
		<div class="header">
			<div class="header-inner">
				<div class="logo">
					<h1>Account</h1>
				</div>
			</div>
		</div>
	</header>
	
	<main class="ma">
	<div class="main">
		<div class="main-inner">
			<div class="container">
				<div class="title">
					<h1>계정 만들기</h1>
				</div>
				<div class="content">
					<div class="content-checkbox-group">
						<div>
							<form method="post">
								<fieldset>
									<div>
										<label><input type="checkbox" id="terms-agreement-service" name="checkbox" value="이용약관" style="overflow-x: hidden"> 이용약관(필수)</label>
										<label id="terms-agreement-service-lb">
										</label>
									</div>
									<div class="terms-agreement-inner" tabindex="0">
										<div id="terms-agreement-service-detail" style="overflow:scroll; width:100%; height:150px;">
											<b>
												<span style="font-size: x-large">서비스 이용 약관</span>
												<hr>
												<br>
												<br>
												<span style="font-size:small">공지 일자 : 2021년 1월 14일</span>
												<br>
												<br>
												<br>
												<b>환영합니다</b>
												<br>
												<br>
												<b>
												계정을 만들거나, 서비스를 다운로드하거나, 서비스를 사용하는 것은 본 약관에 동의한 것과 같으니 서비스를 이용하기 전에 약관을 자세히 읽어보세요.
												</b>
											</b>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
						
						<div>
							<form method="post">
								<fieldset>
									<div>
										<label><input type="checkbox" id="terms-agreement-personalinfo" name="checkbox" value="개인정보 수집 및 이용"> 개인정보 수집 및 이용(필수)</label>
										<label id="terms-agreement-personalinfo-lb">
										</label>
									</div>
									<div class="terms-agreement-inner" tabindex="0">
										<div id="terms-agreement-personalinfo-detail" style="overflow:scroll; width:100%; height:150px;">
											<b>
												<span style="font-size: x-large">개인정보 수집 및 이용 약관</span>
												<hr>
												<br>
												<br>
												<span style="font-size:small">공지 일자 : 2021년 1월 14일</span>
												<br>
												<br>
												<br>
												<b>환영합니다</b>
												<br>
												<br>
												<b>
												계정을 만들거나, 서비스를 다운로드하거나, 서비스를 사용하는 것은 본 약관에 동의한 것과 같으니 서비스를 이용하기 전에 약관을 자세히 읽어보세요.
												</b>
											</b>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
						
						<div>
							<form method="post">
								<fieldset>
									<div>
										<label><input type="checkbox" id="terms-agreement-sns" name="checkbox" value="광고성 정보 수신"> 광고성 정보 수신 동의(선택)</label>
										<label id="terms-agreement-sns-lb">
										</label>
									</div>
									<div class="terms-agreement-inner" tabindex="0">
										<div id="terms-agreement-sns-detail" style="overflow:scroll; width:100%; height:150px;">
											<b>
												<span style="font-size: x-large">광고성 정보 수신 동의 약관</span>
												<hr>
												<br>
												<br>
												<span style="font-size:small">공지 일자 : 2021년 1월 14일</span>
												<br>
												<br>
												<br>
												<b>환영합니다</b>
												<br>
												<br>
												<b>
												계정을 만들거나, 서비스를 다운로드하거나, 서비스를 사용하는 것은 본 약관에 동의한 것과 같으니 서비스를 이용하기 전에 약관을 자세히 읽어보세요.
												</b>
											</b>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
						
						<div class="bar">
							<hr>
						</div>
						
						<div class="checkbox-all">
							<label><input type="checkbox" autocomplete="off" id="checkbox-all"> 위의 내용을 모두 읽었으며 이에 동의합니다.</label>
						</div>
						
					</div>
					
				</div>
				<div class="under-content">
					<div class="under-content-button">
						<button id="btn_agree">동의</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	</main>
	
	<footer>
	</footer>
</body>
</html>

<script language='javascript'>
$(document).ready(function() {	
	$('#btn_agree').click(function() {
		var terms_agreement_service = $('input:checkbox[id="terms-agreement-service"]').is(":checked");
		var terms_agreement_personalinfo = $('input:checkbox[id="terms-agreement-personalinfo"]').is(":checked");
		var terms_agreement_sns = $('input:checkbox[id="terms-agreement-sns"]').is(":checked");
		
		console.log(terms_agreement_service);
		console.log(terms_agreement_personalinfo);
		console.log(terms_agreement_sns);
		
		if(terms_agreement_service == false && terms_agreement_personalinfo == true){
			alert("서비스 이용약관에 동의 해주세요.");
			$('#terms-agreement-service').focus();
		}
		else if(terms_agreement_personalinfo == false && terms_agreement_service == true){
			alert("개인정보 수집 및 이용약관에 동의 해주세요.");
			$('#terms-agreement-personalinfo').focus();
		}
		else if(terms_agreement_personalinfo == false && terms_agreement_service == false){
			alert("필수 항목에 동의 해주세요.");
			$('#terms-agreement-personalinfo').focus();
		}else{
			/*
			alert("terms_agreement_service =" + terms_agreement_service +
					"\nterms_agreement_personalinfo=" + terms_agreement_personalinfo +
					"\nterms_agreement_sns=" + terms_agreement_sns);
			*/
			$(location).attr('href', '/identity_verification');
		}
		
	});
});
</script>

<script>
$(document).ready(function() {
	$("#checkbox-all").click(function() {
		
		if($("#checkbox-all").is(":checked")) $("input[name=checkbox]").prop("checked", true);
		else $("input[name=checkbox]").prop("checked", false);
	});
	// 모두 동의 클릭 or not
	

	$("input[name=checkbox]").click(function() {
		var total = $("input[name=checkbox]").length;
		var checked = $("input[name=checkbox]:checked").length;
		
		if(total == checked) $("#checkbox-all").prop("checked", true);
		else $("#checkbox-all").prop("checked", false);
	});
});

</script>


