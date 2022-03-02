<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
            <jsp:include page="../common/header.jsp" />
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
                    	<spring:message code="signupSentence1" text="<b>안녕하세요!</b><br />이메일주소, 또는 핸드폰번호로<br />계정을 쉽고 빠르게 생성하세요.<br />" />
                    	<spring:message code="signupSentence2" text="또는 SNS 계정인증으로 간편하게<br />LG전자 서비스를 이용할 수 있습니다." />
                    </p>
                    <div class="cb-type-select-box">
                        <fieldset>
                            <label  class="input-box-label txt-size-small"><spring:message code="signup-lg" text="이메일주소, 또는 핸드폰번호로 계정을 만들겠습니다." /><input type="radio" name="radio1" value="lg_signup" id="lg_signup"></label>
                        </fieldset>
                        <fieldset>
                            <label  class="input-box-label txt-size-small"><spring:message code="signup-sns" text="자주 쓰는 SNS계정인증으로 계정을 만들겠습니다." /><input type="radio" name="radio1" value="sns_signup" id="sns_signup"></label>
                        </fieldset>
                    </div>
                    <div class="btn-set">
                        <button class="button-basic"><spring:message code="next" text="다음" /></button>
                    </div>
                </div>
            </div>
            <a href="/prototype/find_id" class="both-txt-footerTop">
                <spring:message code="forgotAccount" text="혹시, 잊고있던 LG계정이 있지 않을까요?  사용하던 계정을 찾아보시는 것은 어떨까요?" />
            </a>
            <!-- // 컨텐츠 영역 -->
        </div>
        <!-- // contents -->
    </div>
    <!-- container -->
    <!-- footer -->
    <jsp:include page="../common/footer.jsp"></jsp:include>
    <!-- // footer -->
</div>
	<!-- wrap -->
	<!-- 스크립트 영역 -->
	<script src="../js/LAS/jquery-3.4.1.min.js"></script>
	<script src="../js/LAS/swiper.min.js"></script>
	<script src="../js/LAS/common_ui.js"></script>
	<script>
		$(function() {
			$('.input-box-wrap:eq(0)').trigger('click');

			//다음 클릭 시 SNS, LG계정 페이지 선택 이동
			$('.button-basic').click(function() {
				console.log($($('.input-box-wrap')[0]).hasClass('checked'))
				if($($('.input-box-wrap')[0]).hasClass('checked')) {
					location.href = './signup_idle';
				} else {
					//sns 페이지 이동
					location.href = './signup_sns';
				}
			})
		})
		
	</script>
	<!-- 스크립트 영역 -->


</body>
</html>