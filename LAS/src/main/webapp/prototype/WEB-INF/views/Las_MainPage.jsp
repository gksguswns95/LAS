<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
	    <title>LAS</title>
	    <link rel="stylesheet" type="text/css" href="../css/LAS/swiper.css">
	    <link rel="stylesheet" type="text/css" href="../css/LAS/common.css">
		<style>
			.head {display:flex; align-items:center; justify-content:center; height:25rem; font-size:2.6rem; color:#fff; font-weight:bold; line-height:3.0rem;background:linear-gradient(135deg, #98222c, #cc0041);}
			.head > div {width:100%; max-width:68rem; padding:0 5.5rem;}
			.head .big {font-size:4.0rem;line-height: 1.8;}
			/*.button-basic.on{background:#ce1461;}*/
			.button-basic.on{background:#222;}
			.button-basic.outline {border:2px solid #222; color:#222;}
			.login-box .con .innerWrap > button{width:30rem;}
			.link-icon-arr {line-height: 1; justify-content:space-evenly;font-size: 1.6rem;color:#333;}
			.login-box .con .innerWrap > button{width:30rem;}
			a:hover{text-decoration:none;}
		</style> 
	</head>
	
	<body>
	<!-- wrap-->
	<div id="wrap">
		<div class="head">
	            <div>
	                <span class="big">Welcome,</span><br>
	                LG 계정을 사용하여<br>
	                다양한 LG 전자 서비스를 경험하세요.
	            </div>
	    </div>
	     <div class="login-box">
	            
	        <dic class="con" style="min-height: calc(490px);">
	            <div class="innerWrap">
	                <button class="button-basic on" onclick="next_signin();">로그인</button>
	                <button class="button-basic outline" onclick="next_signup();">계정만들기</button>
	                <a class="link-icon-arr" href="javascript:;">Korea / 한국어<i class="fa fa-angle-right" aria-hidden="true"></i></a>
	            </div>
	        </dic>
	    </div>
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
	<!-- 스크립트 영역 -->
	<script type="text/javascript">
		function next_signin()  {
			window.location.href = './signin_valid';
		}
		function next_signup()  {
			window.location.href = './signup_select';
		}
	</script>
		
	</body>
</html>