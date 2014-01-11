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

        <title>Hotel</title>

        <link rel="shortcut icon" type="image/ico" href="">

        <link rel="stylesheet" type="text/css" href="css/template.css"/>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="lib/bootstrap/css/bootstrap-theme.min.css">       


        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            google.load("visualization", "1", {packages: ["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Classification', 'Moyenne'],
                    ['1 étoile', 5],
                    ['2 étoiles', 30],
                    ['3 étoiles', 41],
                    ['4 étoiles', 21],
                    ['5 étoiles', 2]
                ]);

                var options = {
                    title: 'Classification des hotels',
                    is3D: true,
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                chart.draw(data, options);
            }
        </script>
        <script type="text/javascript">
            google.load("visualization", "1", {packages: ["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                     ['Classification', 'Moyenne'],
                    ['1 étoile', 5],
                    ['2 étoiles', 30],
                    ['3 étoiles', 41],
                    ['4 étoiles', 21],
                    ['5 étoiles', 2]
                ]);

                var options = {
                    title: 'Company Performance'
                };

                var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
        <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Classification', 'Moyenne'],
          ['1 étoile',  5],
          ['2 étoiles',  31],
          ['3 étoiles',  42],
          ['4 étoiles',  21],
          ['5 étoiles',  2]
        ]);

        var options = {
          title: 'Company Performance',
          vAxis: {title: 'Year',  titleTextStyle: {color: 'red'}}
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
                    <li class="active"><a href="maps.html">Maps</a></li>
                    <li><a href="svg.html">SVG</a></li>
                </ul>
                <h3 class="text-muted">Project XML</h3>
            </div>

            <hr>
            <div id="piechart" style="width: 900px; height: 500px;"></div>
            <hr>
            <div id="chart_div" style="width: 900px; height: 500px;"></div>
            <hr>
            <div id="bar_div" style="width: 900px; height: 500px;"></div>
            <hr>
        </div>

    </body>
</html>