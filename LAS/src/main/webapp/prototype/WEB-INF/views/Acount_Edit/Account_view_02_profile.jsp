<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <title>LAS</title>
    <link rel="stylesheet" type="text/css" href="../css/LAS/swiper.css">
    <link rel="stylesheet" type="text/css" href="../css/LAS/common.css">
    <style type="text/css">
    	.mt10 {
    		position: relative;
    	}
    	
    	.button-basic.outline {
			position: absolute;
			right: 0;
    	}
    	
}
    </style>
</head>

<body>
<!-- wrap-->
<div id="wrap">
    <!-- header -->
    <header id="header">
        <div class="inner-wrap">
            <div class="arr">
                <i class="fa fa-angle-left" aria-hidden="true" onclick="javascript:location.href='/prototype/account_view_my';"></i>
            </div>
            <h1 onclick="javascript:location.href='/prototype/main';">LG 계정</h1>
        </div>
    </header>
    <!-- // header -->

    <!-- container -->
    <div id="container">
        <div id="contents">
            <!-- 컨텐츠 영역 -->
            <div class="info-box-member">
                <div class="member-pic">ㅎ</div>
                <div class="member-info">
                    <div class="name">${prototype_user_name }</div>
                    <div class="id"><a href="javascript:;">${prototype_user_id }</a></div>
                </div>
            </div>
            <!-- <div class="btn-set mt10">
                <button class="btn a">인증요청 하기</button>
            </div> -->
            <div class="input-area mt10">
	            <p class="gap"></p>
	            <fieldest class="field" style="padding-top: 0; min-height: 4.0rem;">   
	            	<button class="button-basic outline" onclick="location.href='/prototype/account_edit_auth'">회원정보 수정</button>
	            </fieldest>
                <fieldest class="field"><!-- [D] 클래스 error ]-->
                    <div class="label-switching readonly">
                        <div class="innerWrap">
                            <div class="tit">이름</div>
                            <div class="explain fontColor1">
                                가입자의 본명을 입력하세요.<!-- <br />
                                (*인증과 서비스 진행을 위해 본명이...) -->
                            </div>
                        </div>
                    </div>
                    <div class="input">
                        <input class="" id="name" name="name" type="text" value="${prototype_user_name }" readonly />
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
                </fieldest>
                <fieldset class="field"><!-- [D] 클래스 error ]-->
                    <div class="label-switching readonly">
                        <div class="innerWrap">
                            <div class="tit">생년월일</div>
                            <div class="explain fontColor1">
                                가입자의 본명을 입력하세요.<!-- <br />
                                (*인증과 서비스 진행을 위해 본명이...) -->
                            </div>
                        </div>
                    </div>
                    <div class="input">
                        <input class="" id="birth" name="birth" type="text" value="${prototype_user_birth }" readonly />
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
                <fieldset class="field"><!-- [D] 클래스 error ]-->
                    <div class="label-switching readonly">
                        <div class="innerWrap">
                            <div class="tit">전화번호</div>
                            <div class="explain fontColor1">
                                가입자의 본명을 입력하세요.<!-- <br />
                                (*인증과 서비스 진행을 위해 본명이...) -->
                            </div>
                        </div>
                    </div>
                    <div class="input">
                        <input class="" id="phone" name="phone" type="text" value="${prototype_user_phone }" readonly />
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
                <fieldset class="field"><!-- [D] 클래스 error ]-->
                    <div class="label-switching readonly">
                        <div class="innerWrap">
                            <div class="tit">이메일</div>
                            <div class="explain fontColor1">
                                가입자의 본명을 입력하세요.<!-- <br />
                                (*인증과 서비스 진행을 위해 본명이...) -->
                            </div>
                        </div>
                    </div>
                    <div class="input">
                        <input class="" id="name04" type="text" value="${prototype_user_email }" readonly />
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
                <fieldset class="field"><!-- [D] 클래스 error ]-->
                    <div class="label-switching readonly">
                        <div class="innerWrap">
                            <div class="tit">선호 매장</div>
                            <div class="explain fontColor1">
                                가입자의 본명을 입력하세요.<!-- <br />
                                (*인증과 서비스 진행을 위해 본명이...) -->
                            </div>
                        </div>
                    </div>
                    <!-- <div class="input">
                        <input class="" id="name04" type="text" value="LoremGipsum@email.com" readonly />
                        <div class="btn-wrap">
                            <button class="sp-icon btnDel" type="button"><span class="blind">삭제</span></button>
                        </div>
                    </div> -->
                    <div class="select">
                        <fieldset class="las-select">
                            <select>
                                <option>서울</option>
                            </select>
                        </fieldset>
                        <fieldset class="las-select">
                            <select>
                                <option>강서구</option>
                            </select>
                        </fieldset>
                        <fieldset class="las-select">
                            <select>
                                <option>마곡본점</option>
                            </select>
                        </fieldset>
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
                <fieldset class="field"><!-- [D] 클래스 error ]-->
                    <div class="label-switching readonly">
                        <div class="innerWrap">
                            <div class="tit">선호 매장</div>
                            <div class="explain fontColor1">
                                가입자의 본명을 입력하세요.<!-- <br />
                                (*인증과 서비스 진행을 위해 본명이...) -->
                            </div>
                        </div>
                    </div>
                    <div class="input">
                        <input class="" id="name04" type="text" value="서울 강서구 마곡본점" readonly />
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
                <!-- 인풋박스 -->
                <div class="field minSize-none"><!-- [D] 클래스 error ]-->
                    <div class="label-switching readonly">
                        <div class="innerWrap">
                            <div class="tit">
                                마케팅 수신동의
                                <fieldset>
                                    <label class="switch">
                                        <input type="checkbox">
                                        <span class="slider round"></span>
                                    </label>
                                </fieldset>

                            </div>
                            <!-- <div class="explain fontColor1">이메일 또는 휴대폰번호 입력하세요</div> -->
                        </div>
                    </div>
                    <p class="field-both-txt">
                        포인트/이벤트 소식을 전해드립니다.
                        본 기능의 활성화는 마케팅 수신 정책에  전체 동의 하신 것과 동일하게 간주합니다.<br />
                        <a href="javascritp:;">약관보러가기 ></a>
                        </p>
                </div>
            </div>
            <p class="gap"></p>
            <div class="set-list b line-none">
                <ul>
                    <li>
                        <a href="javascript:;">
                            <div class="tit tit-b">
                                이용중인 서비스
                                <!-- <p class="data">2022.01.30</p> -->
                            </div>
                            <i class="fa fa-chevron-right" aria-hidden="true"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <p class="gap"></p>
            <div class="set-list b line-none" onclick="location.href='/prototype/account_del_check'">
                <ul>
                    <li>
                        <a href="javascript:;">
                            <div class="tit tit-b">
                                계정 삭제
                                <!-- <p class="data">2022.01.30</p> -->
                            </div>
                            <i class="fa fa-chevron-right" aria-hidden="true"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <p class="gap"></p>
            <div class="line-box-area">
                <div class="tit">
                    SNS 계정
                </div>
                <i class="sns facebook"></i>
            </div>
            <!-- <p class="gap"></p>
            <div class="line-box-area">
                <div class="tit">
                    <a class="link-underline" href="javascript:;">계정삭제</a>
                </div>
            </div> -->
            <p class="gap"></p>
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