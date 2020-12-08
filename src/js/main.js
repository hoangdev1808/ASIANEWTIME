var ticking = false;
var isFirefox = (/Firefox/i.test(navigator.userAgent));
var isIe = (/MSIE/i.test(navigator.userAgent)) || (/Trident.*rv\:11\./i.test(navigator.userAgent));
var scrollSensitivitySetting = 30;
var slideDurationSetting = 600;
var currentSlideNumber = 0;
var pageSlide = $(".full-page section");
var totalSlideNumber = pageSlide.length;

function parallaxScroll(evt) {
	let delta = 0
	if (isFirefox) {
		delta = evt.detail * (-120);
	} else if (isIe) {
		delta = -evt.deltaY;
	} else {
		delta = evt.wheelDelta;
	}

	if (ticking != true) {
		if (delta <= -scrollSensitivitySetting) {
			//Down scroll
			ticking = true;
			if (currentSlideNumber !== totalSlideNumber - 1) {
				currentSlideNumber++;
				nextItem();
			}
			slideDurationTimeout(slideDurationSetting);
		}
		if (delta >= scrollSensitivitySetting) {
			//Up scroll
			ticking = true;
			if (currentSlideNumber !== 0) {
				currentSlideNumber--;
				previousItem();
			}
			slideDurationTimeout(slideDurationSetting);
		}
	}
}

function slideDurationTimeout(slideDuration) {
	setTimeout(function () {
		ticking = false;
	}, slideDuration);
}

var mousewheelEvent = isFirefox ? "DOMMouseScroll" : "wheel";
window.addEventListener(mousewheelEvent, _.throttle(parallaxScroll, 60), false);

function nextItem() {
	$('section').removeClass('current-page')
	var $previousSlide = pageSlide.eq(currentSlideNumber - 1);
	var $currentSlide = pageSlide.eq(currentSlideNumber);
	$currentSlide.addClass('current-page')
	$previousSlide.removeClass("up-scroll").addClass("down-scroll");
	$('header').addClass('active')
	$('#fake-header-open').addClass('active')
	$('header .search-wrapper').removeClass('active')
	$('.back-to-top').removeClass('active')
	$('.back-to-home').removeClass('active')
	if ($currentSlide.is(':first-child')) {
		$('#fake-header').removeClass('active');
	}
	if (currentSlideNumber == 1) {
		$(' #fake-header-open').addClass('last')
		$('.back-to-top').addClass('active')
		$('.back-to-home').addClass('active')
		$('#fake-header').removeClass('active');
	} else {
		$('#fake-header-open').removeClass('last')
		$('.back-to-top').addClass('active')
		$('.back-to-home').addClass('active')
	}
	if (currentSlideNumber == 6) {
		$('.full-page footer').addClass('active')
	} else {
		$('.full-page footer').removeClass('active')
	}
	$('#nav-pagination ul li').removeClass('active')
	$('#nav-pagination ul li:nth-child(' + (currentSlideNumber + 1) + ')').addClass('active')
}

function previousItem() {
	$('section').removeClass('current-page')
	$('footer').removeClass('active')
	var $currentSlide = pageSlide.eq(currentSlideNumber);
	$currentSlide.addClass('current-page')
	$('#fake-header-open').removeClass('last')
	$('.back-to-top').addClass('active')
	$('.back-to-home').addClass('active')
	if ($currentSlide.is(':first-child')) {
		$('header').removeClass('active')
		$('.back-to-top').removeClass('active')
		$('.back-to-home').removeClass('active')
		$('#fake-header-open').removeClass('active')
		$('#fake-header').removeClass('active');
	}
	if (currentSlideNumber == 1) {
		$('#fake-header-open').addClass('last')
	} else {
		$('#fake-header-open').removeClass('last')
	}

	$currentSlide.removeClass("down-scroll").addClass("up-scroll");
	$('#nav-pagination ul li').removeClass('active')
	$('#nav-pagination ul li:nth-child(' + (currentSlideNumber + 1) + ')').addClass('active')
}

function setBackgroundElement() {
	$('[setBackground]').each(function () {
		var background = $(this).attr('setBackground')
		$(this).css({
			"background-image": "url(" + background + ")",
			"background-size": "cover",
			"background-position": "center center"
		})
	})
	$('[setBackgroundRepeat]').each(function () {
		var background = $(this).attr('setBackgroundRepeat')
		$(this).css({
			"background-image": "url(" + background + ")",
			"background-repeat": "repeat"
		})
	})
}

function srcollHeaderChild() {
	if ($('.full-page') >= 1) {
		var header = $(".tuyen-dung-ct-page header, .news-detail-page header")
		var fakeHeader = $(".tuyen-dung-ct-page #fake-header-open, .news-detail-page #fake-header-open")
		var dropToggle = $('#fake-header ul.nav-bar .nav-item.dropdown .nav-link')
		dropToggle.on('click', function (e) {
			console.log(22)
			e.preventDefault();
			$(this).next('.dropdown-menu').slideToggle();
		})
	}
}


function EqualHeightElement(el) {
	let height = 0;
	let thisHeight = 0;
	$(el).each(function () {
		thisHeight = $(this).height();
		if (thisHeight > height) {
			height = thisHeight;
		}
	});
	$(el).height(height)
}

function scrollToTop() {
	$('footer .button-wrapper').on('click', function () {
		currentSlideNumber = 0
		$('section').removeClass('down-scroll')
		$('footer').removeClass('active')
		$('.home-banner').addClass('current-page')
	})
}



function createPagination() {
	$('main').append("<div id='nav-pagination'><ul></ul></div>")
	var lstSection = $(".full-page section, footer");
	for (let i = 0; i < totalSlideNumber; i++) {
		var spanHtml = "";
		if ($(lstSection[i]).attr("data-title") != undefined) {
			spanHtml = " <span>" + $(lstSection[i]).attr("data-title") + "</span>";
		}
		if (i == 0) {
			$('#nav-pagination ul').append('<li class=\'active\' data-section=\'' + (i + 1) + '\'>' + (i + 1) + spanHtml + '</li>')
		} else {
			$('#nav-pagination ul').append('<li data-section=\'' + (i + 1) + '\'>' + (i + 1) + spanHtml + '</li>')
		}
	}
	$('#nav-pagination ul li').on('click', function () {
		$('#nav-pagination ul li').removeClass('active')
		$(this).addClass('active')
		let e = $(this).attr('data-section') - 1
		$('.full-page section').removeClass('down-scroll up-scroll')
		if (e < currentSlideNumber) {
			currentSlideNumber = e
			$('.full-page section:nth-child(' + (currentSlideNumber + 1) + ')').addClass('up-scroll current-page')
			$('.full-page section').removeClass('down-scroll')
			for (let i = currentSlideNumber; i < totalSlideNumber; i++) {
				$('.full-page section:nth-child(' + (currentSlideNumber + 1) + ')').addClass('up-scroll')
			}
		} else {
			currentSlideNumber = e
			$('.full-page section').removeClass('current-page')
			$('.full-page section:nth-child(' + (currentSlideNumber + 1) + ')').addClass('current-page')
			for (let i = 0; i < currentSlideNumber; i++) {
				$('.full-page section:nth-child(' + (i + 1) + ')').addClass('down-scroll')
			}
		}
		if ((currentSlideNumber + 1) == totalSlideNumber) {
			$('footer').addClass('active')
		} else {
			$('footer').removeClass('active')
		}
		if (currentSlideNumber != 0) {
			$('header').addClass('active')
			$('#fake-header-open').addClass('active')
		} else {
			$('header').removeClass('active')
			$('#fake-header-open').removeClass('active')
		}
		if (currentSlideNumber == 5) {
			$('#fake-header-open').addClass('last')
		} else {
			$('#fake-header-open').removeClass('last')
		}
	})
}

function fakeHeader() {
	let e = $('header .main-list-wrapper').html()
	$('#fake-header .menu-fake-header').append(e)
	$('#fake-header-open').on('click', function () {
		$('#fake-header').addClass('active');
		$(this).removeClass('active');
	})
	$('#fake-header .close-button').on('click', function () {
		$('#fake-header').removeClass('active');
		$('#fake-header-open').addClass('active')
	})
}

function fakeLogo() {
	let e = $('header .logo-wrapper').html()
	$('#fake-header .logo-fake-header').append(e)
	$('#fake-header-open').on('click', function () {
		$('#fake-header').addClass('active')
	})
	$('#fake-header .close-button').on('click', function () {
		$('#fake-header').removeClass('active')
	})
}

function fakeLanguage() {
	let e = $('header .language-wrapper').html()
	$('#fake-header .menu-fake-header').append(e)
	$('#fake-header-open').on('click', function () {
		$('#fake-header').addClass('active')
	})
	$('#fake-header .close-button').on('click', function () {
		$('#fake-header').removeClass('active')
	})
}


function backToTop() {
	if ($(window).outerWidth() > 1025) {
		$('.back-to-top').on('click', function () {
			$('header').removeClass('active')
			$('footer').removeClass('current-page active')
			$('#fake-header-open').removeClass('active')
			$('.back-to-home').removeClass('active')
			let e = $(this).attr('data-section') - 1
			$('.page-wrap section').removeClass('down-scroll up-scroll')
			if (e < currentSlideNumber) {
				currentSlideNumber = e
				$('.page-wrap section:nth-child(' + (currentSlideNumber + 1) + ')').addClass('up-scroll current-page')
				$('.page-wrap section').removeClass('down-scroll')
				$(`#nav-pagination ul li`).removeClass('active')
				$(`#nav-pagination ul li[data-section=${currentSlideNumber + 1}]`).addClass('active')
				for (let i = currentSlideNumber; i < totalSlideNumber; i++) {
					$('.page-wrap section:nth-child(' + (currentSlideNumber + 1) + ')').addClass('up-scroll')
					$(`#nav-pagination ul li`).removeClass('active')
					$(`#nav-pagination ul li[data-section=${currentSlideNumber + 1}]`).addClass('active')
				}
			} else {
				currentSlideNumber = e
				$('.page-wrap section').removeClass('current-page')
				$('.page-wrap section:nth-child(' + (currentSlideNumber + 1) + ')').addClass('current-page')
				$(`#nav-pagination ul li`).removeClass('active')
				$(`#nav-pagination ul li[data-section=${currentSlideNumber + 1}]`).addClass('active')
				for (let i = 0; i < currentSlideNumber; i++) {
					$('.page-wrap section:nth-child(' + (i + 1) + ')').addClass('down-scroll')
				}
			}
			$('.back-to-top').removeClass('active')
		})
	} else {
		$(window).scroll(function (event) {
			var scroll = $(window).scrollTop()
			if (scroll > 5) {
				$('header').addClass('active')
				$('#fake-header-open').addClass('active')
			} else {
				$('header').removeClass('active')
				$('#fake-header-open').removeClass('active')
			}
			if (scroll > 500) {
				$('.back-to-top').addClass('active')
				$('.back-to-home').addClass('active')
			} else {
				$('.back-to-top').removeClass('active')
				$('.back-to-home').removeClass('active')
			}
		})
		$('.back-to-top').on('click', function () {
			$("html,body").animate({
				scrollTop: 0
			}, 1300)
		})
	}
	$('.news-detail-page').scroll(function (event) {
		var scroll = $('.news-detail-page').scrollTop()
		if (scroll > 5) {
			$('header').addClass('active')
			$('#fake-header-open').addClass('active')
		} else {
			$('header').removeClass('active')
			$('#fake-header-open').removeClass('active')
		}
		if (scroll > 500) {
			$('.back-to-top').addClass('active')
			$('.back-to-home').addClass('active')
		} else {
			$('.back-to-top').removeClass('active')
			$('.back-to-home').removeClass('active')
		}
	})
	$('.back-to-top').on('click', function () {
		$("html,body").animate({
			scrollTop: 0
		}, 1300)
	})
}

function toggleSearchWrapper() {
	$(".header-icon .btn-search").on("click", function () {
		$("header").find('.search-wrapper').toggleClass("active");
	});
	$("header .search-wrapper .close-button").on("click", function () {
		$("header .search-wrapper").toggleClass("active");
	});
	$('section').on("click", function () {
		$("header .search-wrapper").removeClass("active");
	});
}

function listBanerSlide() {
	var myswiper = new Swiper('.home-page-banner .banner-wrapper', {
		loop: true,
		speed: 1000,
		watchSlidesProgress: true,
		mousewheelControl: true,
		keyboardControl: true,
		effect: 'fade',
		grabCursor: true,
		autoplay: {
			delay: 5000,
			disableOnInteraction: false
		},
		pagination: {
			el: '.swiper-pagination',
			type: 'bullets',
			clickable: true,
		},
		fadeEffect: {
			crossFade: true,
		},
	});
}
$(document).ready(function () {
	srcollHeaderChild()
	setBackgroundElement()
	scrollToTop()

	createPagination()
	fakeHeader()
	fakeLanguage()
	setTimeout(() => {
		$('section:first-child').addClass('current-page')
	}, 100);
	backToTop()
	toggleSearchWrapper();
	listBanerSlide();
})