$('#svggraph').svg(initGraph); 
         
var chartAreas = [[0.1, 0.1, 0.95, 0.9], [0.2, 0.1, 0.95, 0.9], 
    [0.1, 0.1, 0.8, 0.9], [0.1, 0.25, 0.9, 0.9], [0.1, 0.1, 0.9, 0.8]]; 
var legendAreas = [[0.0, 0.0, 0.0, 0.0], [0.005, 0.1, 0.125, 0.5], 
    [0.85, 0.1, 0.97, 0.5], [0.2, 0.1, 0.8, 0.2], [0.2, 0.9, 0.8, 0.995]]; 
var fills = [['lightblue', 'url(#fadeBlue)'], ['pink', 'url(#fadeRed)'], 
    ['lightgreen', 'url(#fadeGreen)']]; 
 
function initGraph(svg) { 
    var defs = svg.defs(); 
    svg.linearGradient(defs, 'fadeBlue', 
        [[0, 'lightblue'], [1, 'blue']]); 
    svg.linearGradient(defs, 'fadeRed', [[0, 'pink'], [1, 'red']]); 
    svg.linearGradient(defs, 'fadeGreen', 
        [[0, 'lightgreen'], [1, 'green']]); 
    svg.graph.noDraw().title('Browser Usage', 'blue'). 
        addSeries('IE', [95.97, 91.80, 88.16, 86.64], 
            'lightblue', 'blue', 3). 
        addSeries('Netscape', [3.39, 2.83, 1.61, 0.00], 
            'pink', 'red', 3). 
        addSeries('Firefox', [0.00, 4.06, 8.13, 9.95], 
            'lightgreen', 'green', 3). 
        format('ivory', 'gray'). 
        gridlines({stroke: 'gray', strokeDashArray: '2,2'}, 'gray'); 
    svg.graph.xAxis.title('Year', 'green').scale(0, 3). 
        ticks(1, 0).labels(['2002', '2004', '2005', '2006']); 
    svg.graph.yAxis.title('Percentage').ticks(10, 5); 
    svg.graph.legend.settings({fill: 'lightgoldenrodyellow', 
        stroke: 'gray'}); 
    svg.graph.status(showGraphStatus); 
} 
 
/* Draw a new graph with the selected options */ 
$('#graphIt').click(function() { 
    var chartType = $('#chartType').val(); 
    var chartLegend = parseInt($('#chartLegend').val(), 10); 
    var seriesFill = ($('#seriesFill').val() == 'plain' ? 0 : 1); 
    var svg = $('#svggraph').svg('get'); 
    svg.graph.noDraw(). 
        legend.show(chartLegend).area(legendAreas[chartLegend]).end(). 
        series(0).format(fills[0][seriesFill]).end(). 
        series(1).format(fills[1][seriesFill]).end(). 
        series(2).format(fills[2][seriesFill]).end(). 
        area(chartAreas[chartLegend]). 
        type(chartType, {explode: 2, explodeDist: 10}).redraw(); 
    chartType = $.svg.graphing.chartTypes()[chartType]; 
    $('#graphDesc').text(chartType.description()); 
    var options = ''; 
    for (var i = 0; i < chartType.options().length; i++) { 
        options += '<li>' + chartType.options()[i] + '</li>'; 
    } 
    $('#graphOptions').html(options || '<li>None</li>'); 
    resetSize(svg); 
}); 
 
function showGraphStatus(label, value) { 
    $('#svggraph').attr('title', (label ? label + ' ' + value : '')); 
}