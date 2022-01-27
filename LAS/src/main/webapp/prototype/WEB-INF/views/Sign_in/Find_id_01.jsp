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
                <i class="fa fa-angle-left" aria-hidden="true"></i>
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
                    <div class="hdt">
                        <h2 class="h-h2">아이디 찾기</h2>
                    </div>
                    <p class="top-txt">
                        1개의 이메일 ID를 찾았습니다.
                    </p>
                    <p class="phone-num">LoremGipsum@email.com</p>
                    <p class="top-txt mt50">
                        1개의 휴대폰번호 ID를 찾았습니다.
                    </p>
                    <p class="phone-num">+82105**01**</p>
                    <div class="btn-set mt50">
                        <button class="button-basic" onclick="location.href='/prototype/signin_valid';">LG계정 바로가기</button>
                    </div>
                    <div class="notice-content mt50">
                        그래도 ID가 기억나지 않을 경우,
                        본인인증을 통해 ID찾기 및 비밀번호 재설정을  진행해 주세요.<br />
                        <a href="javascript:;" class="link-underline">본인인증</a><br />
                        <br />
                        새로운 계정으로 이용을 희망하시면,
                        <a href="javascript:location.href='/prototype/signup_select';" class="link-underline">계정생성</a>을 진행해 주세요.
                    </div>
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
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/swiper.min.js"></script>
<script src="../js/common_ui.js"></script>
<!-- 스크립트 영역 -->

</body>
</html>