var ticking = false;
var isFirefox = /Firefox/i.test(navigator.userAgent);
var isIe =
	/MSIE/i.test(navigator.userAgent) ||
	/Trident.*rv\:11\./i.test(navigator.userAgent);
var scrollSensitivitySetting = 30;
var slideDurationSetting = 600;
var currentSlideNumber = 0;
var pageSlide = $(".full-page section");
var totalSlideNumber = pageSlide.length;
function parallaxScroll(evt) {
	let delta = 0;
	if (isFirefox) {
		delta = evt.detail * -120;
	} else if (isIe) {
		delta = -evt.deltaY;
	} else {
		delta = evt.wheelDelta;
	}

	if (ticking != true) {
		if (delta <= -scrollSensitivitySetting) {
			ticking = true;
			if (currentSlideNumber !== totalSlideNumber - 1) {
				currentSlideNumber++;
				nextItem();
			}
			slideDurationTimeout(slideDurationSetting);
		}
		if (delta >= scrollSensitivitySetting) {
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
	$("section").removeClass("current-page");
	var $previousSlide = pageSlide.eq(currentSlideNumber - 1);
	var $currentSlide = pageSlide.eq(currentSlideNumber);
	$currentSlide.addClass("current-page");
	$previousSlide.removeClass("up-scroll").addClass("down-scroll");

	$(".back-to-top").removeClass("active");
	$(".back-to-home").removeClass("active");
	if ($currentSlide.is(":first-child")) {
		$(".back-to-top").removeClass("active");
		$(".back-to-home").removeClass("active");
	}
	if (currentSlideNumber == 1) {
		$(".back-to-top").addClass("active");
		$(".back-to-home").addClass("active");
	} else {
		$(".back-to-top").addClass("active");
		$(".back-to-home").addClass("active");
	}
	if (currentSlideNumber == 6) {
		$(".full-page footer").addClass("active");
	} else {
		$(".full-page footer").removeClass("active");
	}
	$("#nav-pagination ul li").removeClass("active");
	$(
		"#nav-pagination ul li:nth-child(" + (currentSlideNumber + 1) + ")"
	).addClass("active");
}

function previousItem() {
	$("section").removeClass("current-page");
	$("footer").removeClass("active");
	var $currentSlide = pageSlide.eq(currentSlideNumber);
	$currentSlide.addClass("current-page");
	$(".back-to-top").addClass("active");
	$(".back-to-home").addClass("active");
	if ($currentSlide.is(":first-child")) {
		$(".back-to-top").removeClass("active");
		$(".back-to-home").removeClass("active");
	}

	$currentSlide.removeClass("down-scroll").addClass("up-scroll");
	$("#nav-pagination ul li").removeClass("active");
	$(
		"#nav-pagination ul li:nth-child(" + (currentSlideNumber + 1) + ")"
	).addClass("active");
}

function setBackgroundElement() {
	$("[setBackground]").each(function () {
		var background = $(this).attr("setBackground");
		$(this).css({
			"background-image": "url(" + background + ")",
			"background-size": "cover",
			"background-position": "center center",
		});
	});
	$("[setBackgroundRepeat]").each(function () {
		var background = $(this).attr("setBackgroundRepeat");
		$(this).css({
			"background-image": "url(" + background + ")",
			"background-repeat": "repeat",
		});
	});
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
	$(el).height(height);
}

function scrollToTop() {
	$("footer .button-wrapper").on("click", function () {
		currentSlideNumber = 0;
		$("section").removeClass("down-scroll");
		$("footer").removeClass("active");
		$(".home-banner").addClass("current-page");
	});
}

function createPagination() {
	$("main").append("<div id='nav-pagination'><ul></ul></div>");
	var lstSection = $(".full-page section, footer");
	for (let i = 0; i < totalSlideNumber; i++) {
		var spanHtml = "";
		if ($(lstSection[i]).attr("data-title") != undefined) {
			spanHtml =
				" <span>" + $(lstSection[i]).attr("data-title") + "</span>";
		}
		if (i == 0) {
			$("#nav-pagination ul").append(
				"<li class='active' data-section='" +
					(i + 1) +
					"'>" +
					(i + 1) +
					spanHtml +
					"</li>"
			);
		} else {
			$("#nav-pagination ul").append(
				"<li data-section='" +
					(i + 1) +
					"'>" +
					(i + 1) +
					spanHtml +
					"</li>"
			);
		}
	}
	$("#nav-pagination ul li").on("click", function () {
		$("#nav-pagination ul li").removeClass("active");
		$(this).addClass("active");
		let e = $(this).attr("data-section") - 1;
		$(".full-page section").removeClass("down-scroll up-scroll");
		if (e < currentSlideNumber) {
			currentSlideNumber = e;
			$(
				".full-page section:nth-child(" + (currentSlideNumber + 1) + ")"
			).addClass("up-scroll current-page");
			$(".full-page section").removeClass("down-scroll");
			for (let i = currentSlideNumber; i < totalSlideNumber; i++) {
				$(
					".full-page section:nth-child(" +
						(currentSlideNumber + 1) +
						")"
				).addClass("up-scroll");
			}
		} else {
			currentSlideNumber = e;
			$(".full-page section").removeClass("current-page");
			$(
				".full-page section:nth-child(" + (currentSlideNumber + 1) + ")"
			).addClass("current-page");
			for (let i = 0; i < currentSlideNumber; i++) {
				$(".full-page section:nth-child(" + (i + 1) + ")").addClass(
					"down-scroll"
				);
			}
		}
	});
}
function toggleSearchWrapper() {
	$(".header-icon .btn-search").on("click", function () {
		$("header").find(".search-wrapper").toggleClass("active");
	});
	$("header .search-wrapper .close-button").on("click", function () {
		$("header .search-wrapper").toggleClass("active");
	});
	$("section").on("click", function () {
		$("header .search-wrapper").removeClass("active");
	});
}

function listBanerSlide() {
	var myswiper = new Swiper(".home-page-banner .banner-wrapper", {
		loop: true,
		speed: 1000,
		watchSlidesProgress: true,
		mousewheelControl: true,
		keyboardControl: true,
		effect: "fade",
		grabCursor: true,
		// autoplay: {
		// 	delay: 5000,
		// 	disableOnInteraction: false
		// },
		pagination: {
			el: ".swiper-pagination",
			type: "bullets",
			clickable: true,
		},
		fadeEffect: {
			crossFade: true,
		},
	});
	$(".single-swiper .swiper-container").each(function (index, element) {
		var $this = $(this);
		$this.addClass("instance-" + index);
		$this
			.parent()
			.find(".swiper-button-prev")
			.addClass("swiper-button-prev-" + index);
		$this
			.parent()
			.find(".swiper-button-next")
			.addClass("swiper-button-next-" + index);
		var swiper = new Swiper(".instance-" + index, {
			speed: 750,
			observer: true,
			observeParents: true,
			lazy: true,
			breakpointsInverse: true,
			spaceBetween: 30,
			slidesPerView: 3,
			loop: true,
			initialSlide: 3,
			watchOverflow: true,
			centeredSlides: true,
			navigation: {
				nextEl: ".swiper-button-next-" + index,
				prevEl: ".swiper-button-prev-" + index,
			},
			breakpoints: {
				1200: {
					slidesPerView: 3,
					spaceBetween: 20,
				},
				991: {
					slidesPerView: 2,
					spaceBetween: 10,
				},
				575: {
					slidesPerView: 2,
					spaceBetween: 10,
				},
				375: {
					slidesPerView: 2,
					spaceBetween: 10,
				},
			},
		});
	});
	var swiper = new Swiper(".swiper-column .swiper-container", {
		speed: 800,
		slidesPerView: 3,
		slidesPerColumn: 2,
		slidesPerGroup: 3,
		spaceBetween: 5,
		grabCursor: false,
		autoplay: {
			delay: 3000,
		},
		navigation: {
			nextEl: ".swiper-column .swiper-button-next",
			prevEl: ".swiper-column .swiper-button-prev",
		},
	});
	var listTin = new Swiper(".wrap-list-tin .swiper-container", {
		slidesPerView: 1,
		spaceBetween: 30,
		loop: true,
		navigation: {
			nextEl: ".button-next",
			prevEl: ".button-prev",
		},
		breakpoints: {
			1200: {
				slidesPerView: 4,
				spaceBetween: 30,
			},
			991: {
				slidesPerView: 3,
				spaceBetween: 30,
			},
			575: {
				slidesPerView: 2,
				spaceBetween: 15,
			},
			375: {
				slidesPerView: 1,
				spaceBetween: 10,
			},
		},
	});
}

function menuFake() {
	let menuleft = $("header .main-nav .left-nav .navbar-nav .nav-item");
	let menuright = $("header .main-nav .right-nav .navbar-nav .nav-item");
	let footer = $("footer");
	menuleft.clone().appendTo("#fake-header .menu-fake-header");
	menuright.clone().appendTo("#fake-header .menu-fake-header");
	footer.clone().appendTo(".full-page .home-page-6");
}

function tabs() {
	$(".tabs > li").on("click", function () {
		var $panel = $(this).closest(".tab-panels");
		$panel.find("li.active").removeClass("active");
		$(this).addClass("active");
		var panelToShow = $(this).attr("rel");
		$panel.find(".panel.active").fadeOut(300, showNextPanel);

		function showNextPanel() {
			$(this).removeClass("active");
			$("#" + panelToShow).fadeIn(300, function () {
				$(this).addClass("active").fadeIn(300);
			});
		}
	});
	if ($(window).width() < 992 && ".category-nav".length >= 1) {
		$(".category-nav").on("click", function () {
			$(this).find(".material-icons").toggleClass("active");
			$(this).siblings(".tabs, .filter-content").slideToggle("slow");
		});
	}
}

function headerActive() {
	const heightHeader = document.querySelector("header").offsetHeight;
	if ($(".full-page").length == 0) {
		window.addEventListener("scroll", function () {
			if (window.pageYOffset >= heightHeader) {
				document.querySelector("header").classList.add("active-scroll");
			} else {
				document
					.querySelector("header")
					.classList.remove("active-scroll");
			}
		});
	}
}

function crollToDiv() {
	$(".zone-nav .categroly ul li .nav-link").on("click", function (event) {
		$(this).parents("li").addClass("active");
		var heightHeader = $("header").outerHeight();
		if (this.hash !== "") {
			event.preventDefault();
			var hash = this.hash;
			$("html, body").animate(
				{
					scrollTop: $(hash).offset().top - 160,
				},
				900,
				function () {
					window.location.hash = hash;
				}
			);
		}
		$(".zone-nav .categroly ul li .nav-link")
			.not(this)
			.parent("li")
			.removeClass("active");
		$(".about-nav .categroly ul li .nav-link").not(this).parent("li");
		window.addEventListener("scroll", function () {
			var bannerheight = $("#pagebanner").outerHeight();
			if (window.pageYOffset > bannerheight) {
				document.querySelector(".zone-nav").classList.add("scolled");
			} else {
				document.querySelector(".zone-nav").classList.remove("scolled");
				document
					.querySelector(".about-nav")
					.classList.remove("scolled");
			}
		});
	});
}

function crollTop() {
	if ($(".zone-nav").length >= 1) {
		window.addEventListener("scroll", function () {
			var bannerheight = $("#pagebanner").outerHeight();
			var heightHeader = $("header").outerHeight();
			if (window.pageYOffset > bannerheight) {
				document.querySelector(".zone-nav").classList.add("scolled");
				$(".scolled").css("top", heightHeader);
			} else {
				document.querySelector(".zone-nav").classList.remove("scolled");
				$(".zone-nav").css("top", 0);
				document
					.querySelector(".about-nav")
					.classList.remove("scolled");
				$(".about-nav").css("top", 0);
			}
		});
	}
}

function checkFullpage() {
	if ($(".full-page").length >= 1) {
		$("body").toggleClass("overflow-hidden");
	}
	if ($(window).width() < 1024.98) {
		$("body").removeClass("overflow-hidden");
		$(".full-page .home-page-6").toggleClass("active");
	}
}

$(document).ready(function () {
	setBackgroundElement();
	scrollToTop();
	createPagination();
	setTimeout(() => {
		$("section:first-child").addClass("current-page");
	}, 100);
	toggleSearchWrapper();
	listBanerSlide();
	menuFake();
	tabs();
	headerActive();
	crollToDiv();
	crollTop();
	checkFullpage();
	$(window).resize(function () {
		if ($(".full-page").length >= 1) {
			$("body").toggleClass("overflow-hidden");
		}
		if ($(window).width() < 1024.98) {
			$("body").removeClass("overflow-hidden");
			$(".full-page .home-page-6").toggleClass("active");
		}
	});
});
