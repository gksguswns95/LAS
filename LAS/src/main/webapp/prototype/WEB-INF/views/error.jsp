<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <h1 onclick="javascript:location.href='/prototype/main';">LG 계정</h1>
        </div>
    </header>
    <!-- // header -->

    <!-- container -->
    <div id="container">
        <div id="contents">
            <!-- 컨텐츠 영역 -->
            <div class="error-box">
                <div class="icon-triangle-wrap">
                    <span></span>
                    <div class="wrap">
                        <i class="fa fa-exclamation" aria-hidden="true"></i>
                    </div>
                </div>
                <h2>page not found</h2>
                <p>
                    404 ERROR
                </p>
            </div>
            <!-- // 컨텐츠 영역 -->
        </div>
        <!-- // contents -->
    </div>
    <!-- container -->
	    <!-- footer -->
		<jsp:include page="./common/footer.jsp"></jsp:include>
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