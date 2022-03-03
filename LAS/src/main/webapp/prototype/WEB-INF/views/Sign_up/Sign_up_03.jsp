<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	                <i class="fa fa-angle-left" aria-hidden="true" onclick="javascript:location.href='/prototype/signup_inputpin';"></i>
	            </div>
	            <jsp:include page="../common/header.jsp" />
	        </div>
	    </header>
	    <!-- // header -->
	
	    <!-- container -->
	    <div id="container">
	        <div id="contents">
	            <!-- 컨텐츠 영역 -->
            <div class="step-wrap">
                <p class="tit"><spring:message code="signup-title" text="LG계정 만들기" /></p>
                <ul class="step">
                    <li>1</li>
                    <li>2</li>
                    <li class="active">3</li>
                    <li>4</li>
                </ul>
            </div>
            <p class="top-txt">
            <spring:message code="signup-account-title" text="계정으로 사용할 이메일주소,<br /> 또는 핸드폰번호 중 한가지를 입력하세요." />
            </p>
	            <div class="input-area">
	            	<form action="/prototype/identity_verification" method="post" id="identity_verification">
	                <!-- 인풋박스 -->
	                <div class="field"><!-- [D] 클래스 error ]-->
	                    <div class="label-switching" style="top: 0px; opacity: 1;">
	                        <div class="innerWrap">
	                            <label class="tit"><spring:message code="id" text="아이디" /></label>
	                            <div class="explain fontColor1"><spring:message code="idInputPlaceholer" text="이메일 또는 휴대폰번호 입력하세요." />이메일 또는 휴대폰번호 입력하세요</div>
	                        </div>
	                    </div>
	                    <div class="input">
	                        <%-- <input class="" id="id" name="id" type="text" data-text="이메일 또는 휴대폰번호 입력하세요." placeholder="이메일 또는 휴대폰번호 입력하세요." value="${param.id }" disabled> --%>
	                        <input class="" id="id" name="id" type="text" value="${prototype_user_signupId }" readonly>
	                        <div class="btn-wrap">
	                            <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
	                        </div>
	                    </div>
	                    <!-- [D] 오류 메세지 -->
	                    <p class="error-txt" id="id-error-txt"></p>
	                    <!-- <p class="info-txt">Caption</p> -->
	                    <!-- // [D] 오류 메세지 -->
	                </div>
	                <div class="field"><!-- [D] 클래스 error ]-->
	                    <div class="label-switching" style="top: 0px; opacity: 1;">
	                        <div class="innerWrap">
	                            <label class="tit"><spring:message code="password" text="비밀번호" /></label>
	                            <div class="explain fontColor1">
	                           		<spring:message code="passwordExplain" text="대문자,소문자,숫자,기호 포함 8자 이상 입력하세요." />
	                            </div>
	                        </div>
	                    </div>
	                    <div class="input pw">
	                        <input class="" id="pw" name="pw" type="password" data-text="<spring:message code="passwordInputPlaceholer" text="대문자,소문자,숫자,기호 포함 8자 이상 입력하세요." />" placeholder="<spring:message code="passwordInputPlaceholer" text="대문자,소문자,숫자,기호 포함 8자 이상 입력하세요." />">
	                        <div class="btn-wrap">
	                            <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
	                        </div>
	                        <div class="icon-password"><i class="fa fa-eye" aria-hidden="true"></i><span class="line"></span></div>
	                    </div>
	                    <!-- [D] 오류 메세지 -->
	                    <p class="error-txt" id="pw-error-txt"></p>
	                    <!-- <p class="info-txt">Caption</p> -->
	                    <!-- // [D] 오류 메세지 -->
	                </div>
	                <div class="field"><!-- [D] 클래스 error ]-->
	                    <div class="label-switching" style="top: 0px; opacity: 1;">
	                        <div class="innerWrap">
	                            <label class="tit"><spring:message code="passwordConfirm" text="비밀번호 확인" /></label>
	                            <div class="explain fontColor1"><spring:message code="passwordComfirmInputPlaceholer" text="위와 동일한 비밀번호를 입력하세요." /></div>
	                        </div>
	                    </div>
	                    <div class="input pw">
	                        <input class="" id="pwcfm" name="pwcfm" type="password" data-text="<spring:message code="passwordComfirmInputPlaceholer" text="위와 동일한 비밀번호를 입력하세요." />" placeholder="<spring:message code="passwordComfirmInputPlaceholer" text="위와 동일한 비밀번호를 입력하세요." />">
	                        <div class="btn-wrap">
	                            <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
	                        </div>
	                        <div class="icon-password"><i class="fa fa-eye" aria-hidden="true"></i><span class="line"></span></div>
	                    </div>
	                    <!-- [D] 오류 메세지 -->
	                    <p class="error-txt" id="pwcfm-error-txt"></p>
	                    <!-- <p class="info-txt">Caption</p> -->
	                    <!-- // [D] 오류 메세지 -->
	                </div>
	                <div class="field"><!-- [D] 클래스 error ]-->
	                    <div class="label-switching l2" style="top: 0px; opacity: 1;">
	                        <div class="innerWrap">
	                            <label class="tit"><spring:message code="name" text="이름" /></label>
	                            <div class="explain fontColor1">
	                                <spring:message code="nameInputPlaceholer" text="가입자의 본명을 입력하세요." /><br>
	                                (*인증과 서비스 진행을 위해 본명이...)
	                            </div>
	                        </div>
	                    </div>
	                    <div class="input">
	                        <input class="" id="name" name="name" type="text" data-text="<spring:message code="nameInputPlaceholer" text="가입자의 본명을 입력하세요." />" placeholder="<spring:message code="nameInputPlaceholer" text="가입자의 본명을 입력하세요." />">
	                        <div class="btn-wrap">
	                            <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
	                        </div>
	                    </div>
	                    <!-- [D] 오류 메세지 -->
	                    <p class="error-txt" id="name-error-txt"></p>
	                    <!-- <p class="info-txt">Caption</p> -->
	                    <!-- // [D] 오류 메세지 -->
	                </div>
	                <div class="field"><!-- [D] 클래스 error ]-->
	                    <div class="label-switching" style="top: 0px; opacity: 1;">
	                        <div class="innerWrap">
	                            <label class="tit"><spring:message code="birth" text="생년월일" /></label>
	                            <div class="explain fontColor1"><spring:message code="birthInputPlaceholer" text="생년월일 8자리 입력하세요." /> (ex :20001123)</div>
	                        </div>
	                    </div>
	                    <div class="input">
	                        <input class="" id="birth" name="birth" type="text" data-text="<spring:message code="birthInputPlaceholer" text="생년월일 8자리 입력하세요." /> (ex :20001123)" placeholder="<spring:message code="birthInputPlaceholer" text="생년월일 8자리 입력하세요." /> (ex :20001123)">
	                        <div class="btn-wrap">
	                            <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
	                        </div>
	                    </div>
	                    <!-- [D] 오류 메세지 -->
	                    <p class="error-txt" id="birth-error-txt"></p>
	                    <!-- <p class="info-txt">Caption</p> -->
	                    <!-- // [D] 오류 메세지 -->
	                </div>
	                <div class="field"><!-- [D] 클래스 error ]-->
	                    <div class="label-switching" style="top: 0px; opacity: 1;">
	                        <div class="innerWrap">
	                            <label class="tit"><spring:message code="email" text="이메일" /></label>
	                            <div class="explain fontColor1"><spring:message code="emailInputPlaceholer" text="이메일을 입력해주세요." /> (ex :test@test.com)</div>
	                        </div>
	                    </div>
	                    <div class="input">
	                        <input class="" id="email" name="email" type="text" data-text="<spring:message code="emailInputPlaceholer" text="이메일을 입력해주세요." /> (ex :test@test.com)" placeholder="<spring:message code="emailInputPlaceholer" text="이메일을 입력해주세요." /> (ex :test@test.com)" <c:if test="${prototype_user_signupType eq 'email' }">value="${prototype_user_signupId }" readonly</c:if>>
	                        <div class="btn-wrap">
	                            <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
	                        </div>
	                    </div>
	                    <!-- [D] 오류 메세지 -->
	                    <p class="error-txt" id="email-error-txt"></p>
	                    <!-- <p class="info-txt">Caption</p> -->
	                    <!-- // [D] 오류 메세지 -->
	                </div>
	                <div class="field"><!-- [D] 클래스 error ]-->
	                    <div class="label-switching" style="top: 0px; opacity: 1;">
	                        <div class="innerWrap">
	                            <label class="tit"><spring:message code="phoneNumber" text="핸드폰 번호" /></label>
	                            <div class="explain fontColor1"><spring:message code="phoneInputPlaceholer" text="핸드폰번호 11자리를 입력하세요." /> (ex :01012345678)</div>
	                        </div>
	                    </div>
	                    <div class="input">
	                        <input class="" id="phone" name="phone" type="text" data-text="<spring:message code="phoneInputPlaceholer" text="핸드폰번호 11자리를 입력하세요." /> (ex :01012345678)" placeholder="<spring:message code="phoneInputPlaceholer" text="핸드폰번호 11자리를 입력하세요." /> (ex :01012345678)" <c:if test="${prototype_user_signupType eq 'phone' }">value="${prototype_user_signupId }" readonly</c:if>>
	                        <input class="" id="agree" name="agree" type="hidden" value="${param.agree }">
	                        <input class="" id="signup_type" name="signup_type" type="hidden" value="${prototype_user_signupType }">
	                        <div class="btn-wrap">
	                            <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
	                        </div>
	                    </div>
	                    <!-- [D] 오류 메세지 -->
	                    <p class="error-txt" id="phone-error-txt"></p>
	                    <!-- <p class="info-txt">Caption</p> -->
	                    <!-- // [D] 오류 메세지 -->
	                </div>
	                </form>
	            </div>
	            <div class="btn-set mt20">
	                <button class="button-basic" id="btn-next"><spring:message code="next" text="다음" /></button>
	            </div>
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
	<script src="../js/LAS/sign_up_03.js"></script>
	<!-- 스크립트 영역 -->
		
	</body>
</html>