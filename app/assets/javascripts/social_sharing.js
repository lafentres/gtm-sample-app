var shareUrl, shareTitle, shareImage, shareDate, shareFormattedDate, shareDescription,
    shareAuthor, shareCategory, shareId, shareChannel, shareDetails;

var shareInit = function(e) {
    var shareContainer = $(e.target);
    var itemContainer = $(shareContainer.parents('.js-share-item'));

    shareUrl = itemContainer.data('url');
    shareTitle = itemContainer.data('title');
    shareImage = itemContainer.data('image');
    shareFormattedDate = itemContainer.data('formatted-date');
    shareDescription = itemContainer.data('description');
    shareAuthor = itemContainer.data('author');
    shareCategory = itemContainer.data('category');

    shareDescription = shareDescription.length > 0 ? shareDescription : shareFormattedDate;

    return shareExec(e);
};


var shareExec = function(e) {
    var shareLink = e.currentTarget;
    var shareName = $(shareLink).attr('class').split(' ')[0];
    var channel;

    console.log(shareLink);
    console.log(e);

    switch (shareName) {
        case 'js-facebook':
            var openLink = 'https://www.facebook.com/sharer/sharer.php?'
                + 'u=' + encodeURIComponent(shareUrl);
            channel = 'facebook';
            break;

        case 'js-twitter':
            var openLink = 'https://twitter.com/share?'
                + 'text=' + encodeURIComponent(shareTitle)
                + '&url=' + encodeURIComponent(shareUrl);
            channel = 'twitter';
            break;
    }

    var winId = Math.floor(Math.random() * (1000000 - 0)) + 0;
    var winWidth    = 650;
    var winHeight   = 450;
    var winLeft     = ($(window).width()  - winWidth)  / 2;
    var winTop      = ($(window).height() - winHeight) / 2;
    var winOptions   = 'width=' + winWidth + ',height=' + winHeight + ',top=' + winTop + ',left=' + winLeft;

    window.open(openLink, winId, winOptions);

    shareTrack(e, channel);

    return false;
};

var shareTrack = function(e, channel) {
    var itemContainer = $(e.target).parents('.js-share-item');
    shareChannel = channel;

    shareId = itemContainer.data('id');
    shareUrl = itemContainer.data('url');
    shareDate = itemContainer.data('date');
    shareAuthor = itemContainer.data('author');
    shareCategory = itemContainer.data('category');
    shareTitle = itemContainer.data('title');

    shareDetails = {
        'postTitle': shareTitle,
        'postAuthor': shareAuthor,
        'postCategory': shareCategory,
        'postPublishDate': shareDate,
        'postId': shareId.toString()

    };

    GA_trackShare(shareChannel, shareUrl, shareDetails);
};
