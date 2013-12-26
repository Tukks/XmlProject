<%-- 
    Document   : index
    Created on : 2 déc. 2013, 19:45:58
    Author     : giuse_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />

        <title>Index</title>

        <link rel="shortcut icon" type="image/ico" href="" />
        <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/hotel.css">
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

            <hr>
            <form class="form-inline">
                <div class="control-group">
                <label>Classification :</label>

                <select class="span2">
                    <option>1 étoile</option>
                    <option>2 étoiles</option>
                    <option>3 étoiles</option>
                    <option>4 étoiles</option>
                    <option>5 étoiles</option>
                </select> 

                <label>Prix :</label>

                <input type="text" id="min" placeholder="Min" class="span2">

                <label class=>entre :</label>

                <input type="text" id="max" placeholder="Max" class="span2">
                </div>
            </form>

            <div style="margin-top: 10px; font-size: 13px">
                <%=request.getAttribute("htmlresult")%>
            </div>

            <hr>

            <div class="footer">
                <p>&copy; MIAGE 2013</p>
            </div>
        </div>

        <!-- Include Javascript -->
        <script type="text/javascript" charset="utf-8" language="javascript" src="lib/datatables/media/js/jquery.js"></script>
        <script type="text/javascript" charset="utf-8" language="javascript" src="lib/datatables/media/js/jquery.dataTables.js"></script>
        <script type="text/javascript" charset="utf-8" language="javascript" src="js/hotel.js"></script>
    </body>
</html>
