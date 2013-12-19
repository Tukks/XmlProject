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
        <title>Google Maps Api v3</title>
    </head>
    <style type="text/css">
        #container{position:relative;width:990px;margin:auto;}
        #container #map{width:500px;height:500px;margin:auto;}
    </style>
    <body>
        <div id="container">
            <div id="map">
                <p>Veuillez patienter pendant le chargement de la carte...</p>
            </div>
        </div>

        <!-- Include Javascript -->
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgfQp0OgUsZoCHHq5as2jCEWBDsJOYHWU&sensor=false"></script>
        <script type="text/javascript" src="./mapsInit.js"> //A mettre dans mapsInit, un jour 
           
        </script>
    </body>
</html>