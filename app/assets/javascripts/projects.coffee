fixBar = ()->
  $sidebar = $('#dbms-side-menu')
  $window = $(window)

  # In a mobile mode
  if $sidebar.width()*2 > $window.width()
    return 

  offset = $sidebar.offset()
  topPadding = 80
  $window.scroll ->
    if $window.scrollTop() + 80 > offset.top
      $sidebar.stop().animate marginTop: $window.scrollTop() - (offset.top) + topPadding
    else
      $sidebar.stop().animate marginTop: 0

toggleMenu = () ->
  $('.is-dropdown-menu').on 'click', ->
    $(this).next('ul').slideToggle('fast', ->
      $(this).closest('li').toggleClass 'active'
    )

jQuery ->
  if $('#dbms-side-menu').length > 0  
    fixBar()
    toggleMenu()
  if $("#i-child-ratio-chart").length > 0
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
      myNewChart = new Chart(ctx).Pie(pieData, {
        legendTemplate: "<ul class=\"legend-lists ratio-pie-legend\"> \
        <% for (var i=0; i<segments.length; i++){%> \
        <li><span class=\"legend-color\" style=\"background-color:<%=segments[i].fillColor%>\"></span> \
        <%if(segments[i].label){%><%=segments[i].label%> (<%=segments[i].value%>)<%}%> \
        </li><%}%></ul>"
      })
      legendHtml = myNewChart.generateLegend()
      $("#ratio-legend").append(legendHtml)
  if $("#project_office_address").length > 0
    $("#project_office_address").geocomplete()