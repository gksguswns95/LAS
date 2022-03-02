<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <title>LAS</title>
    <link rel="stylesheet" type="text/css" href="../css/LAS/swiper.css">
    <link rel="stylesheet" type="text/css" href="../css/LAS/common.css">
    <style type="text/css">
		.info-txt {	transition: all 0.3s ease}
		.btn-set .button-basic + .button-basic {margin: 0;}
    	.tit {text-align: center; }
    </style>
</head>

<body>
<!-- wrap-->
<div id="wrap">
    <!-- header -->    
    <header id="header">
        <div class="inner-wrap">
            <div class="arr">
                <i class="fa fa-angle-left" aria-hidden="true" onclick="javascript:location.href='/prototype/reset_pw_id';"></i>
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
                    <div class="hdt">
                        <h2 class="h-h2">비밀번호 재설정-SMS인증</h2>
                    </div>
                    <p class="top-txt">아래 이메일 및 전화번호로 전송된 인증번호를 입력하세요.</p>
                    <div class="input-area">
                        <!-- 인풋박스 -->
                        <fieldset class="field"><!-- [D] 클래스 error ]-->
                            <div class="label-switching">
                                <div class="innerWrap">
                                    <div class="tit" id="id">${find_pw_id }</div>
                                    <div class="explain fontColor1">이메일 또는 휴대폰번호 입력하세요</div>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="input-area">
                        <!-- 인풋박스 -->
                        <fieldset class="field"><!-- [D] 클래스 error ]-->
                            <div class="label-switching only">
                                <div class="innerWrap">
                                    <div class="tit">인증번호</div>
                                </div>
                            </div>
                            <div class="input space3">
                                <input class="" id="numbver" type="text"  placeholder="인증번호 8자리를 입력하세요."/>
                                <div class="btn-wrap">
                                    <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
                                    <span class="timer">05:00</span>
                                </div>
                            </div>
                            <div class="input-validation-box">
                                <div class="inner-warp">
                                    <!-- [D] 오류 메세지 -->
                                    <p class="error-txt">! 인증번호가 유효하지 않습니다.<br />다시 한번 확인하시고 입력해주세요.</p>
                                    <!-- <p class="info-txt">Caption</p> -->
                                    <!-- // [D] 오류 메세지 -->
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="btn-set mt45">
                        <button class="button-basic outline" id="btn-auth-extension">입력시간 연장하기</button>
                    </div>
                    <div class="btn-set">
						<button class="button-basic outline" id="btn-auth-resend">인증번호 재전송</button>
						<button class="button-basic g" id="btn-auth-alert" onclick="javascript:$('.alert-wrap').addClass('active')">인증번호 재전송</button>
						<div class="alert-wrap">
							<div class="inner-wrap">
								<button class="button-close"
									onclick="javascript:$(this).parents('.alert-wrap').removeClass('active');">close</button>
								<div class="icon">
									<span></span>
									<div class="wrap">
										<i class="fa fa-exclamation" aria-hidden="true"></i>
									</div>
								</div>
								<h2>이메일 재전송 안내</h2>
								<div class="txt">
									<span class="timer_resend">30</span>초 후 다시 시도해 주세요.<br /> [오류코드: 0071]
								</div>
								<button class='button-alerrt' id="btn-auth-alert" onclick="javascript:$(this).parents('.alert-wrap').removeClass('active')">확인</button>
							</div>
						</div>
					</div>
					<p class="info-txt mt30">
						인증번호가 재전송 되었습니다<br /> <br /> 다시 재전송 요청이 가능해질떄까지 일정 시간이 필요하오니
						기다려주세요
					</p>
                </div>
            </div>
            <p class="gap"></p>
            <div class="btn-set">
                <!-- <button class="button-basic">뒤로</button> -->
                <button class="button-basic" id="btn-authKeyCheck" disabled="">다음</button>
            </div>
            <!-- // 컨텐츠 영역 -->
        </div>
        <!-- // contents -->
        
    </div>
    <!-- container -->
    <jsp:include page="../common/footer.jsp"></jsp:include>

</div>
	<!-- wrap -->
	<!-- 스크립트 영역 -->
	<script src="../js/LAS/jquery-3.4.1.min.js"></script>
	<script src="../js/LAS/swiper.min.js"></script>
	<script src="../js/LAS/common_ui.js"></script>
	<script src="../js/LAS/signin/reset_pw_pin.js"></script>
	<!-- 스크립트 영역 -->
		
	</body>
</html>