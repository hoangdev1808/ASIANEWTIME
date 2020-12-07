// if ($(window).width() > 1025) {
// -- -- -- -- -- -- - VARIABLES-- -- -- -- -- -- - //
var ticking = false;
var isFirefox = (/Firefox/i.test(navigator.userAgent));
var isIe = (/MSIE/i.test(navigator.userAgent)) || (/Trident.*rv\:11\./i.test(navigator.userAgent));
var scrollSensitivitySetting = 30; //Increase/decrease this number to change sensitivity to trackpad gestures (up = less sensitive; down = more sensitive) 
var slideDurationSetting = 600; //Amount of time for which slide is "locked"
var currentSlideNumber = 0;
var pageSlide = $(".full-page section");
var totalSlideNumber = pageSlide.length;
// ------------- DETERMINE DELTA/SCROLL DIRECTION ------------- //
function parallaxScroll(evt) {
	let delta = 0
	if (isFirefox) {
		//Set delta for Firefox
		delta = evt.detail * (-120);
	} else if (isIe) {
		//Set delta for IE
		delta = -evt.deltaY;
	} else {
		//Set delta for all other browsers
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

// ------------- SET TIMEOUT TO TEMPORARILY "LOCK" SLIDES ------------- //
function slideDurationTimeout(slideDuration) {
	setTimeout(function () {
		ticking = false;
	}, slideDuration);
}

// ------------- ADD EVENT LISTENER ------------- //
var mousewheelEvent = isFirefox ? "DOMMouseScroll" : "wheel";
window.addEventListener(mousewheelEvent, _.throttle(parallaxScroll, 60), false);

// ------------- SLIDE MOTION ------------- //
function nextItem() {
	$('section').removeClass('current-page')
	var $previousSlide = pageSlide.eq(currentSlideNumber - 1);
	var $currentSlide = pageSlide.eq(currentSlideNumber);
	console.log(currentSlideNumber)
	$currentSlide.addClass('current-page')
	$previousSlide.removeClass("up-scroll").addClass("down-scroll");

	// console.log(currentSlide)
	$('.back-to-top').removeClass('active')
	$('.back-to-home').removeClass('active')
	if ($currentSlide.is(':first-child')) {
		$('.back-to-top').removeClass('active')
		$('.back-to-home').removeClass('active')
	}
	if (currentSlideNumber == 1) {
		$('.back-to-top').addClass('active')
		$('.back-to-home').addClass('active')
	} else {
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
	// console.log($currentSlide)
	$currentSlide.addClass('current-page')
	$('.back-to-top').addClass('active')
	$('.back-to-home').addClass('active')
	if ($currentSlide.is(':first-child')) {
		$('.back-to-top').removeClass('active')
		$('.back-to-home').removeClass('active')
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
		$("header .search-wrapper").toggleClass("active");
	});
}
$(document).ready(function () {
	setBackgroundElement()
	scrollToTop()
	createPagination()
	setTimeout(() => {
		$('section:first-child').addClass('current-page')
	}, 100);
	toggleSearchWrapper();
})