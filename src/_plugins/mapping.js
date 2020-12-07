! function (t) {
    t.fn.mapping = function (e) {
        var i = t.extend({}, {}, e),
            n = {
                selector: t(this),
                department: "",
                destination: "",
                from: function (e) {
                    try {
                        return this.department = t(e), this
                    } catch (t) {}
                },
                to: function (e) {
                    try {
                        return this.destination = t(e), this
                    } catch (t) {}
                },
                use: function (t) {
                    try {
                        switch (t) {
                            case "appendTo":
                                this.department.appendTo(this.destination);
                                break;
                            case "prependTo":
                                this.department.prependTo(this.destination);
                                break;
                            case "insertAfter":
                                this.department.insertAfter(this.destination);
                                break;
                            case "insertBefore":
                                this.department.insertBefore(this.destination)
                        }
                    } catch (t) {}
                }
            };
        return this.switch = function (t) {
            t.matches ? n.from(n.selector).to(i.mobileWrapper).use(i.mobileMethod) : n.from(n.selector).to(i.desktopWrapper).use(i.desktopMethod)
        }, this.initialize = function () {
            var t = window.matchMedia("(max-width: " + i.breakpoint + "px)");
            return this.switch(t), t.addListener(this.switch), this
        }, this.initialize()
    }
}(jQuery);

// $('selector').mapping({
//     mobileWrapper: '.header .mobile-wrapper',
//     mobileMethod: 'appendTo',
//     desktopWrapper: '.header .desktop-wrapper',
//     desktopMethod: 'appendTo',
//     breakpoint: 1025
// })