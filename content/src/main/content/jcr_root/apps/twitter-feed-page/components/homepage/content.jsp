<%@page session="false"%><%--
  Copyright 1997-2009 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Default content script.

  Draws the HTML content.

  ==============================================================================

--%>
<%@include file="/libs/foundation/global.jsp" %>
<div id="main">
    <div class="container_16">
        <div class="grid_12 body_container">
            <cq:include path="par" resourceType="foundation/components/parsys"/>
            <div id="twitterFeedArea">
                Twitter feed area:
                <div class="getTweets">
            </div>

        </div>
        <div class="clear"></div>
    </div>
</div>

