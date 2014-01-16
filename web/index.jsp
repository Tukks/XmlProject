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

        <title>Hotel Index</title>

        <link rel="shortcut icon" type="image/ico" href="css/hotel.jpg" />
        <link rel="stylesheet" type="text/css" href="css/template.css"/>
        <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/hotel.css">
    </head>
    <body>
        <div class="container">

            <div>
                <ul class="nav nav-pills pull-right">
                    <li class="active"><a href="index.html">Home</a></li>
                    <li><a href="maps.html">Maps</a></li>
                    <li><a href="chart.html">SVG</a></li>
                </ul>
                <h3 class="text-muted">Nice's Hotel</h3>
            </div>

            <hr>
            <!-- Non implémenter
            <form id="test" class="form-inline">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-xs-3">
                                <label for="etoiles" class="control-label">Classification :</label><br/>                        
                                <select id="etoiles" class="form-control">
                                    <option>1 étoile</option>
                                    <option>2 étoiles</option>
                                    <option>3 étoiles</option>
                                    <option>4 étoiles</option>
                                    <option>5 étoiles</option>
                                </select> 
                            </div>
                            <div class="col-xs-3">
                                <label for="min" class="control-label">Prix Minimum : </label>
                                <input type="text" id="min" class="form-control" placeholder="Min">
                            </div>
                            <div class="col-xs-3">
                                <label for="max" class="control-label">Prix Maximum : </label>
                                <input type="text" id="max" class="form-control" placeholder="Max">
                            </div>
                            <div class="col-xs-3">
                                <label for="rechercher" class="control-label"></label>
                                <input type="submit" class=" form-control btn btn-info" name="rechercher"/>
                            </div>
                        </div>
                    </div>
                </div>
            </form> -->


            <div style="margin-top: 10px; font-size: 13px">
                <%=request.getAttribute("htmlresult")%>
            </div>

            <br />

            <div class="footer">
                <p>&copy; MIAGE 2013</p>
            </div>
        </div>
    </div>

</div>

<!-- Include Javascript -->
<script type="text/javascript" charset="utf-8" language="javascript" src="lib/datatables/media/js/jquery.js"></script>
<script type="text/javascript" charset="utf-8" language="javascript" src="lib/datatables/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf-8" language="javascript" src="js/hotel.js"></script>

</body>
</html>
