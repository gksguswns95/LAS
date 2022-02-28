<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <h2 class="h-h2">아이디 찾기</h2>
                    </div>
                    <p class="top-txt">
                        아이디를 찾고 싶으면<br />아래에 이름과 생년월일을 입려해주세요.
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
                                        가입자의 생년월일을 입력하세요.<br />(*차후 서비스이용시 경우에 따라<br />본인 명의의 인증이 요구될 수 있습니다)
                                    </div>
                                </div>
                            </div>
                            <div class="input">
                                <input class="" id="birth" name="birth" type="text"  placeholder="가입자의 생년월일을 입력하세요." />
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
                    </form>
                </div>
            </div>
            <div class="btn-set mt20">
                <button class="button-basic" id="btn_next">아이디 찾기</button>
            </div>
            <c:if test="${param.error eq 'inconsistency' }">
            	<div class="alert-wrap active">
					<div class="inner-wrap">
						<button class="button-close"
							onclick="javascript:$(this).parents('.alert-wrap').removeClass('active');">close</button>
						<div class="icon">
							<span></span>
							<div class="wrap">
								<i class="fa fa-exclamation" aria-hidden="true"></i>
							</div>
						</div>
						<h2>아이디 찾기 안내</h2>
						<div class="txt">
							입력하신 정보와 일치하는 아이디가 없습니다.<br /> [오류코드: 0041]
						</div>
						<button class='button-alerrt' id="btn-auth-alert" onclick="javascript:$(this).parents('.alert-wrap').removeClass('active')">확인</button>
					</div>
				</div>
            </c:if>
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

<script type="text/javascript">
$(function() {
	$('.button-basic').click(function() {
		reg_number = /[^0-9]/g;
		if($('#name').val().length < 2) {
			$('.field input')[0].error();
		} else if($('#birth').val().length != 8 || reg_number.test($('#birth').val()) ) {
			$('.field input')[1].error();
		} else {
			$('#form-findId').submit();			
		}
		
	});
});
</script>
<!-- 스크립트 영역 -->

</body>
</html>