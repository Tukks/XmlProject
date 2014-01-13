<%-- 
    Document   : hotel
    Created on : 23 déc. 2013, 15:39:09
    Author     : Nicolas
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />

        <title>Hotel</title>

        <link rel="shortcut icon" type="image/ico" href="">
        
        <link rel="stylesheet" type="text/css" href="css/template.css"/>
        <link rel="stylesheet" type="text/css" href="css/hotel.css"/>
        <link rel="stylesheet" type="text/css" href="css/map.css"/>
        <link rel="stylesheet" type="text/css" href="css/hotelSimple.css"/>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="lib/bootstrap/css/bootstrap-theme.min.css">       

    </head>
    <body>
        <div class="container">
            <div>
                <ul class="nav nav-pills pull-right">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><a href="maps.html">Maps</a></li>
                    <li><a href="chart.html">SVG</a></li>
                </ul>
                <h3 class="text-muted">Project XML</h3>
            </div>
            
            <hr>
            
            <%=request.getAttribute("hotelresult")%>

            
            <div class="footer">
                <p>&copy; MIAGE 2013</p>
            </div>
        </div>

        <!-- Include Javascript -->
        <script src="lib/jquery-1.10.2.js"></script>
        <script src="lib/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgfQp0OgUsZoCHHq5as2jCEWBDsJOYHWU&sensor=false"></script>
        <script type="text/javascript" src="js/maps.js"></script>
        <script language="javascript">
            var latitude = new Array();
            var longitude = new Array();
            var hotelInfo = new Array();
            <% float[] coorJava = (float[]) request.getAttribute("hotelcoor");

            %>
            longitude[0] = '<%= coorJava[0]%>'; //--> without this doesnt work
            latitude[0] = '<%= coorJava[1]%>'; //--> without this doesnt work

            <%
            %>
            init(latitude, longitude, hotelInfo, 0);
            google.maps.event.trigger(map, 'resize')

        </script>

        <script>
            $('#myCarousel').carousel()
        </script>
    </body>
</html>
