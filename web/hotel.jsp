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

        <link rel="stylesheet" type="text/css" href="css/hotel.css"/>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="lib/bootstrapNew/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="lib/bootstrapNew/css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="css/hotelSimple.css"/>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="lib/bootstrapNew/js/bootstrap.min.js"></script>
        
        <script>

                    $('#myCarousel').carousel()

            })
        </script>
    </head>
    <body>


        <div class="container">
            <div>
                <ul class="nav nav-pills pull-right">
                    <li class="active"><a href="index.html">Home</a></li>
                    <li><a href="maps.html">Maps</a></li>
                    <li><a href="#">SVG</a></li>
                </ul>
                <h3 class="muted">Project XML</h3>
            </div>
            <%=request.getAttribute("hotelresult")%>

            <div class="footer">
                <p>&copy; MIAGE 2013</p>
            </div>
        </div>

        <!-- Include Javascript -->
        <script type="text/javascript" charset="utf-8" language="javascript" src="lib/datatables/media/js/jquery.js"></script>
        <script type="text/javascript" charset="utf-8" language="javascript" src="lib/datatables/media/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf-8" language="javascript" src="js/hotel.js"></script>
        <script>
                                $(window).load(function() {
                        Pizza.init();
                        })
        </script>

        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgfQp0OgUsZoCHHq5as2jCEWBDsJOYHWU&sensor=false"></script>
        <script type="text/javascript" charset="utf-8" language="javascript" src="lib/jquery-1.10.2.js"></script>
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

    </body>
</html>
