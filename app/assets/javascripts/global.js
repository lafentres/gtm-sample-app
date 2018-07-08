$(function() {

    if ($('.js-url-update').length > 0) {
        // Initializes popstate event listener and initial history api push
        historyApiInit();

        // Initializes event listeners to update urls and titles on scroll
        updateUrlInit();
    }

    if ($(".js-infinite-scroll-link").length > 0) {
        var buttons = $(".js-infinite-scroll-link");

        var curButton;
        for (var i = 0; i < buttons.length; i++) {
            curButton = buttons[i];
            inView('#' + curButton.id).on('enter', function (e) {
                $(e)[0].click();
            });
        }
        buttons.removeClass("js-infinite-scroll-link");
    }


    $('.js-share-button').on("click", shareInit);
});