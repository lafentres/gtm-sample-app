// Social sharing
var GA_trackShare = function (channel, eventUrl, shareDetails) {
    var eventData = {
        'event': 'social-share',
        'socialNetwork': channel.toLowerCase(),
        'eventUrl': eventUrl
    };

    console.log(shareDetails);

    if(typeof shareDetails !== 'undefined'){
        Object.keys(shareDetails).forEach(function(key) {
            eventData[key] = shareDetails[key].toLowerCase();
        });
    }

    window.dataLayer.push(eventData);
};

// Likes
var GA_trackLike = function (eventLabel, eventUrl, likeDetails) {
    var eventData = {
        'event': 'like',
        'eventLabel': eventLabel.toLowerCase(),
        'eventUrl': eventUrl.toLowerCase()
    };

    if(typeof likeDetails !== 'undefined'){
        Object.keys(likeDetails).forEach(function(key) {
            eventData[key] = likeDetails[key].toLowerCase();
        });
    }

    window.dataLayer.push(eventData);
};

// Virtual Pageview
var GA_trackVirtualPageview = function (virtualUrl, virtualTitle) {
    window.dataLayer.push({
        'event': 'virtual-pageview',
        'virtualUrl': virtualUrl,
        'virtualTitle': virtualTitle
    });
};

$(document).ready(function () {
    // Registration
    if($('.js-event-registration').length > 0) {
        var regEvent = $('.js-event-registration');
        window.dataLayer.push({
            'event': 'registration',
            'status': regEvent.data('event-registration-status').toLowerCase(),
            'userType': regEvent.data('event-registration-user-type').toLowerCase(),
            'userId': regEvent.data('event-registration-user-id'),
            'registrationMethod': regEvent.data('event-registration-method').toLowerCase(),
            'registrationError': regEvent.data('event-registration-error').toLowerCase()
        });
        // Remove element from dom
        $('.js-event-registration').remove();
    }


    // Login
    if($('.js-event-login').length > 0) {
        var loginEvent = $('.js-event-login');
        window.dataLayer.push({
            'event': 'login',
            'status': loginEvent.data('event-login-status').toLowerCase(),
            'userType': loginEvent.data('event-login-user-type').toLowerCase(),
            'userId': loginEvent.data('event-login-user-id'),
            'loginMethod': loginEvent.data('event-login-method').toLowerCase(),
            'loginError': loginEvent.data('event-login-error').toLowerCase()
        });
        // Remove element from dom
        $('.js-event-login').remove();
    }


    // Form field change
    if($('.js-event-form-field').length > 0){
        $('.js-event-form-field').on('change', function(e){
            window.dataLayer.push({
                'event':'form-field-change',
                'fieldName': $(e.target).data('event-form-field-value').toLowerCase()
            });
            $(e.target).off('change');
        });
    }
});