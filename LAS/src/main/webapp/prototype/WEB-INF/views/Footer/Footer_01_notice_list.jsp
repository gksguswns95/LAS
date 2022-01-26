<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <title>LAS</title>
    <link rel="stylesheet" type="text/css" href="../css/swiper.css">
    <link rel="stylesheet" type="text/css" href="../css/common.css">
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
            <div class="set-list b">
                <ul>
                    <li>
                        <a href="javascript:;" onclick="popup.open()">
                            <div class="tit">
                                LG전자 개인정보 처리방침 
                                <p class="data">2022.01.30</p>
                            </div>
                            <i class="fa fa-chevron-right" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <div class="tit">
                                이벤트 개인정보 처리방침
                                <p class="data">2022.01.30</p>
                            </div>
                            <i class="fa fa-chevron-right" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <div class="tit">
                                영상기기 운영방침
                                <p class="data">2022.01.30</p>
                            </div>
                            <i class="fa fa-chevron-right" aria-hidden="true"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- // 컨텐츠 영역 -->
        </div>
        <!-- // contents -->
        
    </div>
    <!-- container -->
    <footer>
        <ul class="terms">
            <li><a href="javascript:;">공지사항</a></li>
            <li class="line"></li>
            <li><a href="javascript:;">문의하기</a></li>
            <li class="line"></li>
            <li><a href="javascript:;">이용약관</a></li>
            <li class="line"></li>
            <li><a href="javascript:;">개인정보 처리방침</a></li>
        </ul>
        <p class="copy">Copyright ⓒ 2022 LG Electronics. All Rights Reserved</p>
    </footer>
    
    <div class="pop-layer">
        <div class="inner">
            <div class="tit">
                LG전자 회원 공지
                <button class="close" onclick="popup.close()"></button>
            </div>
            <div class="cont-area">        
                <div class="cont">
                    내용씨
                </div>
            </div>
        </div>
    </div>
</div>

<!-- wrap -->
<!-- 스크립트 영역 -->
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/swiper.min.js"></script>
<script src="../js/common_ui.js"></script>
<!-- 스크립트 영역 -->
<script>
    
    // const popLayer = $('.pop-layer');
    // const cl = popLayer.find('.close');
    
    const popup = {
        popLayer : $('.pop-layer'),
        open : function() {
            this.popLayer.addClass('active');
        },
        close : function() {
            this.popLayer.removeClass('active');
        },
    }

    // function popUp(){
    //     popLayer.addClass('active');
    // }
    // function closeBtn(){

    //     console.log(1);
    //     popLayer.removeClass('active');
    // }

</script>

</body>
</html>