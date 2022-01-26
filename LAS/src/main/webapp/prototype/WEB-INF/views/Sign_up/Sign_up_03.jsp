<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<style>
			/*--content--*/
			.step-wrap .tit {font-size: 2.5rem; font-weight: 600; color:#333;}
			.step-wrap .step {width: 12rem; display: flex; justify-content: space-between; align-items: center;}
	        .step-wrap .step > li {background:#fff; color:#aaa; font-size: 1.2rem;width: 2rem; height: 2rem; text-align: center; border-radius: 50%; border:2px solid #aaa;}
			/*.step-wrap .step > li.active ~ li {background:#fff; color:#be417b;  border:2px solid #be417b;}*/
			.step-wrap .step > li.complete {background:#be417b; color:#fff;  border:2px solid #be417b;opacity: 0.6;}
			
			/*--common--*/
			#header {background:linear-gradient(135deg, #98222c, #cc0041);;box-sizing: border-box;}
	        .step-wrap{padding: 0rem 0 1.7rem;}
		</style>
	</head>
	
	<body>
	<!-- wrap-->
	<div id="wrap">
	    <!-- header -->
	    <header id="header">
	        <div class="inner-wrap">
	            <div class="arr">
	                <i class="fa fa-angle-left" aria-hidden="true" onclick="javascript:history.back();"></i>
	            </div>
	            <h1>LG 계정</h1>
	        </div>
	    </header>
	    <!-- // header -->
	
	    <!-- container -->
	    <div id="container">
	        <div id="contents">
	            <!-- 컨텐츠 영역 -->
	            <div class="step-wrap">
	                <p class="tit">LG계정 만들기</p>
	                <ul class="step">
	                    <li class="complete">1</li>
	                    <li class="active">2</li>
	                    <li>3</li>
	                    <li>4</li>
	                </ul>
	            </div>
	            <p class="top-txt">
	                계정으로 사용할 이메일주소,<br>
	                또는 핸드폰번호 중 한가지를 입력하세요
	            </p>
	            <div class="input-area">
	                <!-- 인풋박스 -->
	                <div class="field"><!-- [D] 클래스 error ]-->
	                    <div class="label-switching" style="top: 0px; opacity: 1;">
	                        <div class="innerWrap">
	                            <label class="tit">아이디</label>
	                            <div class="explain fontColor1">이메일 또는 휴대폰번호 입력하세요</div>
	                        </div>
	                    </div>
	                    <div class="input">
	                        <input class="" id="id" name="id" type="text" data-text="이메일 또는 휴대폰번호 입력하세요." placeholder="이메일 또는 휴대폰번호 입력하세요.">
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
	                            <label class="tit">비밀번호</label>
	                            <div class="explain fontColor1">
	                            <span class="fontColor1" id="upper">대문자</span>,<span class="fontColor1" id="lower">소문자</span>,<span class="fontColor1" id="number">숫자</span>,<span class="fontColor1" id="specialCharacter">기호</span> 포함 8자 이상 입력하세요</div>
	                        </div>
	                    </div>
	                    <div class="input pw">
	                        <input class="" id="pw" name="pw" type="password" data-text="대문자,숫자,기호 포함 8자 이상 입력하세요" placeholder="대문자,숫자,기호 포함 8자 이상 입력하세요">
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
	                            <label class="tit">비밀번호 확인</label>
	                            <div class="explain fontColor1">위와 동일한 비밀번호를 입력하세요</div>
	                        </div>
	                    </div>
	                    <div class="input pw">
	                        <input class="" id="pwcfm" name="pwcfm" type="password" data-text="위와 동일한 비밀번호를 입력하세요" placeholder="위와 동일한 비밀번호를 입력하세요">
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
	                            <label class="tit">이름</label>
	                            <div class="explain fontColor1">
	                                가입자의 본명을 입력하세요.<br>
	                                (*인증과 서비스 진행을 위해 본명이...)
	                            </div>
	                        </div>
	                    </div>
	                    <div class="input">
	                        <input class="" id="name" name="name" type="text" data-text="가입자의 본명을 입력하세요." placeholder="가입자의 본명을 입력하세요.">
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
	                            <label class="tit">생년월일</label>
	                            <div class="explain fontColor1">생년월일 8자리 입력하세요 (ex :20001123)</div>
	                        </div>
	                    </div>
	                    <div class="input">
	                        <input class="" id="birth" name="birth" type="text" data-text="생년월일 8자리 입력하세요 (ex :20001123)" placeholder="생년월일 8자리 입력하세요 (ex :20001123)">
	                        <div class="btn-wrap">
	                            <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
	                        </div>
	                    </div>
	                    <!-- [D] 오류 메세지 -->
	                    <p class="error-txt" id="birth-error-txt"></p>
	                    <!-- <p class="info-txt">Caption</p> -->
	                    <!-- // [D] 오류 메세지 -->
	                </div>
	            </div>
	            <div class="btn-set mt20">
	                <button class="button-basic" id="btn-next">동의</button>
	            </div>
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
	<script src="../js/LAS/sign_up_03.js"></script>
	<!-- 스크립트 영역 -->
		
	</body>
</html>