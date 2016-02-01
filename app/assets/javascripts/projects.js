function toggleMenu() {
  $('.is-dropdown-menu').on('click', function() {
    $(this).next('ul').slideToggle('fast', function() {
      $(this).closest('li').toggleClass('active');
    });
  });
}

$(document).ready(function() {
  if ($('#dbms-side-menu').length > 0) {
    toggleMenu();
  }

  var targetVsActualChartCanvas = $("#targetVsActualChart").get(0).getContext("2d");
  var targetVsActualChart = new Chart(targetVsActualChartCanvas);

  var targetVsActualChartData = {
    labels: ["Period 1", "Period 2", "Period 3", "Period 4", "Period 5", "Period 6", "Period 7", "Period 8", "Period 9", "Period 10"],
    datasets: [{
      label: "Targets",
      fillColor: "rgb(210, 214, 222)",
      strokeColor: "rgb(210, 214, 222)",
      pointColor: "rgb(210, 214, 222)",
      pointStrokeColor: "#c1c7d1",
      pointHighlightFill: "#fff",
      pointHighlightStroke: "rgb(220,220,220)",
      data: [0, 0, 5794, 5745, 7964, 6677, 1554, 1553, 0, 0]
    }, {
      label: "Actuals",
      fillColor: "rgba(60,141,188,0.9)",
      strokeColor: "rgba(60,141,188,0.8)",
      pointColor: "#3b8bba",
      pointStrokeColor: "rgba(60,141,188,1)",
      pointHighlightFill: "#fff",
      pointHighlightStroke: "rgba(60,141,188,1)",
      data: [0, 1192, 5349, 3711, 0, 0, 0, 0, 0, 0]
    }]
  };
  targetVsActualChartData.datasets[1].fillColor = "#00a65a";
  targetVsActualChartData.datasets[1].strokeColor = "#00a65a";
  targetVsActualChartData.datasets[1].pointColor = "#00a65a";

  var targetVsActualChartOptions = {
    //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
      scaleBeginAtZero: true,
      //Boolean - Whether grid lines are shown across the chart
      scaleShowGridLines: true,
      //String - Colour of the grid lines
      scaleGridLineColor: "rgba(0,0,0,.05)",
      //Number - Width of the grid lines
      scaleGridLineWidth: 1,
      //Boolean - Whether to show horizontal lines (except X axis)
      scaleShowHorizontalLines: true,
      //Boolean - Whether to show vertical lines (except Y axis)
      scaleShowVerticalLines: true,
      //Boolean - If there is a stroke on each bar
      barShowStroke: true,
      //Number - Pixel width of the bar stroke
      barStrokeWidth: 2,
      //Number - Spacing between each of the X value sets
      barValueSpacing: 5,
      //Number - Spacing between data sets within X values
      barDatasetSpacing: 1,
      //String - A legend template
      legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
      //Boolean - whether to make the chart responsive
      responsive: true,
      maintainAspectRatio: true
  };
  targetVsActualChartOptions.datasetFill = false;

  targetVsActualChart.Bar(targetVsActualChartData, targetVsActualChartOptions);
});
