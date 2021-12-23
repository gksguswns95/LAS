<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/signup/signup_common.css">
<link rel="stylesheet"
	href="./css/signup/signup_identityverification.css">

<link rel="stylesheet" href="./css/signin/signin.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<title>본인인증</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
</style>

</head>
<body>
	<div class="container">
		<div class="header"><a href="/">L.A.S</a></div>
		<main class="main">
			<div class="main-inner">
				<div class="title">
					<h1>계정 생성</h1>
				</div>
				<div class="content">
					<p>서비스를 이용하시려면 본인 인증이 필요합니다.</p>
					<div class="content-form">
						<div>
							<!--
							<form action="welcome" method="get" name="inputform" autocomplete="off" class="input-form">
							 -->
								<fieldset>
									<div class="input-container-name">
										<label for="name">이름</label> <input type="text" id="name"
											name="name" autocomplete="off">
									</div>

									<div class="input-container-birth">
										<div class="label-checkbox">
											<label>생년월일</label>
										</div>
									<input type="text" class="date" id="year" name="year" autocomplete="off" placeholder="예) 19990113">
									</div>

									<!-- 업데이트 내용 -->
									<div class="content">
										<div class="content-form">
											<fieldset>
												<div id="signup-form-id" class="signup-form-id">
													<label id="lb-id" for="signup-id">이메일</label> <input
														id="signup-id" name="signup-id" type="email">
												</div>
												<div id="signup-form-pw" class="signup-form-pw">
													<label id="lb-pw" for="signup-pw">비밀번호</label> <input
														id="signup-pw" name="signup-pw" type="password">
												</div>
												<div id="signup-form-pwcfm" class="signup-form-pwcfm">
													<label id="lb-pwcfm" for="signup-pwcfm">비밀번호 확인</label> <input
														id="signup-pwcfm" name="signup-cfm" type="password">
												</div>

												<div class="input-container-mobilenum">
													<label for="phoneNumber">휴대폰 번호 (-없이 숫자만 입력)</label> <input
														type="tel" id="mobile_number" name="mobile_number"
														maxlength="11" autocomplete="off"
														placeholder="예) 01045671234">
												</div>
											</fieldset>
										</div>
									</div>

									<div class="input-container-terms">
										<div class="checkbox-all">
											<input type="checkbox" class="empty" id="checkbox-all"
												autocomplete="off"> <label for="checkbox-all"
												id="terms-all">모두선택 </label>
										</div>
										<div class="checkbox">
											<p>
												<input type="checkbox" name="checkbox" class="empty"
													id="checkbox1"> <label for="checkbox1">개인정보
													수집 및 이용에 동의합니다. </label>
											</p>
											<p>
												<input type="checkbox" name="checkbox" class="empty"
													id="checkbox2"> <label for="checkbox2">고유식별
													정보 처리에 동의합니다. </label>
											</p>
											<p>
												<input type="checkbox" name="checkbox" class="empty"
													id="checkbox3"> <label for="checkbox3">통신사
													이용약관에 동의합니다. </label>
											</p>
											<p>
												<input type="checkbox" name="checkbox" class="empty"
													id="checkbox4"> <label for="checkbox4">이용약관에
													동의합니다. </label>
											</p>
										</div>
									</div>
									<div class="under-content-button">
										<button id="btn_back">뒤로</button>
										<button type="submit" id="btn_next">다음</button>
									</div>
								</fieldset>
							<!-- 
							</form>
							 -->
						</div>
					</div>
				</div>
			</div>
		</main>
		<div class="footer">Footer</div>
	</div>
</body>
</html>

<script language='javascript'>
	$(document).ready(function() {
		$('#btn_back').click(function() {
			$(location).attr('href', '/terms_agreement');
		});
	});
</script>

<script language='javascript'>
$(document).ready(function() {
	$('#btn_next').click(function() {
		
		var signup_id = $('#signup-id').val();
		var signup_pw = $('#signup-pw').val();
		var signup_pwcfm = $('#signup-pwcfm').val();
		
		/*
		alert("signup_id =" + signup_id + 
				"\nsignup_pw =" + signup_pw +
				"\nsignup_pwcfm =" + signup_pwcfm);
		*/
		$(location).attr('href','/welcome');
	});
});
</script>

<script language='javascript'>
	$(document).ready(function() {
		$('#name').keyup(function() {
			var name = $('#name').val().length;

			if (name > 20) {
				$('#name').val($(this).val().substring(0, 0));
				alert("이름은 최대 20글자까지만 가능합니다.");
				$('#name').focus();
			}
		})
	})
</script>

<script language='javascript'>
	$(document).ready(function() {
		$('#year').keyup(function() {
			var year = $('#year').val().length;

			if (year > 4) {
				$('#year').val($(this).val().substring(0, 0));
				alert("년 형식으로 입력해주세요. \n예)2021 2020 1999");
				$('#year').focus();
			}
		})
	})
</script>

<script language='javascript'>
	$(document).ready(function() {
		$('#day').keyup(function() {
			var day = $('#day').val();

			if (day > 31) {
				$('#day').val($(this).val().substring(0, 0));
				alert("31일을 넘게 입력하실 수 없습니다.");
				$('#day').focus();
			}
		})
	})
</script>

<script language='javascript'>
	$(document).ready(function() {
		$('#btn_next').click(function() {
			/*날짜 1900년도 이하 입력시 다음페이지 이동 불가*/
			var yearmin = $('#year').val();
			if (yearmin < 1920) {
				$('#year').val($(this).val().substring(0,0));
				alert("1920년도 이하는 입력하실 수 없습니다");
				$('#year').focus();
				return false;
			}else{
				var name = $('#name').val();
				var firstname = $('#firstname').val();
				var year = $('#year').val();
				var month = $('#month').val();
				var day = $('#day').val();
				var gender = $('input:radio[name="gender"]:checked').val();
				var mobile_carrier = $('input:radio[name="mobile_carrier"]:checked').val();
				var mobilenum = $('#mobile_number').val();
				var personalinfoTA = $('input:checkbox[name="checkbox1"]:checked').val();
				var uniqueinfoTA = $('input:checkbox[name="checkbox2"]:checked').val();
				var mobileTA = $('input:checkbox[name="checkbox3"]:checked').val();
				var useTA = $('input:checkbox[name="checkbox4"]:checked').val();

			/*
			alert("name =" + name + 
				"\nfirstname =" + firstname +
				"\nyear =" + year + 
				"\nmonth =" + month +
				"\nday =" + day +
				"\ngender =" + gender +
				"\nmobile_carrier =" + mobile_carrier +
				"\nmobilenum =" + mobilenum + 
				"\npersonalinfoTA =" + personalinfoTA +
				"\nuniqueinfoTA =" + uniqueinfoTA +
				"\nmobileTA =" + mobileTA +
				"\nuseTA =" + useTA
				);
			 */
		}
	});
});
</script>

<script language='javascript'>
	$(document).ready(function() {
		$("#checkbox-all").click(function() {

			if ($("#checkbox-all").is(":checked"))
				$("input[name=checkbox]").prop("checked", true);
			else
				$("input[name=checkbox]").prop("checked", false);
		});
		// 모두 동의 클릭 or not

		$("input[name=checkbox]").click(function() {
			var total = $("input[name=checkbox]").length;
			var checked = $("input[name=checkbox]:checked").length;
			console.log(total);
			console.log(checked);

			if (total == checked)
				$("#checkbox-all").prop("checked", true);
			else
				$("#checkbox-all").prop("checked", false);
		});
	});
</script>
