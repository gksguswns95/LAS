<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <title>LAS</title>
    <link rel="stylesheet" type="text/css" href="../css/LAS/swiper.css">
    <link rel="stylesheet" type="text/css" href="../css/LAS/common.css">
</head>

<body>
<!-- wrap-->
<div id="wrap">
    <!-- header -->    
    <header id="header">
        <div class="inner-wrap">
            <div class="arr">
                <i class="fa fa-angle-left" aria-hidden="true" onclick="javascript:location.href='/prototype/main';"></i>
            </div>
            <h1>LG 계정</h1>
        </div>
    </header>
    <!-- // header -->

    <!-- container -->
    <div id="container">
        <div id="contents">
            <!-- 컨텐츠 영역 -->
            <div class="vc-box">
                <div class="inner-wrap">
                    <p class="top-txt">
                        <b>안녕하세요!</b><br />
                        이메일주소, 또는 핸드폰번호로<br />
                        계정을 쉽고 빠르게 생성하세요.<br />
                        또는 SNS 계정인증으로 간편하게<br />
                        LG전자 서비스를 이용할 수 있습니다.
                    </p>
                    <div class="cb-type-select-box">
                        <fieldset>
                            <label  class="check-box-label fill txt-size-small">이메일주소, 또는 핸드폰번호로 계정을 만들겠습니다.<input type="checkbox" name="signup_type" value="1" id="lg_signup" checked="checked"></label>
                        </fieldset>
                        <fieldset>
                            <label  class="check-box-label fill txt-size-small">자주 쓰는 SNS계정인증으로 계정을 만들겠습니다.<input type="checkbox" name="signup_type" value="2" id="sns_signup"></label>
                        </fieldset>
                    </div>
                    <div class="btn-set">
                        <button class="button-basic">다음</button>
                    </div>
                </div>
            </div>
            <a href="javascript:;" class="both-txt-footerTop">
                혹시, 잊고있던 LG계정이 있지 않을까요?  사용하던 계정을 찾아보시는 것은 어떨까요?
            </a>
            <!-- // 컨텐츠 영역 -->
        </div>
        <!-- // contents -->
    </div>
    <!-- container -->
    <!-- footer -->
    <footer>
        <ul class="terms">
            <li><a href="javascript:;">공지사항</a></li>
            <li class="line"></li>
            <li><a href="javascript:;">문의하기</a></li>
            <li class="line"></li>
            <li><a href="javascript:;">이용약관</a></li>
            <li class="line"></li>
            <li><a href="javascript:;">개인정보 처리방침</a></li>
        </ul>
        <p class="copy">Copyright ⓒ 2022 LG Electronics. All Rights Reserved</p>
    </footer>
    <!-- // footer -->
</div>
	<!-- wrap -->
	<!-- 스크립트 영역 -->
	<script src="../js/LAS/jquery-3.4.1.min.js"></script>
	<script src="../js/LAS/swiper.min.js"></script>
	<script src="../js/LAS/common_ui.js"></script>
	<script>
		$(function() {
			$('.check-box-wrap:eq(0)').trigger('click');
			// 체크박스 클릭 시 하나만 체크되게하기
			$('.check-box-wrap').click(function() {
				if( $('.check-box-wrap').hasClass('checked')) {
					$('.check-box-wrap').removeClass('checked');
				}
				$(this).toggleClass('checked');
				
				if($($('.check-box-wrap')[0]).hasClass('checked')) {
					$('#lg_signup').prop('checked',true);
					$('#sns_signup').prop('checked',false);
				} else {
					$('#sns_signup').prop('checked',true);
					$('#lg_signup').prop('checked',false);
				}
			});
			
			//다음 클릭 시 SNS, LG계정 페이지 선택 이동
			$('.button-basic').click(function() {
				if($("input[type='checkbox']:checked").val() == 1) {
					window.location.href = './signup_idle';
				} else {
					//sns 페이지 이동
				}
			})
		})
		
	</script>
	<!-- 스크립트 영역 -->


</body>
</html>