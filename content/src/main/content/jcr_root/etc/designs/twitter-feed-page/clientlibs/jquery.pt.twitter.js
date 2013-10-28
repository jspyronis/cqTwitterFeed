/**
 * PT Twitter Component Script
 * claire.kewin@pearson.com
 * 04/02/2013
 */
 
 
(function ($) {

    jQuery.fn.searchTwitter = function () {
    
        //return this.each(function () {

            var tweets = $(this);
            var twitterAccounts = tweets.attr("data-twitter-accounts");
            var tweetcount = tweets.attr("data-tweet-count");
            
            if(typeof(twitterAccounts) != 'undefined' && twitterAccounts.length > 0 ) {
             
                var arr = twitterAccounts.split(",");
                var query = "";
                for (i=0;i<arr.length;i++) {
                    query = query + "from:" + arr[i] + " OR ";
                }
                query = query.substring(0,(query.length - 4));
                var params = {
                    q: query,
                    rpp: tweetcount,
                    callback: '?'
                };
        
                $.ajax({
                    url: 'http://search.twitter.com/search.json?' + jQuery.param(params),
                    dataType: 'jsonp',
                    success: function(data) {
                        // loop around the result
                        $(".loading", tweets).remove();
                        rescount = data['results'].length;
                        for (res in data['results']) {
                            var text = data['results'][res]['text'];
                            var from_user = data['results'][res]['from_user'];
                            var created_at = $.timeSinceTweet(data['results'][res]['created_at']);
                            var id_str = data['results'][res]['id_str'];
                            var profile_image_url = data['results'][res]['profile_image_url'];
                            //Tidy up the text by adding hyperlinks and the date posted
                            text = text.replace(/((ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?)/gi,'<a href="$1">$1</a>')
                                        .replace(/(^|\s)#(\w+)/g,'$1<a href="http://search.twitter.com/search?q=%23$2">#$2</a>')
                                        .replace(/(^|\s)@(\w+)/g,'$1<a href="http://twitter.com/$2">@$2</a>');
                            text = text + '<br /><a href="http://www.twitter.com/' + from_user + '/status/' + id_str + '" class="datelink" target="_blank">' + created_at + '</a></div>';
                            var html = "<article>";
                           html += "<header>";
                            html += "<img src=\"" + profile_image_url + "\" alt=\"" + from_user + " avatar\" />";
                            html += "<h1>" + from_user + "</h1>";
                            html += "</header>";
                            html += "<p>" + text + "</p>";
                            html += "</article>";
                            tweets.append(html);
                            // After last tweet added call inner scroll function
                                                        
                            if(res == (rescount -1)) {
                                if (tweets.is("[data-scroll=true]")) {
                                    tweets.cjInnerScroll({
                                        minHeight: '350'
                                    });
                                }
                            }
                         }
                    }
                });
            }
        //}
    }
})(jQuery);


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