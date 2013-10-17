<%@page session="false"%><%--
  Copyright 1997-2011 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Header script.

  Draws the top header and shows an example of how to include a cacheable
  navigation by using a script include. see page/topnav.jsp for more details.
  Note that the topnav script is included as .html so that it is flushed on the
  dispatcher on invalidation requests.

  ==============================================================================

--%><%@ page import="com.day.cq.commons.Doctype, com.day.cq.i18n.I18n, com.day.text.Text" %><%
%><%@include file="/libs/foundation/global.jsp" %><%
    I18n i18n = new I18n(slingRequest);

    int absLevel = 2;
    Page homePage = currentPage.getAbsoluteParent(absLevel);
    String home = homePage != null ? homePage.getPath() : Text.getAbsoluteParent(currentPage.getPath(), absLevel);
    String xs = Doctype.isXHTML(request) ? "/" : "";
    long hierMod = sling.getService(com.day.cq.wcm.foundation.HierarchyModificationListener.class).getLastModified(home);

%><div class="header">
    
</div>
