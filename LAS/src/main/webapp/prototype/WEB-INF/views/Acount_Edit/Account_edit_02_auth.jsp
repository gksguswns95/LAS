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
                <i class="fa fa-angle-left" aria-hidden="true" onclick="javascript:location.href='/prototype/account_view_profile';"></i>
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
                        <h2 class="h-h2">회원정보 수정</h2>
                    </div>
                    <p class="top-txt">
                        회원정보를 수정하시려면 <br/>
                        개인정보 보호를 위한 본인확인절차로 <br />
                        비밀번호를 입력하셔야 합니다.
                    </p>
                    <div class="input-area">
                        <div class="field"><!-- [D] 클래스 error ]-->
	                    <div class="label-switching only" style="top: 0px; opacity: 1;">
	                        <div class="innerWrap">
	                            <label class="tit">비밀번호</label>
	                            <div class="explain fontColor1">
	                            <span class="fontColor1" id="upper">대문자</span>,<span class="fontColor1" id="lower">소문자</span>,<span class="fontColor1" id="number">숫자</span>,<span class="fontColor1" id="specialCharacter">기호</span> 포함 8자 이상 입력하세요</div>
	                        </div>
	                    </div>
	                    <div class="input pw">
	                        <input class="" id="pwAuth" name="pwAuth" type="password" data-text="비밀번호를 입력하세요." placeholder="비밀번호를 입력하세요.">
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
                </div>
            </div>
            <div class="btn-set mt20">
                <button class="button-basic" id="btn_next_editfrom">비밀번호 확인</button>
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
<script src="../js/LAS/modify/modify.js"></script>
<!-- 스크립트 영역 -->

</body>
</html>