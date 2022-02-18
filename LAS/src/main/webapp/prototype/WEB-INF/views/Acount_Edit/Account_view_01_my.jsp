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
                <i class="fa fa-angle-left" aria-hidden="true" onclick="javascript:location.href='/prototype/main';"></i>
            </div>
            <h1 onclick="javascript:location.href='/prototype/main';">LG 계정</h1>
        </div>
    </header>
    <!-- // header -->
    <!-- container -->
    <div id="container">
        <div id="contents" class="t2">
            <!-- dummy gnb -->
            <div class="dummy-box"></div>
            <!-- //dummy gnb -->
            <!-- 마이페이지 -->
            <div class="top-handler-box">
                <a href="#javascript:;" class="previous"><i class="fa fa-angle-left"></i>이전</a>
                <a href="javascript:location.href='/prototype/signout'" class="logout">로그아웃</a>
            </div>
            <h1 class="my-page-tit">마이페이지</h1>
            <div class="my-wrap">
                <div class="my-main">
                    <div class="inner-wrap">
                        <p class="name">${prototype_user_name }</p>
                        <ul class="link">
                            <li><a href="/prototype/account_view_profile">회원정보 수정 <i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                            <li><a href="javascript:'">배송지 관리 <i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                        </ul>
                        <div class="item-box">
                            <div class="item">
                                <span class="tit">멤버십포인트(P)</span>
                                <p class="num">0</p>
                            </div>
                            <div class="item">
                                <span class="tit">쿠폰</span>
                                <p class="num">0</p>
                            </div>
                            <div class="item">
                                <span class="tit">보유 제품</span>
                                <p class="num">0</p>
                            </div>
                            <div class="item">
                                <span class="tit">케어솔루션</span>
                                <p class="num">0</p>
                            </div>
                        </div>
                        <div class="btm-box">
                            <ul>
                                <li>
                                    단골매장을 추가해보시겠어요?
                                    <button>등록하기</button>
                                </li>
                                <li>
                                    보유 제품을 등록해 손쉽게 관리하세요.
                                    <button>등록하기</button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <ul class="b-link">
                    <li><a href="javascript:'">스토리</a></li>
                    <li><a href="javascript:'">마이컬렉션</a></li>
                    <li><a href="javascript:'">이벤트</a></li>
                </ul>
            </div>
            <!-- 마이페이지 -->
            <!-- 컨텐츠 영역 -->
            <div class="shopping-box">
                <h1>나의 쇼핑관리</h1>
                <div class="list-box">
                    <div class="head">
                        <a href="jvascript:;">주문조회 (<span>0</span>)<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                        <span class="range">최근 3개월기준</span>
                    </div>
                    <div class="step-box">
                        <div class="tit">
                            일반제품
                        </div>
                        <ul>
                            <li>
                                <a href="javascript:;">
                                    <span class="num">999</span>
                                    <h2>주문접수</h2>
                                </a>
                                <i class="fa fa-angle-right" aria-hidden="true"></i>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <span class="num">999</span>
                                    <h2>결제완료</h2>
                                </a>
                                <i class="fa fa-angle-right" aria-hidden="true"></i>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <span class="num">999</span>
                                    <h2>배송준비중</h2>
                                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <span class="num">999</span>
                                    <h2>배송중</h2>
                                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <span class="num">999</span>
                                    <h2>배송완료</h2>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- // info-wrap -->
            <!-- // 컨텐츠 영역 -->
        </div>
        <!-- // contents -->
        
    </div>
    <!-- container -->

    <!-- 버튼 영역 -->

    <!-- // 버튼 영역 -->
</div>
<!-- wrap -->
<!-- 스크립트 영역 -->
<script src="../js/LAS/jquery-3.4.1.min.js"></script>
<script src="../js/LAS/swiper.min.js"></script>
<script src="../js/LAS/common_ui.js"></script>
<!-- 스크립트 영역 -->

</body>
</html>