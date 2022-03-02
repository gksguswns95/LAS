<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <title>LAS</title>
    <link rel="stylesheet" type="text/css" href="../css/LAS/swiper.css">
    <link rel="stylesheet" type="text/css" href="../css/LAS/common.css">
    <style type="text/css">
    	.alert-wrap.active .inner-wrap{animation:none}
    </style>
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
            <div class="info-box-member">
                <div class="member-pic">${prototype_user_firstName }</div>
                <div class="member-info">
                    <div class="name">${prototype_user_name }</div>
                    <div class="id"><a href="javascript:;">${prototype_user_id }</a></div>
                </div>
            </div>
            <!-- <div class="btn-set mt10">
                <button class="btn a">인증요청 하기</button>
            </div> -->
            <form action="/prototype/accountModifyProcess" method="post" id="form-accountModify">
            <div class="input-area mt10">
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
                            <div class="tit">비밀번호<button class="btn-modify" onclick="location.href='/prototype/account_edit_resetpw';" type="button">비밀번호 변경</button></div>
                            <div class="explain fontColor1">
                                가입자의 본명을 입력하세요.<!-- <br />
                                (*인증과 서비스 진행을 위해 본명이...) -->
                            </div>
                        </div>
                    </div>
                    <div class="input">
                        <input class="" type="password" id="pw" value="**********" readonly />
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
                        	 
                            <div class="tit" style="display: block;">전화번호 <c:if test="${prototype_user_signuptype eq 'email'}"> <span class="fontColor2" style="font-size: 1.2rem">*수정가능</span> </c:if></div>
                            
                            <div class="explain fontColor1">
                                가입자의 본명을 입력하세요.<!-- <br />
                                (*인증과 서비스 진행을 위해 본명이...) -->
                            </div>
                        </div>
                    </div>
                    <div class="input">
                        <input class="" id="phone" name="phone" type="text" value="${prototype_user_phone }" 
                        	<c:if test="${prototype_user_signuptype eq 'phone'}"> readonly </c:if> />
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
                            <div class="tit" style="display: block;">이메일 <c:if test="${prototype_user_signuptype eq 'phone'}"> <span class="fontColor2" style="font-size: 1.2rem">*수정가능</span> </c:if></div>
                            <div class="explain fontColor1">
                                가입자의 본명을 입력하세요.<!-- <br />
                                (*인증과 서비스 진행을 위해 본명이...) -->
                            </div>
                        </div>
                    </div>
                    <div class="input">
                        <input class="" id="email" name="email" type="text" value="${prototype_user_email }" 
                        <c:if test="${prototype_user_signuptype eq 'email'}"> readonly </c:if> />
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
                            <select id="1">
                                <option>서울</option>
                            </select>
                        </fieldset>
                        <fieldset class="las-select">
                            <select id="2">
                                <option>강서구</option>
                                <option>강남구</option>
                                <option>강서구</option>
                                <option>강동구</option>
                            </select>
                        </fieldset>
                        <fieldset class="las-select">
                            <select id="3">
                                <option>마곡본점</option>
                                <option>우장산점</option>
                                <option>화곡점</option>
                                <option>까치산점</option>
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
                        <input class="" id="favor-Stroe" name="favor-Stroe" type="text" value="서울 강서구 마곡본점" readonly />
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
            <div class="btn-set mt40">
                <button class="button-basic g" onclick="javascript:$('.alert-wrap').addClass('active')">취소</button>
                <button class="button-basic" id="btn_next_accountModify">수정</button>
            </div>
            <div class="alert-wrap">
			    <div class="inner-wrap">
			        <button class="button-close" onclick="javascript:$(this).parents('.alert-wrap').removeClass('active');">close</button>
			        <h2>회원정보수정 취소안내</h2>
			        <div class="txt">
			            회원정보수정을 취소하시겠습니까?
			        </div>
			        <div style="display:flex">
			        <button class='button-alerrt' onclick="location.href='/prototype/account_view_profile'">확인</button>
			        <button class='button-alerrt' onclick="javascript:$(this).parents('.alert-wrap').removeClass('active')">취소</button>
			        </div>
			    </div>
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
<script src="../js/LAS/modify/modifyEdit.js"></script>
<script src="../js/LAS/modify/modifyColor.js"></script>
<!-- 스크립트 영역 -->

</body>
</html>