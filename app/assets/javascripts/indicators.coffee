jQuery ->
  $('#indicators-data-table').DataTable
    order: [[4, 'desc',], [0, 'asc']]
    ajax:
      url: "/indicators.json"
