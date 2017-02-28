# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@validateFiles = (inputEl) ->
  maxFileSize = $(inputEl).data("max-file-size")
  maxFileSizeExceeded = $(inputEl).data("max-file-size-message")
  formatWrong = $(inputEl).data("file-format-message")
  allowedExtension = ["jpg", "jpeg", "gif", "png"]
  extName = undefined
  sizeExceeded = false
  extensionFalse = false
  $.each inputEl.files, ->
    sizeExceeded = true  if @size and maxFileSize and @size > parseInt(maxFileSize)
    extName = @name.split(".").pop()
    extensionFalse = true  if $.inArray(extName.toLowerCase(), allowedExtension) is -1

  if extensionFalse
    window.alert formatWrong
    $(inputEl).val ""
    return false

  if sizeExceeded
    window.alert maxFileSizeExceeded
    $(inputEl).val ""
    return false

jQuery ->
  if $(".child-status").length > 0
    $(".child-status .status-note").popover()

  $("select#household-selection").on "change", (event) ->
    optionSelected = $('option:selected', this)
    if @value == "0"
      $("#household-form-modal").modal("show")

  $.fn.dataTableExt.oStdClasses.sWrapper = "dataTables_wrapper dt-bootstrap";

  $('#child-data-table').DataTable
    "paging": true
    "lengthChange": false
    "searching": true
    "ordering": true
    "info": true
    "autoWidth": false

  $('#status-modal').on 'show.bs.modal', (event) ->
    button = $(event.relatedTarget)
    id = button.data 'model-id'
    status_type = button.data 'status-type'
    modal = $(this)
    form = modal.find('form')

    if id != undefined
      form.attr('action', '/children/' + id + '/child_statuses')

      if status_type == 'work'
        $('#education-status').addClass 'hidden'
        $('#work-status').removeClass 'hidden'
      else
        $('#education-status').removeClass 'hidden'
        $('#work-status').addClass 'hidden'
