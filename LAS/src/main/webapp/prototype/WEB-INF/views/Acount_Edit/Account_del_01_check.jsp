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
                <i class="fa fa-angle-left" aria-hidden="true" onclick="location.href='/prototype/account_view_profile';"></i>
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
                        현재 로그인되어있는  <a class="link-underline" href="javascript:;">${prototype_user_id }</a> 아이디의  LG전자 계정을 삭제하길 원하십니까?<br /><br />계정을 삭제하려는 사유를 선택해주세요.
                    </p>
                    <form action="/prototype/account_reasonProcess" method="post" id="form-reason">
                    <div class="input-box-set">
                        <fieldset>
                            <label class="input-box-label small fill">중복된 다른 계정이 있어요<input type="checkbox" name="del-reason" id="del-reason" value="1"></label>
                        </fieldset>
                        <fieldset>
                            <label class="input-box-label small fill">원하는 서비스가 없어요<input type="checkbox"></label>
                        </fieldset>
                        <fieldset>
                            <label class="input-box-label small fill">서비스 이용이 불편해요<input type="checkbox"></label>
                        </fieldset>
                        <fieldset>
                            <label class="input-box-label small fill">사용빈도가 낮아요<input type="checkbox"></label>
                        </fieldset>
                        <fieldset>
                            <label class="input-box-label small fill">개인정보가 걱정되어요<input type="checkbox"></label>
                        </fieldset>
                    </div>
                    </form>
                    <p class="gap"></p>
                    <p class="text-info-box">
                        <span class="txt-red">*중요한 내용이므로 주의깊게 읽어주세요.</span><br />
                        <br />
                        다양한 LG전자 서비스에 엑세스 할수 있는  LG계정을 삭제하려고 합니다. 더 이상 LG  서비스를 이용할수 없으며 계정과 데이터가  삭제 됩니다.<br />
                        <br />
                        미결된 계약과 거래가 있는 경우, 이로 인해  발생한 청구 금액에 대한 책임은 귀하에게  있습니다.<br />
                        <br />
                    </p>
                    
                    <div class="input-box-set">
                        <fieldset>
                            <label class="input-box-label fill wrap">본인은 모든 미결 계약과 거래로 인해  발생하는 청구금액에 대해 전적으로  책임이 있음을 인지하며,  멤버십포인트 및 쿠폰을 지급받을 수  없다는 사실을 이해합니다.<input type="checkbox"></label>
                        </fieldset>
                        <fieldset>
                            <label class="input-box-label fill wrap">이 LG계정과 모든 데이터를 완전히  삭제함을 확인합니다.<input type="checkbox"></label>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="btn-set mt20">
                <button class="button-basic outline" onclick="location.href='/prototype/account_view_profile'">취소</button>
                <button class="button-basic" id="btn_next_pwinput" disabled>계정삭제</button>
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