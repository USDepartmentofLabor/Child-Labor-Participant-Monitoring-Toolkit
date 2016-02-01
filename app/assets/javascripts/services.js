$(document).ready(function() {
  $('#services-dt').DataTable({
    paging: false,
    searching: false,
    columnDefs: [
      {
        orderable: false,
        targets: -1
      }
    ]
  });
});
