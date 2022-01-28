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
                        <h1>로그인</h1>
                        <div class="link">
                            <a href="javascript:;">LG Account(으)로 이동</a>
                        </div>
                    </div>
                    <fieldset class="input-box-line">
                        <label for="">이메일 또는 휴대전화</label>
                        <input type="text">
                        <div class="btn-wrap">
                            <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
                        </div>
                    </fieldset>
                    <a href="javascript:;" class="line-lost-things" >이메일을 잊으셨나요?</a>
                    <p class="text-info-box">
                        계속 진행하기 위해 Google에서 내 이름, 이메일 주소, 언어 환경설정, 프로필사진을
                        LG Account와 공유합니다.<br />
                        앱을 사용하기 전에 LG Account의 개인정보처리방침 및 서비스약관을 검토하세요.
                    </p>
                </div>
            </div>
            <div class="btn-set mt30">
                <button class="btn a" >계정 만들기</button>
                <button class="btn a fill" onclick="javascript:location.href='/prototype/signup_sns_2';">다음</button>
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