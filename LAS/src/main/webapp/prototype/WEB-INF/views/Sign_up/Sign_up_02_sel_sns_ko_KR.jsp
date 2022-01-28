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
                <i class="fa fa-angle-left" aria-hidden="true" onclick="javascript:location.href='/prototype/signup_select';"></i>
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
                    <li>1</li>
                    <li class="active">2</li>
                    <li>3</li>
                    <li>4</li>
                </ul>
            </div>
            <p class="top-txt">계정인증을 진행할 SNS를 선택하세요.</p>
            <div class="vc-box vc">
                <div class="inner-wrap">
                    <div class="bothSet01">
                        <div class="sns-list">
                            <ul>
                                <li class="g"><a href="javascript:location.href='/prototype/signup_sns_1';">Google 계정으로 로그인</a></li>
                                <li class="f"><a href="javascript:;">facebook 계정으로 로그인</a></li>
                                <li class="n"><a href="javascript:;">Naver 계정으로 로그인</a></li>
                                <li class="k"><a href="javascript:;">Kakao 계정으로 로그인</a></li>
                            </ul>
                        </div>
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
<script src="../js/LAS/jquery-3.4.1.min.js"></script>
<script src="../js/LAS/swiper.min.js"></script>
<script src="../js/LAS/common_ui.js"></script>
<!-- 스크립트 영역 -->

</body>
</html>