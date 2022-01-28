(function(jq){
	
	var $ = jq;
var LAS = LAS || {};

	LAS = {
		initialize : function(){
			this.detect = {
				$wrap : $('#wrap'),
				$header : $('#header'),
				$main : $('#container'),
				$contents : $('#contents'),
			};

			this._toast(); // 토스트 팝업
			this._btnChk(); // 하단 버튼이 있을 경우 
			this._tabMenu(); // 텝 메뉴 
			this._resultModify(); // 인풋 체인지 
			this._inputActive(); // 인풋 액션
			this._selectAction(); // 셀랙트
			this._dimmyClickClose(); // 딤닫기
			this._popup(); // 버튼테스트
			this._btn();



			/* 플러그인 */
			this.openPopup(); // 스와이프 셀렉트 팝업
			this.topNavi(); // 스와이프 전체 텝매뉴
		},
		_toast : function(){
			var $wrap = $('#toastAction');
			var speed = 5000; // 토스트 삭제 타임 
				if(!$wrap.length)return;
		
			$wrap.addClass("active");	
			setTimeout(function(){
				$wrap.removeClass("active");
				setTimeout(function(){
					$wrap.remove();
				},100);
			}, speed);
		},
		_btn : function(){
			var $bnt = $('.btn-wrap .btn')

			$bnt.click(function(){
				$(this).toggleClass('active')
			})

			
		},
		_btnChk : function(){
			var $wrap = $('#wrap'),
				$contentBox = $wrap.find('#container #contents')
				$btnChk = $wrap.find('.btn-wrap .btn')

			if(!$btnChk.length){
				return
			}else {
				$contentBox.css({
					'height' : 'auto ',
					'padding-bottom' : '13rem ',
				});
			};
		},
		_tabMenu : function(){
			var $wrap = $('.tab-area');
				$btn = $wrap.find('.menu li');

			$btn.first().addClass('on')
			$btn.on('click', function(){
				var _this = $(this);
				var idx = _this.index()
				_this.addClass('on').siblings().removeClass('on')
				_this.parent().parent().children('.tab-content').eq(idx).addClass('active').siblings().removeClass('active')

			});

		},
		_resultModify : function(){
			var $wrap = $('#result-modify'),
				$btn = $wrap.find('.ico-edit');

			if(!$wrap.length)return;
			
			if($btn.children().hasClass('end')){
				$btn.prev().find('input').prop('disabled', false);
			}else {
				$btn.prev().find('input').prop('disabled', true);
			}
			$btn.on('click', function(){
				_this = $(this);
				_this.children().toggleClass('end');
				if(_this.children().hasClass('end')){
					_this.prev().find('input').prop('disabled', false);
					_this.prev().find('input').focus()
				}else {
					_this.prev().find('input').prop('disabled', true);
					_this.prev().find('input').focusout();
				}
			});

		},
		_inputActive : function(){
			var $wrap = $('#inputAction');
			if(!$wrap.length)return;
			
			var $focus = $wrap.find('.input input'),
				$btnDel = $wrap.find('.btnDel');
				$inputFake = $wrap.find('.inputFake .selectBtn');

			$inputFake.on('click', function(){
				var _this = $(this);
				
				// console.log

				_this.parent().addClass('on').siblings().removeClass('on');
				_this.prev().animate({
					position : 'absolute',
					top : 0,
					opacity : 1
				});

				if(_this.parent().hasClass('on')){
					_this.parent().next().show(100);
				}else {
					_this.parent().next().hide(100);
				}
			
			});
			$focus.on('focus', function(){
				var _this = $(this);
				_this.parent().parent().addClass('on').siblings().removeClass('on');
				_this.parent().prev().animate({
					position : 'absolute',
					top : 0,
					opacity : 1
				});

				if(_this.parent().parent().hasClass('on')){
					_this.next().children().show(100);
				}else {
					_this.next().children().hide(100);
				}
				$btnDel.on('click', function(){
					$(this).parent().prev().val('');
					$(this).hide(100)
				});
			});
			$focus.on('blur', function(){
				var _this = $(this);
				
				_this.prev().animate({
					position : 'absolute',
					top : 0,
					opacity : 1
				});
				
				setTimeout(function(){
					if(!_this.closest('.input-col2').find('.field').hasClass('on')){
						_this.closest('.field').removeClass('on');
					}
					
				},50);

				// _this.closest('.input-col2').children('.input-area').find('.field').css({
				// 	'border-bottom' : '1px solid #000'
				// });
				// setTimeout(function(){
				
				// },50);
			});
		
		},
		_selectAction : function(){
			var num = 0;
			var $wrap = $('#open-popup'),
				$titleBar = $('#open-popup .title'),
				$contentBox = $wrap.find('.field-wrap'),
				$contentBox2 = $wrap.find('.field-wrap.full-popup'),
				$dim = $(".dummyDimmy");
				if(!$wrap.length)return;
			var	$selectBtn = $('.selectBtn');
			var	$btnClose = $('.btnClose');

			
			$selectBtn.on('click', function(e){
				var idx = $selectBtn.index($(this));
				num++

				if(num == 1) {
					$titleBar.eq(idx).addClass("bar");
					if(!$contentBox.hasClass('full-popup')){
						$contentBox.eq(idx).animate({
							height : "+=" + 400
						}, 300);
					}else {
						$contentBox2.eq(idx).animate({
							height : 90 + '%'
						}, 300);
					}
					
					$dim.addClass("on");
					$btnClose.eq(idx).css({
						display : 'block'
					});
					num--
					
				}else if(num == 0){
					if(!$contentBox.hasClass('full-popup')){
						$contentBox.eq(idx).animate({
							height : "-=" + 400
						}, 300);
					}else {
						$contentBox2.eq(idx).animate({
							height : "-=" + 90 + '%'
						}, 300);
					}
					$btnClose.eq(idx).css({
						display : 'none'
					});
				}
				e.stopPropagation();
			});
			$btnClose.on('click', function(e){
				var idx = $contentBox.index($(this).parents(".field-wrap"));
				if(!$contentBox.hasClass('full-popup')){

					$contentBox.eq(idx).animate({
						height : "-=" + 400
					}, 300,function(){
						$dim.removeClass("on");
						$titleBar.removeClass("bar");
					});
				}else {
					$contentBox.eq(idx).animate({
						height : "-=" + 90 + '%'
					}, 300,function(){
						$dim.removeClass("on");
						$titleBar.removeClass("bar");
					});
				}
				e.stopPropagation();
				
			});

		},
		_dimmyClickClose : function(){
			var $dim = $(".dummyDimmy");
			var $titleBar = $('#open-popup .title');
			$dim.click(function(e){
					
				if(!$('.field-wrap').hasClass('full-popup')){
					$('.field-wrap').animate({
						height : "-=" + 400
					}, 300,function(){
						$dim.removeClass("on");
						$titleBar.removeClass("bar");
					});
				}else {
					$('.field-wrap.full-popup').animate({
						height : "-=" + 90 + '%'
					}, 300,function(){
						$dim.removeClass("on");
						$titleBar.removeClass("bar");
					});
				}
				
				e.stopPropagation();
				
				$('.popup-area').hide()
			});
		},
		_popup : function(){
			var $wrap = $('.popup-area'),
				$closeBtn = $wrap.find('.closeBtn'),
				$openBtn = $('.openBtn');
			var $dim = $wrap.find(".dummyDimmy");
			if(!$wrap.length)return;

			$openBtn.on('click', function(){
				// $body.addClass('on');
				$dim.addClass("on");
				var $wrap = $(this).attr('data-popup');

				$($wrap).show();
				var hei = $($wrap).find('.popup').outerHeight() / 2
				$('.popup').css({
					'margin-top' : - hei - 30
				});
			});

			// 닫기
			$closeBtn.on('click', function(){
				$dim.removeClass("on");
				$wrap.hide();
			});
		},
		/* ---------------------
		    	스와이프 
		------------------------ */
		openPopup : function(){
			var $openPopup = $('#open-popup .swiper-container');
			if(!$openPopup.length)return;

			new Swiper($openPopup, {
				// loop : true,
				observer: true, // display none block true / false 
				observeParents: true, // display none block true / false
	
				direction: 'vertical',
				slidesPerView: 4,
				spaceBetween: 0,
				centeredSlides: true,
				pagination: {
					el: '.swiper-pagination',
					clickable: true,
				},
				setWrapperSize: true
			});
		},
		topNavi : function(){
			var $navigation = $('.top-navigation');
			var $slide = $navigation.find('.swiper-slide');
	
			if(!$navigation.length)return;
	
			new Swiper($navigation , {
				slidesPerView: 'auto',
				pagination: {
					el: '.swiper-pagination',
					clickable: true,
				},
				setWrapperSize: true // 
			});
			$slide.on('click', function(){
				var _this = $(this);
				var idx = _this.index();
				_this.addClass('on').siblings().removeClass('on');
				_this.closest($navigation).next().children().children(':eq('+ idx + ')').addClass('on').siblings().removeClass('on');
			});
		},
	};


	$(function () {
		LAS.initialize();
	});

	
})(jQuery);

