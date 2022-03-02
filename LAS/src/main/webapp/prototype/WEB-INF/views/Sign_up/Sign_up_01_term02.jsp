<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>	
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
                <i class="fa fa-angle-left" aria-hidden="true" onclick="javascript:history.back(-1);"></i>
            </div>
            <jsp:include page="../common/header.jsp" />
        </div>
    </header>
    <!-- // header -->

    <!-- container -->
    <div id="container">
        <div id="contents">
            <!-- 컨텐츠 영역 -->
            <div class="area-clause full">
                <div class="innerWrap">
                    <h1>[필수]개인정보 수집 및 이용 동의</h1>
                    <p>이 약관은 LG전자 주식회사(이하 "회사") 가 제공하는 ""LG Account" 및 "LG Account 서비스"를 이용하는 "이용자"의 개인정보를 활용합니다.</p>
                    <h2>1. 개인정보 수집·이용(필수동의)</h2>
                    <p>1) 수집항목 : 성명, 생년월일, 성별, 내/외국인유무, 휴대폰번호, 통신사.<br />
						2) 수집·이용목적 : 서비스 이용에 따른 본인확인 및 가입자 식별, 홈페이지 회원서비스 제공을 위한 회원인증 및 확인.<br />
							3) 보유·이용기간 : 비회원일 경우 이용자가 서비스를 이용하는 기간에 한하여 보유 및 이용합니다. 회원일 경우 회원 가입일부터 회원탈퇴 후 분쟁해결을 위하여 6개월간 보유 및 이용하고 지체 없이 파기합니다. 단, 소송이나 분쟁 등 특정 사유가 있을 경우 이의 해결시점까지 이며, 관계법령에의 규정에 의하여 보존할 필요성이 있는 경우에는 관계 법령에 따라 보관합니다.</p>
                    <h2>2. 동의 거부권 및 미 동의에 대한 불이익 안내</h2>
                    <p>
                        고객님께서는 정보주체로서 개인정보 동의 거부권이 있으시며, 미동의 시 서비스 가입ㆍ이용에 제약이 있을 수 있고 미동의 하신 경우 정보가 제공되지 않습니다.
                    </p>
                </div>
            </div>
            <p class="gap"></p>
            <div class="btn-set">
                <button class="button-basic outline" onclick="javascript:history.back(-1);">돌아가기</button>
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