<%@page session="false"%><%--
  Copyright 1997-2008 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Twitter Box component.

  Draws a box for displaying tweets of user.

--%><%@include file="/libs/foundation/global.jsp"%>

<%
    String title = properties.get(NameConstants.PN_TITLE, String.class);
    String maxNumberTweets = properties.get("maxNumberTweets", String.class);
    String idComponent =  currentNode.getIdentifier();

    if (title == null || title.equals("")) {
        title = "Twitter Feed";
    }

    String tweetType = properties.get("typeOfTweet", String.class);
%>

<div id="<%=currentNode.getIdentifier()%>" class="twitterFeedArea">
    <div class="twitterFeedTitle">
        <cq:text property="jcr:title" value="<%= title %>" escapeXml="true"/>
    </div>
    <div class="getTweets"></div>

    <script>

        var urlGetTweets = "/bin/twitterServlet?typeOfTweet=" + "<%= tweetType %>";
        var showTweetsDiv = $('#'+'<%= idComponent %>'+' .getTweets');

        $.ajax({
            url : urlGetTweets,
            dataType : 'json',
            async: false,
            error : function(){
                alert("Error when fetching tweets occured");
            },

            success : function(data) {

                var maxNumberTweets = "<%= maxNumberTweets %>";
                if (maxNumberTweets > data.length){
                    maxNumberTweets = data.length;
                }
                $(showTweetsDiv).append("<ul>");
                for (var i=0; i<maxNumberTweets ; i++){
                    $(showTweetsDiv).append("<li>"+data[i]+"</li>");
                }
                $(showTweetsDiv).append("</ul>");
            }
        });
    </script>
</div>
<div class="clear"></div>