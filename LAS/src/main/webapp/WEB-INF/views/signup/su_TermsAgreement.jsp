<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/signup/signup_common.css">
<link rel="stylesheet" href="./css/signup/signup_termsagreement.css">
<link rel="stylesheet" href="./css/signin/signin.css">
<link rel="stylesheet" href="./css/mobile.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<script src="./js/mobile.js"></script>
<script src="./js/signin/signin.js"></script>
<title>L.A.S - 약관동의</title>

<style>
</style>


</head>
<body>
	<div class="container">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="main">
			<div class="main-inner">
				<form method="get" action="/identity_verification"
					id="identity_verification">
					<div id="container">
						<div class="title">
							<h1>계정 만들기</h1>
						</div>
						<div class="content">
							<div class="content-checkbox-group">

								<!-- 전체동의 -->
								<div class="checkbox-all">
									<label id="bold"><input type="checkbox" id="checkbox-all">&nbsp;이용
										약관(필수), 개인정보 수집 및 이용(필수), 광고성 정보 수신 동의(선택) 에 모두 동의합니다.</label>
								</div>

								<div>
									<jsp:include page="su_serviceTA.jsp"></jsp:include>
								</div>
								<div>
									<jsp:include page="su_personalinfoTA.jsp"></jsp:include>
								</div>
								<div>
									<jsp:include page="su_snsTA.jsp"></jsp:include>
								</div>
								<div class="bar">
									<hr>
								</div>


							</div>

						</div>
						<div class="under-content">
							<div class="under-content-button">
								<button id="btn_agree" type="submit">동의</button>
							</div>
						</div>

					</div>
				</form>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	<div class="transparency"></div>
</body>
</html>

<script language='javascript'>
	$(document)
			.ready(
					function() {
						$('#identity_verification')
								.submit(
										function() {
											var terms_agreement_service = $(
													'input:checkbox[id="terms-agreement-service"]')
													.is(":checked");
											var terms_agreement_personalinfo = $(
													'input:checkbox[id="terms-agreement-personalinfo"]')
													.is(":checked");
											//var terms_agreement_sns = $('input:checkbox[id="terms-agreement-sns"]').is(":checked");

											console
													.log(terms_agreement_service);
											console
													.log(terms_agreement_personalinfo);
											//console.log(terms_agreement_sns);

											if (terms_agreement_service == false
													&& terms_agreement_personalinfo == true) {
												alert("서비스 이용약관에 동의 해주세요.");
												$('#terms-agreement-service')
														.focus();
												return false;
											} else if (terms_agreement_personalinfo == false
													&& terms_agreement_service == true) {
												alert("개인정보 수집 및 이용약관에 동의 해주세요.");
												$(
														'#terms-agreement-personalinfo')
														.focus();
												return false;
											} else if (terms_agreement_personalinfo == false
													&& terms_agreement_service == false) {
												alert("필수 항목에 동의 해주세요.");
												$(
														'#terms-agreement-personalinfo')
														.focus();
												return false;
											}

										});

					});
</script>




<script>
	$(document).ready(function() {
		$("#checkbox-all").click(function() {

			if ($("#checkbox-all").is(":checked")) {
				$("input[name=checkboxYN]").prop("checked", true);

			} else {
				$("input[name=checkboxYN]").prop("checked", false);
			}
		});
		// 모두 동의 클릭 or not

		$("input[name=checkboxYN]").click(function() {
			var total = $("input[name=checkboxYN]").length;
			var checked = $("input[name=checkboxYN]:checked").length;

			if (total == checked) {
				$("#checkbox-all").prop("checked", true);
			} else {
				$("#checkbox-all").prop("checked", false);
			}
		});
	});
</script>

