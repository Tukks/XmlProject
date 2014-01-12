<%-- 
    Document   : jsp
    Created on : 11 janv. 2014, 11:35:40
    Author     : MoMo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />

        <title>SVG Chart</title>

        <link rel="shortcut icon" type="image/ico" href="">

        <link rel="stylesheet" type="text/css" href="css/template.css"/>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="lib/bootstrap/css/bootstrap-theme.min.css">       


        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript" src="js/graph.js"></script>
        <script type="text/javascript">
            var classification = new Array();
            <% int[] classificationJava = (int[]) session.getAttribute("classificationresult");

                for (int i = 0; i < classificationJava.length; i++) {%>
            var tmp = '<%= classificationJava[i]%>';           //--> without this doesnt work
            classification[<%= i%>] = tmp;
            <%}
            %>

            pie(classification);
        </script>

        <script type="text/javascript">
            google.load("visualization", "1", {packages: ["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Classification', 'Moyenne'],
                    ['1 étoile', eval(classification[0])],
                    ['2 étoiles', eval(classification[1])],
                    ['3 étoiles', eval(classification[2])],
                    ['4 étoiles', eval(classification[3])],
                    ['5 étoiles', eval(classification[4])]
                ]);

                var options = {
                    title: 'Classification des hotels'
                };

                var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
        <script type="text/javascript">
            google.load("visualization", "1", {packages: ["corechart"]});
            google.setOnLoadCallback(drawChart);
            var val = eval(text)
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Classification', 'Moyenne'],
                    ['1 étoile', eval(classification[0])],
                    ['2 étoiles', eval(classification[1])],
                    ['3 étoiles', eval(classification[2])],
                    ['4 étoiles', eval(classification[3])],
                    ['5 étoiles', eval(classification[4])]
                ]);

                var options = {
                    title: 'Classification des hotels',
                    vAxis: {title: 'Class', titleTextStyle: {color: 'red'}}
                };

                var chart = new google.visualization.BarChart(document.getElementById('bar_div'));
                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div>
                <ul class="nav nav-pills pull-right">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="maps.html">Maps</a></li>
                    <li class="active"><a href="chart.html">SVG</a></li>
                </ul>
                <h3 class="text-muted">Project XML</h3>
            </div>

            <hr>
            <div id="pie_chart" style="width: 900px; height: 500px;"></div>
            <input class="form-control btn btn-info" name="pdf" value="Télécharger en pdf" onclick="location='fop.html'"/>
            <hr>
            <div id="chart_div" style="width: 900px; height: 500px;"></div>
            <hr>
            <div id="bar_div" style="width: 900px; height: 500px;"></div>
            <hr>
        </div>
    </body>
</html>