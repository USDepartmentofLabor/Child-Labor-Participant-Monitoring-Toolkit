$('#uploadDoc').on('show.bs.modal', function(event) {
  var trigger = $(event.relatedTarget);
  var annex = trigger.data('annex');
  var modal = $(this);

  modal.find('#report_attachment_attachment_annex').val(annex);
});
