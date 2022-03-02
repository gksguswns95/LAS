<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
                <i class="fa fa-angle-left" aria-hidden="true" onclick="location.href='/prototype/account_del_check';"></i>
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
                        <h2 class="h-h2">LG전자 계정삭제</h2>
                    </div>
                    <p class="top-txt">
                        LG전자 계정을 삭제합니다.<br />
                        <br />
                        <a class="link-underline" href="javascript:;">${prototype_user_id }</a> 아이디의 본인 인증이 필요합니다.

                    </p>
                    <div class="input-area">
                        <fieldset class="field"><!-- [D] 클래스 error ]-->
                            <div class="label-switching" style="top: 0px; opacity: 1;">
                                <div class="innerWrap">
                                    <div class="tit">비밀번호</div>
                                    <div class="explain fontColor1">비밀번호를 입력하세요.</div>
                                </div>
                            </div>
                            <div class="input pw">
                                <input class="" id="pwAuth" name="pwAuth" type="password" placeholder="비밀번호를 입력하세요." >
                                <div class="btn-wrap">
                                    <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
                                </div>
                                <div class="icon-password"><i class="fa fa-eye" aria-hidden="true"></i><span class="line"></span></div>
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
                    <p class="text-info-box">
                        이 계정과 연동되어있는 SNS 계정이  연동해제를 위한 인증 페이지로 이동합니다.<br />
                        <br />
                        SNS 제공자의 연동헤제 안내에 따르십시오.<br />
                        <br />
                        진행과정에 LG계정 비밀번호가 아닌 해당 SNS계정의 비밀번호가 필요할 수 있습니다.

                    </p>
                </div>
            </div>
            <div class="btn-set mt20">
                <button class="button-basic" id="btn_next_accountDel">계정삭제 확인</button>
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
<script src="../js/LAS/delete/delete.js"></script>
<!-- 스크립트 영역 -->

</body>
</html>