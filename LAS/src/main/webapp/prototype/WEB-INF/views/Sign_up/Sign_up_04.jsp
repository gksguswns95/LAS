<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                    <div class="complete-txt">
                        ${prototype_user_name } 님,  환영합니다.
                    </div>

                    <div class="user-picture">
                        <span>${prototype_user_firstName }</span>
                    </div>
                    <p class="phone-num"><i class="sns google"></i>${prototype_user_id }</p>
                    <!-- sns icon -->
                    <!-- <i class="sns facebook"></i>
                    <i class="sns google"></i>
                    <i class="sns naver"></i>
                    <i class="sns kakao"></i> -->
                </div>
            </div>
            <div class="btn-set">
                <button class="button-basic" onclick="javascript:location.href = '/prototype/account_view_my';">완료</button>
            </div>
            <!-- // 컨텐츠 영역 -->
        </div>
        <!-- // contents -->
        
    </div>
    <!-- container -->
    <jsp:include page="../common/footer.jsp"></jsp:include>

</div>
	<!-- wrap -->
	<!-- 스크립트 영역 -->
	<script src="../js/LAS/jquery-3.4.1.min.js"></script>
	<script src="../js/LAS/swiper.min.js"></script>
	<script src="../js/LAS/all.min.js"></script>
	<script src="../js/LAS/common_ui.js"></script>
	<!-- 스크립트 영역 -->
		
	</body>
</html>