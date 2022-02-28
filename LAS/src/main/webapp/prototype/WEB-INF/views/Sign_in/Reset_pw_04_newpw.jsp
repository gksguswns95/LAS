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
                <i class="fa fa-angle-left" aria-hidden="true" onclick="javascript:location.href='/prototype/reset_pw_id';"></i>
            </div>
            <h1 onclick="javascript:location.href='/prototype/main';">LG 계정</h1>
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
                        신규 비밀번호를 입력해주세요.
                    </p>
                    <form action="/prototype/reset_pwProcess" method="post" id="form-resetPW">
                    <div class="input-area">
                        <div class="field"><!-- [D] 클래스 error ]-->
	                    <div class="label-switching" style="top: 0px; opacity: 1;">
	                        <div class="innerWrap">
	                            <label class="tit">신규 비밀번호</label>
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
                    </div>
                    <div class="input-area">
                        <div class="field"><!-- [D] 클래스 error ]-->
	                    <div class="label-switching" style="top: 0px; opacity: 1;">
	                        <div class="innerWrap">
	                            <label class="tit">신규 비밀번호 확인</label>
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
                    </div>
                    </form>
                </div>
            </div>
            <div class="btn-set mt20">
                <button class="button-basic" id="btn_next_comp">비밀번호 재설정 완료</button>
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