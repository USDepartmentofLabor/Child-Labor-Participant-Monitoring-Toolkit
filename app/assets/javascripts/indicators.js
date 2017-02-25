$(document).ready(function () {

  $('#indicatorTable').DataTable({
    paging: true,
    pageLength: 20,
    lengthChange: false,
    searching: true,
    ordering: true,
    order: [[4, 'desc',], [0, 'asc']],
    info: true,
    autoWidth: false,
    ajax: {
      url: "/indicators.json"
    }
  });

});
