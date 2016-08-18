$(document).ready(function () {
  $("#timeline").click(function(e) {
    e.preventDefault();
    $(this).find("#time-elapsed").toggleClass("hidden");
    $(this).find("#time-remaining").toggleClass("hidden");
  });

  if ($("#targetVsActualChart").length) {
    var targetVsActualChartCanvas = $("#targetVsActualChart").get(0).getContext("2d");
    var targetVsActualChart = new Chart(targetVsActualChartCanvas);

    var targetVsActualChartData = {
      labels: ["Period 1", "Period 2", "Period 3", "Period 4", "Period 5", "Period 6", "Period 7", "Period 8", "Period 9"],
      datasets: [{
        label: "Targets",
        fillColor: "rgb(210, 214, 222)",
        strokeColor: "rgb(210, 214, 222)",
        pointColor: "rgb(210, 214, 222)",
        pointStrokeColor: "#c1c7d1",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgb(220,220,220)",
        //data: [0, 0, 5794, 5745, 7964, 6677, 1554, 1553, 0, 0]
        data: [100, 200, 300, 400, 500, 600, 700, 800, 900]
      }, {
        label: "Actuals",
        fillColor: "rgba(60,141,188,0.9)",
        strokeColor: "rgba(60,141,188,0.8)",
        pointColor: "#3b8bba",
        pointStrokeColor: "rgba(60,141,188,1)",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(60,141,188,1)",
        //data: [0, 1192, 5349, 3711, 0, 0, 0, 0, 0, 0]
        data: [100, 0, 0, 0, 0, 0, 0, 0, 0]
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
  }

  // household chart
  if ($("#householdsTargetVsActualChart").length) {
    var householdsTargetVsActualChartCanvas = $("#householdsTargetVsActualChart").get(0).getContext("2d");
    var householdsTargetVsActualChart = new Chart(householdsTargetVsActualChartCanvas);

    var householdsTargetVsActualChartData = {
      labels: ["Period 1", "Period 2", "Period 3", "Period 4", "Period 5", "Period 6", "Period 7", "Period 8", "Period 9"],
      datasets: [{
        label: "Targets",
        fillColor: "rgb(210, 214, 222)",
        strokeColor: "rgb(210, 214, 222)",
        pointColor: "rgb(210, 214, 222)",
        pointStrokeColor: "#c1c7d1",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgb(220,220,220)",
        //data: [0, 251, 2700, 3000, 4628, 4629, 1215, 1204, 0, 0]
        data: [50, 100, 150, 200, 250, 300, 350, 400, 450]
      }, {
        label: "Actuals",
        fillColor: "rgba(60,141,188,0.9)",
        strokeColor: "rgba(60,141,188,0.8)",
        pointColor: "#3b8bba",
        pointStrokeColor: "rgba(60,141,188,1)",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(60,141,188,1)",
        //data: [0, 222, 699, 1625, 0, 0, 0, 0, 0, 0]
        data: [28, 0, 0, 0, 0, 0, 0, 0, 0]
      }]
    };
    householdsTargetVsActualChartData.datasets[1].fillColor = "#00a65a";
    householdsTargetVsActualChartData.datasets[1].strokeColor = "#00a65a";
    householdsTargetVsActualChartData.datasets[1].pointColor = "#00a65a";

    var householdsTargetVsActualChartOptions = {
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
    householdsTargetVsActualChartOptions.datasetFill = false;

    householdsTargetVsActualChart.Bar(householdsTargetVsActualChartData, householdsTargetVsActualChartOptions);
  }

  if($("#beneficiariesByAgeChart").length) {
    var pieChartCanvas = $("#beneficiariesByAgeChart").get(0).getContext("2d");
      var pieChart = new Chart(pieChartCanvas);
      var PieData = [
        {
          value: 700,
          color: "#f56954",
          highlight: "#f56954",
          label: "Under 10"
        },
        {
          value: 500,
          color: "#00a65a",
          highlight: "#00a65a",
          label: "10–12"
        },
        {
          value: 400,
          color: "#f39c12",
          highlight: "#f39c12",
          label: "12–15"
        },
        {
          value: 600,
          color: "#00c0ef",
          highlight: "#00c0ef",
          label: "15–18"
        }
      ];
      var pieOptions = {
        //Boolean - Whether we should show a stroke on each segment
        segmentShowStroke: true,
        //String - The colour of each segment stroke
        segmentStrokeColor: "#fff",
        //Number - The width of each segment stroke
        segmentStrokeWidth: 1,
        //Number - The percentage of the chart that we cut out of the middle
        percentageInnerCutout: 50, // This is 0 for Pie charts
        //Number - Amount of animation steps
        animationSteps: 100,
        //String - Animation easing effect
        animationEasing: "easeOutBounce",
        //Boolean - Whether we animate the rotation of the Doughnut
        animateRotate: true,
        //Boolean - Whether we animate scaling the Doughnut from the centre
        animateScale: false,
        //Boolean - whether to make the chart responsive to window resizing
        responsive: true,
        // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
        maintainAspectRatio: false,
        //String - A legend template
        legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>",
        //String - A tooltip template
        tooltipTemplate: "<%=value %> <%=label%>"
      };
      //Create pie or douhnut chart
      // You can switch between pie and douhnut using the method below.
    pieChart.Doughnut(PieData, pieOptions);
  }

  if($("#beneficiariesByGenderChart").length) {
    var pieChartCanvas = $("#beneficiariesByGenderChart").get(0).getContext("2d");
      var pieChart = new Chart(pieChartCanvas);
      var PieData = [
        {
          value: 700,
          color: "#f56954",
          highlight: "#f56954",
          label: "Female"
        },
        {
          value: 600,
          color: "#00c0ef",
          highlight: "#00c0ef",
          label: "Male"
        }
      ];
      var pieOptions = {
        //Boolean - Whether we should show a stroke on each segment
        segmentShowStroke: true,
        //String - The colour of each segment stroke
        segmentStrokeColor: "#fff",
        //Number - The width of each segment stroke
        segmentStrokeWidth: 1,
        //Number - The percentage of the chart that we cut out of the middle
        percentageInnerCutout: 0, // This is 0 for Pie charts
        //Number - Amount of animation steps
        animationSteps: 100,
        //String - Animation easing effect
        animationEasing: "easeOutBounce",
        //Boolean - Whether we animate the rotation of the Doughnut
        animateRotate: false,
        //Boolean - Whether we animate scaling the Doughnut from the centre
        animateScale: true,
        //Boolean - whether to make the chart responsive to window resizing
        responsive: true,
        // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
        maintainAspectRatio: false,
        //String - A legend template
        legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>",
        //String - A tooltip template
        tooltipTemplate: "<%=value %> <%=label%>"
      };
      //Create pie or douhnut chart
      // You can switch between pie and douhnut using the method below.
    pieChart.Doughnut(PieData, pieOptions);
  }

  $("#project-info a").editable({
    mode: 'inline',
    resource: 'project',
    url: '/project',
    combodate: {
      minYear: 2000,
      maxYear: 2040
    }
  });

  $("#title").on('save', function(e, p) {
    $(".content-header h1 span").text(p.newValue);
  });

  $("#cooperative_agreement_number").on('save', function(e, p) {
    $(".content-header h1 small").text(p.newValue);
  });

  $('[data-show]').on('click', function(e) {
    if(e.currentTarget.dataset['show']) {
      var selector = '#' + e.currentTarget.dataset['show'];
      $(selector).show();
    }
  });
});
