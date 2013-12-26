<%-- 
    Document   : maps
    Created on : 19 déc. 2013, 13:31:10
    Author     : giuse_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" type="image/ico" href="" />
        <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/hotel.css">
        <title>Maps hotels</title>
    </head>
    <style type="text/css">

    </style>
    <body>

        <div class="container">

            <div>
                <ul class="nav nav-pills pull-right">
                    <li><a href="index.html">Home</a></li>
                    <li  class="active"><a href="maps.html">Maps</a></li>
                    <li><a href="#">SVG</a></li>
                </ul>
                <h3 class="muted">Project XML</h3>
            </div>

            <hr>
            <div id="cadre">
                <div id="map">
                    <p>Veuillez patienter pendant le chargement de la carte...</p>
                </div>
            </div>

            <%=session.getAttribute("mapsresult")%>

            <hr>

            <div class="footer">
                <p>&copy; MIAGE 2013</p>
            </div>
        </div>
        <!-- Include Javascript -->
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgfQp0OgUsZoCHHq5as2jCEWBDsJOYHWU&sensor=false"></script>
        <script type="text/javascript" charset="utf-8" language="javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="js/maps.js"></script>
    </body>
</html>