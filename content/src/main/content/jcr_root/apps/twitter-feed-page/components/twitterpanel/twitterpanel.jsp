<%--

  Twitter Panel component.

  This is Pearson UK a twitter  panel component

--%><%
%><%@include file="/libs/foundation/global.jsp"%>

<%--/apps/ped/pei/uk/pearson-uk/global.jsp--%>

<%@page session="false" %><%
%>
<%
// Get Twitter feeds
String[] accounts= properties.get("accounts", String[].class);

if (accounts!= null) {
    String twitterAccounts= "";
    int count = 0;
    for (String account: accounts) { 
        if(account != null && account.length() > 0){      
            twitterAccounts += (count == 0) ? account.trim() : "," + account.trim();
            count++;
        }
    }
%>
<section class="panel" id="twitter-feed" data-scroll="true" data-twitter-accounts='<%=twitterAccounts%>' data-tweet-count='10'>
    <p class="loading">Loading...</p>
</section>
<%        
}
else{
    out.write("<div>[Add Twitter accounts here]</div>");
}
%>



