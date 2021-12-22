<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/signup/signup_common.css">
<link rel="stylesheet" href="./css/signup/signup_identityverification.css">
<title>본인인증</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
						<h1>본인 인증</h1>
					</div>
					<div class="content">
						<p>서비스를 이용하시려면 본인 인증이 필요합니다.</p>
						<div class="content-form">
							<div>
								<form action="create_account" method="get" name="inputform" autocomplete="off" class="input-form">
									<fieldset>
										<div class="input-container-lastname">
											<label for="lastname">성</label>
											<input type="text" id="lastname" name="lastname" autocomplete="off">
										</div>
										<div class="input-container-firstname">
											<label for="firstname">이름</label> <input type="text"
												id="firstname" name="firstname" autocomplete="off">
										</div>
										<div class="input-container-birth">
											<div class="label-checkbox">
												<label>생년월일</label>
											</div>
											<div>
												<input type="tel" class="date" id="year" name="year" autocomplete="off"> 
													<label>년</label> 
												<select class="month" id="month" name="month">
													<option value="월">월</option>
													<option value="1월">1월</option>
													<option value="2월">2월</option>
													<option value="3월">3월</option>
													<option value="4월">4월</option>
													<option value="5월">5월</option>
													<option value="6월">6월</option>
													<option value="7월">7월</option>
													<option value="8월">8월</option>
													<option value="9월">9월</option>
													<option value="10월">10월</option>
													<option value="11월">11월</option>
													<option value="12월">12월</option>
												</select> 
												<label>월</label> 
													<input type="tel" class="day" id="day" name="day" autocomplete="off"> 
												<label>일</label>
											</div>
										</div>


										<div class="input-container-gender">
											<div class="label-checkbox">
												<label for="gender">성별</label>
											</div>
											<div class="radiobox-gender">
												<div class="checkbox">
													<input type="radio" class="gender" name="gender"
														id="gender-male" value="M" autocomplete="off"> <label
														for="gender-male">남자</label>
												</div>
												<div class="checkbox">
													<input type="radio" class="gender" name="gender"
														id="gender-female" value="F" autocomplete="off"> <label
														for="gender-female">여자</label>
												</div>
											</div>
										</div>


										<div class="input-container-mobile">
											<div class="label-checbox">
												<label for="mobile">통신사</label>
											</div>
											<div class="radiobox-mobile-carrier">
												<div class="checkbox">
													<input type="radio" class="mobile_carrier" name="mobile_carrier"
														id="mobile-skt" value="SKT" autocomplete="off"> <label
														for="mobile-skt">SKT</label>
												</div>
												<div class="checkbox">
													<input type="radio" class="mobile_carrier" name="mobile_carrier"
														id="mobile-kt" value="KT" autocomplete="off"> <label
														for="mobile-kt">KT</label>
												</div>
												<div class="checkbox">
													<input type="radio" class="mobile_carrier" name="mobile_carrier"
														id="mobile-lg" value="LGU+" autocomplete="off"> <label
														for="mobile-lg">LGU+</label>
												</div>
												<div class="checkbox">
													<input type="radio" class="mobile_carrier" name="mobile_carrier"
														id="mobile-hello" value="hello" autocomplete="off">
													<label for="mobile-hello">알뜰폰</label>
												</div>
											</div>
										</div>

										<div class="input-container-mobile-hello" style="display:none">
											<div class="label-checbox">
												<label for="mobile-hello">알뜰폰 사업자</label>
											</div>
											<div class="radiobox-mobile">
										<div class="checkbox">
													<input type="radio" class="mobile-hello" name="mobile-hello"
														id="mobile-skt-hello" value="SKT"> <label
														for="mobile-skt-hello">SKT 알뜰폰</label>
												</div>
												<div class="checkbox">
													<input type="radio" class="mobile-hello" name="mobile-hello"
														id="mobile-kt-hello" value="KT"> <label
														for="mobile-kt-hello">KT 알뜰폰</label>
														</div>
												<div class="checkbox">
													<input type="radio" class="mobile-hello" name="mobile-hello"
														id="mobile-lg-hello" value="LGU+"> <label
														for="mobile-lg-hello">LGU+ 알뜰폰</label>
												</div>
											</div>
										</div>
										<div class="input-container-mobile-hello" style="display:none">
											<dl>
												<dt id="mobile-hello-provider"><strong>1</strong></dt>
												<dd id="mobile-hello-provider-detail">2</dd>
											</dl>
										</div>

										<div class="input-container-mobilenum">
											<label for="phoneNumber">휴대폰 번호 (-없이 숫자만 입력)</label> <input
												type="tel" id="mobile_number" name="mobile_number" maxlength="11"
												autocomplete="off" placeholder="예) 01011110000">
										</div>

										<div class="input-container-terms">
											<div class="checkbox-all">
												<label for="checkbox" id="terms-all">
												<input type="checkbox" class="empty" id="checkbox-all" autocomplete="off">
												모두선택
												</label>
											</div>
											<div class="checkbox">
												<label for="checkbox1">
												<input type="checkbox" name="checkbox" class="empty" id="checkbox1">
												개인정보 수집 및 이용에 동의합니다.
												</label>
												
												<input type="checkbox" name="checkbox" class="empty" id="checkbox2"> 
												<label for="checkbox2">고유식별 정보 처리에 동의합니다.
												</label>
												
												<input type="checkbox" name="checkbox" class="empty" id="checkbox3"> 
												<label for="checkbox3">통신사 이용약관에 동의합니다.
												</label>
												
												<input type="checkbox" name="checkbox" class="empty" id="checkbox4">
												<label for="checkbox4">이용약관에 동의합니다.
												</label>
											</div>
										</div>
										<div class="under-content-button">
										<button id="btn_back">뒤로</button>
										<button type="submit" id="btn_request">인증요청</button>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
						<!-- 
						<div class="under-contents">
							<div class="under-content-button">
								<button id="btn_back">뒤로</button>
								<button type="submit" id="btn_request">인증요청</button>
							</div>
						</div>
						 -->
					</div>
				</div>
			</div>
		</div>
	</main>

	<footer> </footer>
</body>
</html>

<script language='javascript'>
	$(document).ready(function(){
		$('#lastname').keyup(function(){
			var lastname = $('#lastname').val().length;
			
			if(lastname > 2){
				$('#lastname').val($(this).val().substring(0,2));
				alert("이름을 제외한 성을 입력해주세요");
				$('#lastname').focus();
			}
		})
	})
</script>

<script language='javascript'>
	$(document).ready(function(){
		$('#year').keyup(function(){
			var year = $('#year').val().length;
			
			if(year > 4){
				$('#year').val($(this).val().substring(0,0));
				alert("년 형식으로 입력해주세요. \n예)2021 2020 1999");
				$('#year').focus();
			}
		})
	})
</script>

<script language='javascript'>
	$(document).ready(function(){
		$('#day').keyup(function(){
			var day = $('#day').val();
			
			if(day > 31 ){
				$('#day').val($(this).val().substring(0,0));
				alert("31일을 넘게 입력하실 수 없습니다.");
				$('#day').focus();
			}
		})
	})
</script>

<script language='javascript'>
	$(document).ready(function() {
		$('#btn_back').click(function() {
			$(location).attr('href', '/terms_agreement');
		});
	});
</script>

<script language='javascript'>
	$(document).ready(function() {
		$('#btn_request').click(function() {
		/*날짜 1900년도 이하 입력시 다음페이지 이동 불가*/
		var yearmin = $('#year').val();
		
		if(yearmin < 1900){
			$('#year').val($(this).val().substring(0,0));
			alert("1900년도 이하는 입력하실 수 없습니다");
			$('#year').focus();
			return false;
			
		}else{
			var lastname = $('#lastname').val();
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
			alert("lastname =" + lastname + 
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
$(function() {
	$('#mobile-hello').click(function() {
		$('.input-container-mobile-hello').css('display',"");
		
		var hello_skt = $('#mobile-skt-hello').val
		console.log(hello_skt);
		var hello_kt = $('#mobile-kt-hello').val
		console.log(hello_kt);
		var hello_lg = $("input[name=mobile-hello]").val
		console.log(hello_lg);
		
		if(hello_skt){
			$('#mobile-hello-provider').text("SKT 알뜰폰 사업자");
			$('#mobile-hello-provider-detail').text("KCT(티플러스),아이즈비전(아이즈모바일),유니컴즈(모빙),스마텔(스마텔),SK텔링크(SK세븐모바일),이마트(이마트알뜰폰),조이텔(조이텔),큰사람(이야기모바일),에스원(안심모바일),LG헬로비전(헬로모바일),머천드코리아(마이월드),프리텔레콤(프리티)");	
		}
		else if(hello_test){
			$('#mobile-hello-provider').text("KT 알뜰폰 사업자");
			$('#mobile-hello-provider-detail').text("이지모바일,아이즈비전,머천드코리아,장성모바일,아이원,한국피엠오㈜(밸류컴),LG헬로비전,KT파워텔,홈플러스,씨엔커뮤니케이션,에넥스텔레콤,에스원,위너스텔,에이씨앤코리아,세종텔레콤,KT텔레캅,프리텔레콤(freeT),kt M모바일,앤텔레콤,제이씨티,유니컴즈,(주)파인디지털,(주)미니게이트,(주)핀플레이,드림라인(주),KCT(Tplus),와이엘랜드(여유텔레콤),큰사람(이야기알뜰폰),(주)니즈텔레콤,(주)에이프러스(아시아모바일),(주)케이티스카이라이프");
		}
		else if(hello_lg){
			$('#mobile-hello-provider').text("LGT 알뜰폰 사업자");
			$('#mobile-hello-provider-detail').text("드림에이치앤비(셀모바일),조이텔(조이텔),에스원(안심모바일),원텔레콤,LG헬로비전(헬로모바일),인스코비(freeT),머천드코리아(마이월드),(주)엠티티텔레콤(메리큐),(주)미디어로그,남인천방송,금강방송,에넥스텔레콤(A모바일),엔티온텔레콤,아시아모바일,슈가모바일,인스모바일,이마트,서경방송,울산방송,푸른방송,제주방송,(주)와이엘랜드(여유텔레콤),ACN코리아(플래시모바일),이지모바일,유니컴즈(모빙),큰사람(이야기),스마텔,레그원(온국민폰),(주)국민은행(Liiv M),코나아이");
		}
	});
	$('#mobile-skt').click(function() {
		$('.input-container-mobile-hello').css('display',"none");
	});
	$('#mobile-kt').click(function() {
		$('.input-container-mobile-hello').css('display',"none");
	});
	$('#mobile-lg').click(function() {
		$('.input-container-mobile-hello').css('display',"none");
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
