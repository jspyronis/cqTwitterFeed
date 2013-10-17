<%@page session="false"%><%@ page import="com.day.cq.i18n.I18n, java.util.Calendar" %>
<%--
  Copyright 1997-2011 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Default footer script.

  ==============================================================================

--%><%
%><%@include file="/libs/foundation/global.jsp" %><%
    I18n i18n = new I18n(slingRequest);
    int year = Calendar.getInstance().get(Calendar.YEAR);
%>
<div class="footer container_16">
	<div class="clear"></div>
</div>
