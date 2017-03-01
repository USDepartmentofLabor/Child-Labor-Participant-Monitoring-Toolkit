jQuery ->
  $('#services-data-table').DataTable
    columnDefs: [{
      orderable: false
      targets: -1
    }]
