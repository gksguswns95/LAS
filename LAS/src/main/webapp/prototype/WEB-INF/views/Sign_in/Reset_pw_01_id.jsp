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
                <i class="fa fa-angle-left" aria-hidden="true" onclick="javascript:location.href='/prototype/signin_valid';"></i>
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
                        <h2 class="h-h2">비밀번호 재설정</h2>
                    </div>
                    <p class="top-txt">
                        비밀번호를 재설정하려면<br />아래에 LG계정 아이디를 입력하세요.
                    </p>
                    <div class="input-area">
                        <fieldset class="field"><!-- [D] 클래스 error ]-->
                            <div class="label-switching only">
                                <div class="innerWrap">
                                    <label class="tit">아이디</label>
                                    <div class="explain fontColor1">
                                        가입자의 본명을 입력하세요.<br />(*차후 서비스이용시 경우에 따라<br />본인 명의의 인증이 요구될 수 있습니다)
                                    </div>
                                </div>
                            </div>
                            <div class="input">
                                <input class="" id="name04" type="text"  placeholder="가입자의 본명을 입력하세요." />
                                <div class="btn-wrap">
                                    <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
                                </div>
                            </div>
                            <div class="input-validation-box">
                                <div class="inner-warp">
                                    <!-- [D] 오류 메세지 -->
                                    <p class="error-txt">!형식에 맞지 않습니다.</p>
                                    <!-- <p class="info-txt">Caption</p> -->
                                    <!-- // [D] 오류 메세지 -->
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="btn-set mt20">
                <button class="button-basic">비밀번호 재설정</button>
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