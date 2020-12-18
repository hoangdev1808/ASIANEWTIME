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
	if ($(window).width() > 1200 && $(".full-page").length >= 1) {
		$("header").addClass("active");
		$("#fake-header-open").addClass("active");
	}
	$("header .search-wrapper").removeClass("active");
	if ($currentSlide.is(":first-child")) {
		$("#back-to-top").removeClass("active");
		$("#facebook").removeClass("active");
	}
	if (currentSlideNumber == 1 && $(".full-page").length >= 1) {
		$("#back-to-top").addClass("active");
		$("#facebook").addClass("active");
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
	if ($(".full-page").length >= 1) {
		$("#back-to-top").addClass("active");
		$("#facebook").addClass("active");
	}
	$("#fake-header-open").removeClass("last");
	if ($currentSlide.is(":first-child") && $(".full-page").length >= 1) {
		$("#back-to-top").removeClass("active");
		$("#facebook").removeClass("active");
		$("header").removeClass("active");
		$("#fake-header-open").removeClass("active");
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
	window.addEventListener("scroll", function () {
		var bannerheight = $("#pagebanner").outerHeight();
		var heightHeader = $("header").outerHeight();
		if (
			window.pageYOffset > bannerheight + heightHeader &&
			$(".full-page").length == 0
		) {
			$("#back-to-top").addClass("active");
			$("#facebook").addClass("active");
		} else {
			$("#back-to-top").removeClass("active");
			$("#facebook").removeClass("active");
		}
	});
	if ($(".full-page").length >= 1) {
		$("#back-to-top").on("click", function () {
			currentSlideNumber = 0;
			$("section").removeClass("down-scroll");
			$(".home-page-banner").addClass("current-page");
			$("header").removeClass("active");
			$("#fake-header-open").removeClass("active");
		});
	} else {
		$("#back-to-top").on("click", function (e) {
			e.preventDefault();
			$("html,body").animate({
				scrollTop: 0,
			});
			$("#back-to-top").removeClass("active");
			$("#facebook").removeClass("active");
		});
	}
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
	var myswiper = new Swiper(".banner-wrapper .swiper-container", {
		loop: false,
		speed: 2000,
		effect: "fade",
		grabCursor: true,
		autoplay: {
			delay: 3000,
			disableOnInteraction: false,
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
		slidesPerColumnFill: "row",
		slidesPerGroup: 6,
		spaceBetween: 30,
		grabCursor: false,
		navigation: {
			nextEl: ".swiper-column .wrap-button .button-next",
			prevEl: ".swiper-column .wrap-button .button-prev",
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
	var listTin = new Swiper(".kv-swiper .swiper-container", {
		spaceBetween: 75,
		loop: true,
		speed: 1000,
		parallax: true,
		watchSlidesProgress: true,
		navigation: {
			nextEl: ".kv-swiper .swiper-button-next",
			prevEl: ".kv-swiper .swiper-button-prev",
		},
		// breakpoints: {
		// 	1200: {
		// 		slidesPerView: 4,
		// 		spaceBetween: 30,
		// 	},
		// 	991: {
		// 		slidesPerView: 3,
		// 		spaceBetween: 30,
		// 	},
		// 	575: {
		// 		slidesPerView: 2,
		// 		spaceBetween: 15,
		// 	},
		// 	375: {
		// 		slidesPerView: 1,
		// 		spaceBetween: 10,
		// 	},
		// },
	});
}

function menuFake() {
	let menuleft = $("header .main-nav .left-nav .navbar-nav .nav-item");
	let menuright = $("header .main-nav .right-nav .navbar-nav .nav-item");
	let footer = $(".footer");
	menuleft.clone().appendTo("#fake-header .menu-fake-header");
	menuright.clone().appendTo("#fake-header .menu-fake-header");
	var e = $("header .main-list-wrapper").html();
	$("#fake-header").append(e);
	$("#fake-header-open").on("click", function () {
		$("#fake-header").addClass("active");
	});
	$("#fake-header .close-button").on("click", function () {
		$("#fake-header").removeClass("active");
	});
	if ($(".full-page").length >= 1) {
		footer.appendTo(".full-page .home-page-6");
	} else {
		footer.appendTo("footer");
	}
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

function category() {
	if ($(window).width() <= 991 && ".zone-nav".length >= 1) {
		$(".zone-nav .categroly .box-category").on("click", function (x) {
			x.stopPropagation();
			$(".zone-nav .categroly").toggleClass("active");
			$(".zone-nav .box-category .material-icons").toggleClass("active");
		});
		window.addEventListener("scroll", function () {
			$(".zone-nav .categroly").removeClass("active");
			$(".zone-nav .categroly")
				.find(".material-icons")
				.removeClass("active");
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
		window.addEventListener("scroll", function () {
			var bannerheight = $("#pagebanner").outerHeight();
			if (window.pageYOffset > bannerheight) {
				document.querySelector(".zone-nav").classList.add("scolled");
			} else {
				document.querySelector(".zone-nav").classList.remove("scolled");
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
			}
		});
	}
}
const checkLayoutBanner = () => {
	const pagesBanner = $("#pagebanner");
	const heightHeader = $("header").outerHeight();
	const mainBanner = $("#home-banner");
	if (mainBanner.length >= 1) {
		$("main").css("padding-top", 0);
	} else if (pagesBanner.length >= 1) {
		$("main").css("padding-top", heightHeader);
	} else {
		$("main").css("padding-top", heightHeader);
	}
};

function checkFullpage() {
	if ($(".full-page").length >= 1) {
		$("body").toggleClass("overflow-hidden");
	}
	if ($(window).width() < 1200) {
		$("body").removeClass("overflow-hidden");
		$(".full-page .home-page-6").toggleClass("active");
	}
}

function initMapping() {
	$("header .main-nav .navbar-brand").mapping({
		mobileWrapper: "header .main-nav-mobile",
		mobileMethod: "appendTo",
		desktopWrapper: "header .main-nav",
		desktopMethod: "appento",
		breakpoint: 991.98,
	});
	$("header .main-nav .right-nav .header-icon").mapping({
		mobileWrapper: "header .main-nav-mobile",
		mobileMethod: "appendTo",
		desktopWrapper: "header .main-nav .right-nav",
		desktopMethod: "appento",
		breakpoint: 991.98,
	});
	$("header .main-nav .left-nav .navbar-nav .nav-item").mapping({
		mobileWrapper: "header .main-nav-mobile .navbar-mobile",
		mobileMethod: "appendTo",
		desktopWrapper: "header .main-nav .left-nav .navbar-nav",
		desktopMethod: "appento",
		breakpoint: 991.98,
	});
	$("header .main-nav .right-nav .navbar-nav .nav-item").mapping({
		mobileWrapper: "header .main-nav-mobile .navbar-mobile",
		mobileMethod: "appendTo",
		desktopWrapper: "header .main-nav .right-nav .navbar-nav",
		desktopMethod: "appento",
		breakpoint: 991.98,
	});
}
const toggleMenuMobile = () => {
	$(".kv-toggle").on("click", function () {
		$(this).toggleClass("active");
		$(".navbar-mobile").toggleClass("active");
		$("#overlay").toggleClass("active");
	});
	$("#overlay").on("click", function () {
		$(this).removeClass("active");
		$(".kv-toggle").removeClass("active");
		$(".navbar-mobile").removeClass("active");
	});
	$(".search-icon").on("click", function () {
		$("#search-box").slideToggle();
	});
	$("main").on("click", function () {
		$("#search-box").slideUp();
	});
};
const InsertBd = () => {
	$(".breadcrumb-wrapper").appendTo("#pagebanner .box-text");
};
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
	initMapping();
	toggleMenuMobile();
	category();
	checkLayoutBanner();
	InsertBd();
	//Image map tool
	//Map high light
	$(".image-map-wrapper img[usemap]").maphilight({
		fillColor: "3b5a56",
		fillOpacity: 0.7,
		stroke: true,
		strokeColor: "ffcb04",
		strokeCopacity: 1,
		strokeWidth: 2,
		fade: true,
		alwaysOn: false,
		neverOn: false,
		groupBy: false,
		wrapClass: true,
		shadow: false,
		shadowX: 0,
		shadowY: 0,
		shadowRadius: 6,
		shadowColor: "000000",
		shadowOpacity: 1,
		shadowPosition: "outside",
		shadowFrom: false,
	});
	$(".image-map-wrapper img[usemap]").rwdImageMaps();
});
