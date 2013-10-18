(function($) {


    $(function() {

        var urlGetTweets = '/bin/twitterServlet';

        $.ajax({
            url : urlGetTweets,
            dataType : 'json',

            error : function(){
                alert("Error when fetching tweets occured");
            },

            success : function(data) {
                $('.getTweets').append("<ul>");
                $.each(data, function(index) {
                    $('.getTweets').append("<li>"+data[index]+"</li>");
                });
                $('.getTweets').append("</ul>");
            }

        });

    });


})($CQ || $);