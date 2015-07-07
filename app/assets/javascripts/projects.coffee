jQuery ->
  if $(".impact-table").length > 0
    eid = window.location.pathname.split("/")[2]
    url = "/gender_count/" + eid
    pieColors = {1: "#517fa4", 2: "#FF5A5E"}
    $.get url, (data) ->
      ctx = $("#i-child-ratio-chart").get(0).getContext("2d")
      count = 1
      pieData = []
      for k, v of data
        cell = {}
        cell.label = k
        cell.value = v
        cell.color = pieColors[count]
        pieData.push(cell)
        count += 1
      console.log(pieData)
      myNewChart = new Chart(ctx).Pie(pieData, {
        legendTemplate: "<ul class=\"legend-lists ratio-pie-legend\"> \
        <% for (var i=0; i<segments.length; i++){%> \
        <li><span class=\"legend-color\" style=\"background-color:<%=segments[i].fillColor%>\"></span> \
        <%if(segments[i].label){%><%=segments[i].label%> (<%=segments[i].value%>)<%}%> \
        </li><%}%></ul>"
      })
      legendHtml = myNewChart.generateLegend()
      $("#ratio-legend").append(legendHtml)
      console.log(legendHtml)