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
                $.each(data, function(index) {
                    $('.getTweets').append("<p>"+data[index]+"</p>");
                });
            }

        });

    });


})($CQ || $);