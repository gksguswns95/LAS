<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <i class="fa fa-angle-left" aria-hidden="true" onclick="javascript:location.href='/prototype/signup_select';"></i>
            </div>
            <jsp:include page="../common/header.jsp" />
        </div>
    </header>
    <!-- // header -->

    <!-- container -->
    <div id="container">
        <div id="contents">
            <!-- 컨텐츠 영역 -->
            <div class="step-wrap">
                <p class="tit"><spring:message code="signup-title" text="LG계정 만들기" /></p>
                <ul class="step">
                    <li class="active">1</li>
                    <li class="active">2</li>
                    <li>3</li>
                    <li>4</li>
                </ul>
            </div>
            <div class="clause-list-box">
                <ul>
                    <li>
                        <div class="tit">
                            <fieldset>
                                <label  class="input-box-label fill"><spring:message code="termsAndConditions" text="이용약관" /> (<spring:message code="esential" text="필수" />)
                                    <input type="checkbox" id="essential_1">
                                </label>
                            </fieldset>
                            <a href="javascript:location.href='/prototype/signup_term01';" class="alink-line"><spring:message code="learnMore" text="자세히 보기" /></a>
                        </div>
                        <div class="both-layout-box">
                            <div class="area-clause">
                                <div class="innerWrap">
                                    <h1>LG Account 이용 약관</h1>
                                    <h2>제1조 목적</h2>
                                    <p>이 약관은 LG전자 주식회사(이하 "회사") 가 제공하는 LG Account를 이용함에 있어서 회사와 회원 간의 권리와 의무, 하나의 ID 및 Password로 통합하여 회사의 서비스를 이용하는데 따른 이용조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다.</p>
                                    <h2>제2조 약관의 효력 및 변경</h2>
                                    <p>1. 이 약관은 LG Account에 가입하고, 회사의 서비스를 이용하고자 하는 모든 이용자에 대해 그 효력을 발생합니다. 2. 회사는 관련 법령을 위반하지 않는 범위 내에서 이 약관을 개정할 수 있습니다. 회사가 약관을 개정하는 경우, 개정된 약관의 적용일자 및 개정사유를 명시하여 현행약관과 함께 서비스의 초기화면 등에 그 적용일자 7일 전부터 적용일자 전일까지 공지합니다. 다만, 회원의 권리ᆞ의무에 중대한 영향을 주는 변경인 경우에는 그 적용일자 30일 전부터 적용일자 전일까지 공지합니다.
                                        3. 회사가 위 2항에 따라 개정된 약관을 공지하면서 "개정일자 적용 이전까지 회원이 명시적으로 거부의 의사표시를 하지 않는 경우 회원이 개정약관에 동의한 것으로 봅니다."라는 취지를 명확하게 공지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 않은 경우에는 개정약관에 동의한 것으로 봅니다. 회원이 개정된 약관에 동의하지 않는 경우 제6조에 따라 탈퇴할 수 있습니다.</p>
                                    <h2>제3조 정의</h2>
                                    <p>
                                        이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br />
                                        1. "LG Account 회원"이라 함은 LG Account 회원 등록을 한 자로서, 회사의 정보를 지속적으로 제공받으며 회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br />
                                        2. "서비스"라 함은 [LG Smart World서비스, LG ThinQ서비스] 등 회사가 LG Account 회원에게 제공하는 인터넷 기반의 제반 서비스를 말합니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="tit">
                            <fieldset>
                                <label  class="input-box-label fill"><spring:message code="personalInformation" text="개인정보수집 이용동의" /> (<spring:message code="esential" text="필수" />)
                                    <input type="checkbox" id="essential_2">
                                </label>
                            </fieldset>
                            <a href="javascript:location.href='/prototype/signup_term02'; " class="alink-line" ><spring:message code="learnMore" text="자세히 보기" /></a>
                        </div>
                       <div class="both-layout-box">
                            <div class="area-clause">
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
                        </div>
                    </li>
                    <li>
                        <div class="tit">
                            <fieldset>
                                <label  class="input-box-label fill"><spring:message code="privacyPolicy" text="개인정보 처리방침" /> (<spring:message code="optional" text="선택" />)
                                    <input type="checkbox" name="idle_agree" id="idle_agree" value="Y">
                                </label>
                            </fieldset>
                            <a href="javascript:location.href='/prototype/signup_term03'; " class="alink-line" ><spring:message code="learnMore" text="자세히 보기" /></a>
                        </div>
                        <div class="both-layout-box">
                            <div class="area-clause">
                                <div class="innerWrap">
                                    <h1>개인정보 처리방침</h1>
                    <p>LG전자 주식회사(이하 "회사"는) 「정보통신망 이용촉진 및 정보 보호 등에 관한 법률」,「개인정보 보호 등에 관한 법률」이 약관은 LG전자 주식회사(이하 "회사") 가 제공하는 LG Account를 이용함에 있어서 회사와 회원 간의 권리와 의무, 하나의 ID 및 Password로 통합하여 회사의 서비스를 이용하는데 따른 이용조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다.</p>
                                    <h2>제2조 약관의 효력 및 변경</h2>
                                    <p>1. 이 약관은 LG Account에 가입하고, 회사의 서비스를 이용하고자 하는 모든 이용자에 대해 그 효력을 발생합니다. 2. 회사는 관련 법령을 위반하지 않는 범위 내에서 이 약관을 개정할 수 있습니다. 회사가 약관을 개정하는 경우, 개정된 약관의 적용일자 및 개정사유를 명시하여 현행약관과 함께 서비스의 초기화면 등에 그 적용일자 7일 전부터 적용일자 전일까지 공지합니다. 다만, 회원의 권리ᆞ의무에 중대한 영향을 주는 변경인 경우에는 그 적용일자 30일 전부터 적용일자 전일까지 공지합니다.
                                        3. 회사가 위 2항에 따라 개정된 약관을 공지하면서 "개정일자 적용 이전까지 회원이 명시적으로 거부의 의사표시를 하지 않는 경우 회원이 개정약관에 동의한 것으로 봅니다."라는 취지를 명확하게 공지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 않은 경우에는 개정약관에 동의한 것으로 봅니다. 회원이 개정된 약관에 동의하지 않는 경우 제6조에 따라 탈퇴할 수 있습니다.</p>
                                    <h2>제3조 정의</h2>
                                    <p>
                                        이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br />
                                        1. "LG Account 회원"이라 함은 LG Account 회원 등록을 한 자로서, 회사의 정보를 지속적으로 제공받으며 회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br />
                                        2. "서비스"라 함은 [LG Smart World서비스, LG ThinQ서비스] 등 회사가 LG Account 회원에게 제공하는 인터넷 기반의 제반 서비스를 말합니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <p class="gap"></p>
            <fieldset>
                <label  class="input-box-label fill"><spring:message code="allAgreed" text="위의 내용을 모두 확인하였으며 모든 내용에 동의합니다." /><input type="checkbox"></label>
            </fieldset>
            <div class="btn-set mt20">
                <button class="button-basic outline">동의</button>
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
	<script type="text/javascript">
		$(function() {
			$($('.input-box-wrap')[3]).click(function() {
				$($('.input-box-wrap')[0]).removeClass('checked');	
				$($('.input-box-wrap')[1]).removeClass('checked');	
				$($('.input-box-wrap')[2]).removeClass('checked');
				$('#essential_1').prop('checked',false);
				$('#essential_2').prop('checked',false);
				$('#idle_agree').prop('checked',false);
				if($($('.input-box-wrap')[3]).hasClass('checked')) {
					$($('.input-box-wrap')[0]).toggleClass('checked');
					$($('.input-box-wrap')[1]).toggleClass('checked');
					$($('.input-box-wrap')[2]).toggleClass('checked');
					$('#essential_1').prop('checked',true);
					$('#essential_2').prop('checked',true);
					$('#idle_agree').prop('checked',true);
				}
			});
			
			$($('.input-box-wrap')[0]).click(function() {
				if($(this).hasClass('checked')) {
					$('#essential_1').prop('checked',true);
				} else {
					$('#essential_1').prop('checked',false);
				}
				allChecked();
			});
			
			$($('.input-box-wrap')[1]).click(function() {
				if($(this).hasClass('checked')) {
					$('#essential_2').prop('checked',true);
				}else {
					$('#essential_2').prop('checked',false);
				}
				allChecked();
			});
			
			$($('.input-box-wrap')[2]).click(function() {
				if($(this).hasClass('checked')) {
					$('#idle_agree').prop('checked',true);
				}else {
					$('#idle_agree').prop('checked',false);
				}
				allChecked();
			});
			
			function allChecked() {
				if( $($('.input-box-wrap')[0]).hasClass('checked') && $($('.input-box-wrap')[1]).hasClass('checked') && $($('.input-box-wrap')[2]).hasClass('checked') ) {
					if( !($($('.input-box-wrap')[3]).hasClass('checked'))) {
						$($('.input-box-wrap')[3]).toggleClass('checked');
					}
				} else {
						$($('.input-box-wrap')[3]).removeClass('checked');
				}
			}
			
			$('.button-basic').click(function() {
				if($('#essential_2').prop('checked') && $('#essential_1').prop('checked')) {
					if($('#idle_agree').prop('checked')) {
						location.href = './signup_inputpin?agree='+$('#idle_agree').val();						
					} else {
						location.href = './signup_inputpin';
					}
				} 
			});
			
		});
	</script>
<!-- 스크립트 영역 -->


</body>
</html>