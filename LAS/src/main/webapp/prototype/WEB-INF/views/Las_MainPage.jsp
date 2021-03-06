<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
	    <title>LAS</title>
	    <link rel="stylesheet" type="text/css" href="../css/LAS/swiper.css">
	    <link rel="stylesheet" type="text/css" href="../css/LAS/common.css">
		<style>
			.head {display:flex; align-items:center; justify-content:center; height:25rem; font-size:2.6rem; color:#fff; font-weight:bold; line-height:3.0rem;background:linear-gradient(135deg, #98222c, #cc0041);}
			.head > div {width:100%; max-width:68rem; padding:0 5.5rem;}
			.head .big {font-size:4.0rem;line-height: 1.8;}
			/*.button-basic.on{background:#ce1461;}*/
			.button-basic.on{background:#222;}
			.button-basic.outline {border:2px solid #222; color:#222;}
			.login-box .con .innerWrap > button{width:30rem;}
			.link-icon-arr {line-height: 1; justify-content:space-evenly;font-size: 1.6rem;color:#333;}
			.login-box .con .innerWrap > button{width:30rem;}
			a:hover{text-decoration:none;}
		</style> 
	</head>
	
	<body>
	<!-- wrap-->
	<div id="wrap">
		<div class="head" onclick="location.href = '/prototype/main';">
	            <div>
	                <span class="big">Welcome,</span><br>
	                <spring:message code="mainSentence" text="LG 계정을 사용하여<br>다양한 LG 전자 서비스를 경험하세요." />
	            </div>
	    </div>
	     <c:if test="${prototype_user_id eq null}">
	     <div class="login-box">
	        <dic class="con" style="min-height: calc(490px);">
	            <div class="innerWrap">
	                <button class="button-basic on" onclick="location.href = '/prototype/signin_valid'" ><spring:message code="signin" text="로그인" /></button>
	                <button class="button-basic outline" onclick="location.href = '/prototype/signup_select';"><spring:message code="signup" text="계정만들기" /></button>
	                <a class="link-icon-arr" href="javascript:location.href = '/prototype/language_region';"><spring:message code="language" text="Korea / 한국어" /><i class="fa fa-angle-right" aria-hidden="true"></i></a>
	            </div>
	        </dic>
	    </div>
	    </c:if>

	    <c:if test="${prototype_user_id ne null}">
	    <div class="login-box">
	        <dic class="con" style="min-height: calc(490px);">
	            <div class="innerWrap">
	                <button class="button-basic on" onclick="location.href = '/prototype/account_view_my'"><spring:message code="mypage" text="마이페이지" /></button>
	                <button class="button-basic on" onclick="location.href='/prototype/signout'"><spring:message code="signout" text="로그아웃" /></button>
	                <a class="link-icon-arr" href="javascript:location.href = '/prototype/language_region';"><spring:message code="language" text="Korea / 한국어" /><i class="fa fa-angle-right" aria-hidden="true"></i></a>
	            </div>
	        </dic>
	    </div>
	    </c:if>
	    <!-- footer -->
		<jsp:include page="./common/footer.jsp"></jsp:include>
	    <!-- // footer -->
	</div>
	<!-- wrap -->
	<!-- 스크립트 영역 -->
	<script src="../js/LAS/jquery-3.4.1.min.js"></script>
	<script src="../js/LAS/swiper.min.js"></script>
	<script src="../js/LAS/common_ui.js"></script>
	<script type="text/javascript">
		var reset = '<c:out value="${lang}"/>';
		if(reset == 'en_US' && $('.link-icon-arr').text() == 'Korea / 한국어') {
			location.href = 'http://localhost:8080/prototype/main?lang=en_US';
		}
		
		if(reset == 'ko_KR' && $('.link-icon-arr').text() == 'U.S.A / English') {
			location.href = 'http://localhost:8080/prototype/main?lang=ko_KR';
		}
	</script>
	<!-- 스크립트 영역 -->
	</body>
</html>