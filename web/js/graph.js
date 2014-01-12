/** Pie **/
function pie(valeur) {
    google.load("visualization", "1", {packages: ["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {

        var data = google.visualization.arrayToDataTable([
            ['Classification', 'Moyenne'],
            ['1 étoile', eval(valeur[0])],
            ['2 étoiles', eval(valeur[1])],
            ['3 étoiles', eval(valeur[2])],
            ['4 étoiles', eval(valeur[3])],
            ['5 étoiles', eval(valeur[4])]
        ]);

        var options = {
            title: 'Classification des hotels',
            is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('pie_chart'));
        chart.draw(data, options);
    }
}