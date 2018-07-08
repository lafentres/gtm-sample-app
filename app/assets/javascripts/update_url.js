// Only necessary on initial pageload
// Initializes popstate event listener and initial history api push
var historyApiInit = function () {
    var firstBlock = $('.js-url-update');
    history.replaceState({
        id: firstBlock.attr('id'),
        title: document.title
    }, document.title, '');

    window.addEventListener('popstate', function(e) {
        var state = e.state;
        if (state) {
            var blockElement = $("#" + state.id);
            if (blockElement.length > 0) {
                $('html, body').animate({
                    scrollTop: (blockElement.offset().top)
                }, 75);
                if (document.title !== state.title) {
                    document.title = state.title;
                }
                GA_trackVirtualPageview(window.location.pathname + window.location.search, document.title);
            }
        }
    });
};

// Initializes event listeners to update urls and titles on scroll
var updateUrlInit = function () {
    // Elements with .js-url-update class need to have:
    // data-url, data-title, and a unique id
    var urlUpdateContainers = $('.js-url-update');
    var curUrlContainer;
    for (var i = 0; i < urlUpdateContainers.length; i++) {
        curUrlContainer = urlUpdateContainers[i];
        inView('#' + curUrlContainer.id).on('enter', function(e) {
            var curPath = window.location.pathname + window.location.search;
            var newPath = $(e).data('url');
            var curTitle = document.title;
            var newTitle = $(e).data('title');
            var newState = {
                id: e.id,
                title: newTitle
            };

            if (curPath !== newPath && curTitle !== newTitle) {
                history.pushState(newState, newTitle, newPath);
                document.title = newTitle;
                GA_trackVirtualPageview(newPath, newTitle);
            }
        });
    }
    $('.js-url-update').removeClass('js-url-update');
};


var updateUrl = function (newPath, newTitle, id) {
    var curPath = window.location.pathname + window.location.search;
    var curTitle = document.title;
    var newState = {id: id, title: newTitle};

    if(curPath !== newPath && curTitle !== newTitle){
        history.pushState(newState, newTitle, newPath);
        document.title = newTitle;
        GA_trackVirtualPageview(newPath, newTitle);
    }
};
