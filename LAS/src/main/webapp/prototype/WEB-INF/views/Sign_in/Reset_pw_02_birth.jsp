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
                <i class="fa fa-angle-left" aria-hidden="true" onclick="javascript:location.href='/prototype/reset_pw_id';"></i>
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
                        <h2 class="h-h2">비밀번호 재설정-본인인증</h2>
                    </div>
                    <p class="top-txt">
                        이 계정의 본인인증을 위해 아래 정보를 입력하세요.
                    </p>
                    <form action="/prototype/findIdProcess" method="post" id="form-findId">
                    <div class="input-area">
                        <fieldset class="field"><!-- [D] 클래스 error ]-->
                            <div class="label-switching">
                                <div class="innerWrap">
                                    <label class="tit">이름</label>
                                    <div class="explain fontColor1">
                                        가입자의 본명을 입력하세요.<!-- <br />(*차후 서비스이용시 경우에 따라<br />본인 명의의 인증이 요구될 수 있습니다) -->
                                    </div>
                                </div>
                            </div>
                            <div class="input">
                                <input class="" id="name" name="name" type="text"  placeholder="가입자의 본명을 입력하세요." />
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
                    <div class="input-area">
                        <fieldset class="field"><!-- [D] 클래스 error ]-->
                            <div class="label-switching">
                                <div class="innerWrap">
                                    <label class="tit">생년월일</label>
                                    <div class="explain fontColor1">
                                        가입자의 생년월일을 입력하세요.<!-- <br />(*차후 서비스이용시 경우에 따라<br />본인 명의의 인증이 요구될 수 있습니다) -->
                                    </div>
                                </div>
                            </div>
                            <div class="input">
                                <input class="" id="birth" name="birth" type="text"  placeholder="가입자의 생년월일을 입력하세요. ex)19960203" />
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
                    <div class="input-area">
                        <fieldset class="field"><!-- [D] 클래스 error ]-->
                            <div class="input-validation-box">
                                <div class="inner-warp">
                                    <!-- [D] 오류 메세지 -->
                                    <p class="error-txt">! 아이디와 일치하는 본인정보가 없습니다.</p>
                                    <!-- <p class="info-txt">Caption</p> -->
                                    <!-- // [D] 오류 메세지 -->
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    </form>
                </div>
            </div>
            <div class="btn-set mt20">
                <button class="button-basic" id="btn_next_pin">비밀번호 재설정</button>
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
<script src="../js/LAS/signin/reset_pw_id.js"></script>
<!-- 스크립트 영역 -->

</body>
</html>