@validateFiles = (inputEl) ->
  maxFileSize = $(inputEl).data("max-file-size")
  maxFileSizeExceeded = $(inputEl).data("max-file-size-message")
  formatWrong = $(inputEl).data("file-format-message")
  allowedExtension = ["jpg", "jpeg", "gif", "png"]
  extName = undefined
  sizeExceeded = false
  extensionFalse = false
  $.each inputEl.files, ->
    sizeExceeded = @size and maxFileSize and @size > parseInt(maxFileSize)
    extName = @name.split(".").pop()
    extensionFalse = $.inArray(extName.toLowerCase(), allowedExtension) is -1
    null

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

  $('#children-data-table').DataTable()

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

    false
