<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <title>LAS</title>
    <link rel="stylesheet" type="text/css" href="../css/LAS/swiper.css">
    <link rel="stylesheet" type="text/css" href="../css/LAS/common.css">
    <style type="text/css">
    	.field .input-box-wrap {transition: all 0.3s ease;}
    </style>
</head>

<body>
<!-- wrap-->
<div id="wrap">
    <!-- header -->    
    <header id="header">
        <div class="inner-wrap">
            <div class="arr">
                <i class="fa fa-angle-left" aria-hidden="true" onclick="javascript:location.href='/prototype/main'"></i>
            </div>
            <jsp:include page="../common/header.jsp" />
        </div>
    </header>
    <!-- // header -->

    <!-- container -->
    <div id="container">
        <div id="contents">
            <!-- 컨텐츠 영역 -->
            <div class="input-area">
                <!-- 인풋박스 -->
                <fieldset class="field"><!-- [D] 클래스 error ]-->
                    <div class="label-switching only">
                        <div class="innerWrap">
                            <div class="tit"><spring:message code="id" text="아이디" /></div>
                            <div class="explain fontColor1">이메일 또는 휴대폰번호 입력하세요</div>
                        </div>
                    </div>
                    <div class="input id">
                    	<c:if test=""></c:if>
                        <input class="" id="id" name="id" type="text"  placeholder="<spring:message code="idInputPlaceholer" text="이메일 또는 핸드폰번호를 입력해주세요." />" required value=""/>
                        <div class="btn-wrap">
                            <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
                        </div>
                    </div>
                    <div class="input-validation-box">
                        <div class="inner-warp">
                            <!-- [D] 오류 메세지 -->
                            <p class="error-txt"><spring:message code="idInput-Error" text="!이메일 또는 전화번호를 입력해주세요." /></p>
                            <!-- <p class="info-txt">Caption</p> -->
                            <!-- // [D] 오류 메세지 -->
                        </div>
                    </div>
                    <fieldset>
                        <label class="input-box-label fill small"><spring:message code="staySignedIn" text="아이디 기억하기" />
                            <input type="checkbox" id="rememberId">
                        </label>
                    </fieldset>
                </fieldset>
            </div>
            <div class="input-area">
                <fieldset class="field"><!-- [D] 클래스 error ]-->
                    <div class="label-switching only">
                        <div class="innerWrap">
                            <div class="tit"><spring:message code="password" text="비밀번호" /></div>
                            <div class="explain fontColor1"><spring:message code="password" text="비밀번호" /></div>
                        </div>
                    </div>
                    <div class="input pw">
                        <input class="" id="pw" name="pw" type="password"  placeholder="<spring:message code="passwordInputPlaceholer" text="대문자,소문자,숫자,기호 포함 8자 이상 입력하세요." />" required/>
                        <div class="btn-wrap">
                            <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
                        </div>
                        <div class="icon-password"><i class="fa fa-eye" aria-hidden="true"></i><span class="line"></span></div>
                    </div>
                    <div class="input-validation-box">
                        <div class="inner-warp">
                            <!-- [D] 오류 메세지 -->
                            <p class="error-txt"><spring:message code="signin-Error" text="!아이디 또는 비밀번호가 틀립니다." /></p>
                            <!-- <p class="info-txt">Caption</p> -->
                            <!-- // [D] 오류 메세지 -->
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="btn-set mt20">
                <button class="button-basic" id="btn-signin"><spring:message code="signin" text="로그인" /></button>
            </div>
            <div class="bothSet01">
                <div class="set-list">
                    <ul>
                        <li><a href="javascript:location.href='/prototype/find_id';"><spring:message code="forgotId" text="아이디를 찾아볼께요." /><i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
                        <li><a href="javascript:location.href='/prototype/reset_pw_id';"><spring:message code="forgotPassword" text="비밀번호를 재설정할께요." /><i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
                        <li><a href="javascript:location.href='/prototype/signup_select';"><spring:message code="lgAccountSignup" text="LG계정을 만들께요." /><i class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
                <p class="gap"></p>
                <div class="sns-list">
                    <ul>
                        <li class="g"><a href="javascript:;"><spring:message code="snsSignin_google" text="Google 계정으로 로그인" /></a></li>
                        <li class="f"><a href="javascript:;"><spring:message code="snsSignin_facebook" text="Facebook 계정으로 로그인" /></a></li>
                        <li class="n"><a href="javascript:;"><spring:message code="snsSignin_naver" text="Naver 계정으로 로그인" /></a></li>
                        <li class="k"><a href="javascript:;"><spring:message code="snsSignin_kakao" text="Kakao 계정으로 로그인" /></a></li>
                    </ul>
                </div>
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
	<script src="../js/LAS/signin_valid.js"></script>
	<!-- 스크립트 영역 -->


</body></html>