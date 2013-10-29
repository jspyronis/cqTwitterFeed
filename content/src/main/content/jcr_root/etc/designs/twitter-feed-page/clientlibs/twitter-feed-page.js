(function($) {


    $(function() {

        var tweets = $("#twitter-feed");
        var twitterAccounts = tweets.attr("data-twitter-accounts");
        var tweetcount = tweets.attr("data-tweet-count");

        var arrayTwitterAccounts = twitterAccounts.split(",");


        if(typeof(twitterAccounts) != 'undefined' && twitterAccounts.length > 0 ) {

            $.ajax({
                url: '/bin/twitterServlet',
                data: {arrayTwitterAccounts : arrayTwitterAccounts},
                dataType: 'json',
                success: function(data) {
                    // loop around the result
                    $(".loading", tweets).remove();
                    var rescount = data['results'].length;
                    for (var res=0 ; res< data['results'].length; res++) {
                        var text = data['results'][res]['text'];
                        var from_user = data['results'][res]['user']['name'];
                        var user_screenName = data['results'][res]['user']['screenName'];
                        var created_at = $.timeSinceTweet(data['results'][res]['createdAt']);
                        var id_str = data['results'][res]['id'];
                        var profile_image_url = data['results'][res]['user']['profileImageUrl'];
                        //Tidy up the text by adding hyperlinks and the date posted
                        text = text.replace(/((ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?)/gi,'<a href="$1">$1</a>')
                                .replace(/(^|\s)#(\w+)/g,'$1<a href="http://search.twitter.com/search?q=%23$2">#$2</a>')
                                .replace(/(^|\s)@(\w+)/g,'$1<a href="http://twitter.com/$2">@$2</a>');

                        text = text + '<br /><a href="http://www.twitter.com/' + user_screenName + '/status/' + id_str + '" class="datelink" target="_blank">' + created_at + '</a></div>';
                        var html = "<article>";
                        html += "<header>";
                        html += "<img src=\"" + profile_image_url + "\" alt=\"" + user_screenName + " avatar\" />";
                        html += "<h1>" + from_user + "</h1>";
                        html += "<h2>" + "@" + user_screenName + "</h2>";
                        html += "</header>";

                        var dateOfTweet = data['results'][res]['createdAt'];
                        html += "<p>" + text + "</p>";

                        var newDate = new Date(dateOfTweet);
                        var formatDate = newDate.format("d m y");



                        html += "<p>" + newDate.getMonth() + "</p>";

                        html += "</article>";
                        tweets.append(html);
                        // After last tweet added call inner scroll function

                        if(res == (rescount -1)) {
                            if (tweets.is("[data-scroll=true]")) {
                                tweets.slimScroll({
                                    height: '350px'
                                });
                            }
                        }


                    }
                }
            });
        }

    });


})($CQ || $);

(function($) {
    $.timeSinceTweet = function(time) {
        var date = new Date(time);
        var diff = ((new Date()).getTime() - date.getTime()) / 1000;
        var day_diff = Math.floor(diff / 86400);
        if (day_diff < 0 || day_diff >= 31 || isNaN(day_diff)) {
            return "View tweet";
        }
        if(day_diff == 0) {
            if(diff < 60) {
                return Math.ceil(diff) + " seconds ago";
            }
            else if(diff < 120) {
                return "1 minute ago";
            }
            else if(diff < 3600) {
                return Math.floor( diff / 60 ) + " minutes ago";
            }
            else if(diff < 7200) {
                return "1 hour ago";
            }
            else if(diff < 86400) {
                return Math.floor( diff / 3600 ) + " hours ago";
            }
        }
        if(day_diff == 1) {
            return "Yesterday";
        }
        else if(day_diff < 7) {
            return day_diff + " days ago";
        }
        else if(day_diff < 31) {
            return Math.ceil( day_diff / 7 ) + " weeks ago";
        }
        else {
            return "View Tweet";
        }
    }
})(jQuery);