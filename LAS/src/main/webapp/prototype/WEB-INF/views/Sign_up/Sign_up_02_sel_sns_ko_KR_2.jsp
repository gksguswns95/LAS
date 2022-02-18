<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <header class="popup-tit">
        <h1 class="i_g">Google 계정으로 로그인</h1>
        <!-- <h1 class="i_f">Facebook 계정으로 로그인</h1>
        <h1 class="i_n">Naver 계정으로 로그인</h1>
        <h1 class="i_k">Kakao Talk 계정으로 로그인</h1> -->
    </header>
    <!-- // header -->

    <!-- container -->
    <div id="container">
        <div id="contents">
            <!-- 컨텐츠 영역 -->
            <div class="vc-box">
                <div class="inner-wrap">
                    <div class="top-info-set">
                        <div class="top-icon">
                            <span></span>
                        </div>
                        <h1 class="t2">LG Account 에서 내 Google 계정에 액세스하려고 합니다.</h1>
                        <p class="notice-txt">이렿게 하면 LG Account에서 다음  작업을 할 수 있습니다.</p>
                        <div class="notice-content">
                            정확한 생년월일 확인 및 다운로드<br />
                            <b>LG Account 앱을 시뢰할 수 있는 지 확인</b>
                            민감한 정보가 이 사이트 또는 앱과 공유될 수 있습니다. 언제든지 <a href="javascript:;" class="accent-txt-blue">Google 계정</a>에서 액세스 권한을 확인하고 삭제할 수 있습니다.<br />
                            <br />
                            Google이 <a href="javascript:;" class="accent-txt-blue">데이터를 안전하게 공유</a>하는 방법을 알아보세요<br />
                            <br />
                            <b>LG Account의 개인정보처리방침 및 서비스 약관을 확인하세요.</b>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btn-set mt30">
                <button class="btn a" onclick="javascript:location.href='/prototype/signup_select';">취소</button>
                <button class="btn a blue" onclick="javascript:location.href='/prototype/main';">허용</button>
            </div>
            <!-- // 컨텐츠 영역 -->
        </div>
        <!-- // contents -->
    </div>
    <!-- container -->
</div>
<!-- wrap -->
<!-- 스크립트 영역 -->
<script src="../js/LAS/jquery-3.4.1.min.js"></script>
<script src="../js/LAS/swiper.min.js"></script>
<script src="../js/LAS/common_ui.js"></script>
<!-- 스크립트 영역 -->

</body>
</html>