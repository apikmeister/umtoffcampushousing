$(window).scroll(() => {
    if ($(window).scrollTop()) {
        $("header").addClass("purple")
    } else {
        $("header").removeClass("purple")
    }
})