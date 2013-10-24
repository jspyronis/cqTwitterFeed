<%--

 Google Map component.
 NA
--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %>
<%
            String searchLoc= properties.get("address","");     
%>

<!DOCTYPE html>

            <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
            <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
            <script type="text/javascript">
            
            function initialize() {
            
            var geocoder = new google.maps.Geocoder();
            var address = '333 Camden Road, London N7 0SL, UK' ;
            alert(address);
            geocoder.geocode( { 'address': address}, function(results, status)
            {

                if (status == google.maps.GeocoderStatus.OK)
            {
                        var latitude = results[0].geometry.location.lat();
                        var longitude = results[0].geometry.location.lng();
                        alert(latitude);
                        alert(longitude);
                        var latlng = new google.maps.LatLng(latitude,longitude);
                        var myOptions = {
                        zoom: 10,
                        center: latlng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
                        
                  var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
                        
                        var myMarker = new google.maps.Marker({ position: latlng, map: map, title:"About.com Headquarters" });
                        
            }
            });
            return true;
            
            }           
            
            </script>

 <div>Google Map</div>
 <div id="map_canvas" style="width:300px; height:300px;"></div>
 <script type="text/javascript">
            initialize();      /// call Java script function automatically...
   
 </script>
