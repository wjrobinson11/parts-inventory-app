$(".box-preview .icon-close").click(function() {
    $(".box-preview").hide()
});
$(".menu-toggle").click(function() {
    $("body").toggleClass("is-in")
});
$(window).scroll(function() {
    $(this).scrollTop() > 170 ? $(".icon-top").fadeIn() : $(".icon-top").fadeOut()
});
$(function() {
    $(".anchor-link").click(function() {
        if (location.pathname.replace(/^\//, "") == this.pathname.replace(/^\//, "") && location.hostname == this.hostname) {
            var n = $(this.hash);
            if (n = n.length ? n : $("[name=" + this.hash.slice(1) + "]"), n.length) return $("html,body").animate({
                scrollTop: n.offset().top
            }, 1e3), !1
        }
    })
})