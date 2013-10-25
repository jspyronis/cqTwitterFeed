<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>
 
<!-- Pick up the client libraries  -->
<cq:includeClientLib categories="ajaxsamples" />
 
<script type="text/javascript">
 
/* Grab the JCR path to the content entry that calls this component
 * with Sling, you cannot call a script, you must call the jcr content
 * node that resolves to the representation (script).
 */
var baseURL = "<%= currentNode.getPath() %>";
 
jQuery(function ($) {
 
    $('.useraccount-table').flexigrid({
        url: baseURL + '.json', // this will trigger the JSON selector in Sling
        dataType: 'json', // NOTE: Flexigrid executes a POST, not GET to retrieve data
        colModel : [ {
            display : 'User ID', name : 'id', width : 215, sortable : true, align : 'left', hide: false
        }, {
            display : 'First Name', name : 'givenName', width : 100, sortable : true, align : 'left', hide: false
        }, {
            display : 'Last Name', name : 'familyName', width : 100, sortable : true, align : 'left', hide: false
        },{
            display : 'Email', name : 'email', width : 215, sortable : true, align : 'left', hide: false
        }],
        buttons : [
                                      /*
            {name: 'Add', bclass: 'add', onpress : test},
            {name: 'Edit', bclass: 'edit', onpress : test},
            {name: 'Delete', bclass: 'delete', onpress : test},
            {separator: true}

*/
            ],
       searchitems : [
            {display: 'User ID', name : 'user_id',isdefault: true},
            {display: 'First Name', name : 'givenName'},
            {display: 'Last Name', name : 'familyName'}
            ],
        sortname: "id",
        sortorder: "asc",
        usepager: true,
        title: "Cool Grid from CQ5",
        useRp: true,
        rp: 15,
        showTableToggleBtn: false,
        singleSelect: true,
        width: 700,
        height: 200
    });
});
 
function test() {
    alert("Not implemented yet.");
}
 
</script>
 
<!-- Rendered by Flexigrid jQuery plugin -->
<table class="useraccount-table"></table>

<br>
