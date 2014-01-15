<%-- 
    Document   : maps
    Created on : 19 déc. 2013, 13:31:10
    Author     : MoMoGaGa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" type="image/ico" href="css/hotel.jpg" />
        <link rel="stylesheet" type="text/css" href="css/template.css"/>
        <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/hotel.css">

        <title>Hotel Charts</title>
    </head>
    <style type="text/css">

    </style>
    <body>

        <div class="container">

            <div>
                <ul class="nav nav-pills pull-right">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="maps.html">Maps</a></li>
                    <li class="active"><a href="svg.html">SVG</a></li>
                </ul>
                <h3 class="text-muted">Project XML</h3>
            </div>

            <hr> 

            <object type="image/svg+xml" data="pie.html"></object>
            <hr>
            <object type="image/svg+xml" data="bar.html"></object>
            <hr>
            <object type="image/svg+xml" data="line.html"></object>
            <br />
            <input class="form-control btn btn-info" name="pdf" value="Télécharger en pdf" onclick="location='http://localhost:8080/XMLproject/ServletFOP'"/>
            <br />
            <div class="footer">
                <p>&copy; MIAGE 2013</p>
            </div>
        </div>
        <!-- Include Javascript -->


        <script type="text/javascript" src="lib/jquery-1.10.2.js"></script>


    </body>
</html>