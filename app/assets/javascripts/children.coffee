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

  # $(".delete-custom-field").click (event) ->
  #   url = $(this).data("url")
  #   $.ajax
  #     url: url
  #     type: "post"
  #     dataType: "json"
  #     data: {"_method": "delete"}
  #     success: (result) ->
  #       divID = "#pre-field-" + result.id
  #       $(divID).hide()
  #       $("#jgrowl").jGrowl(result.message, {theme: 'success'})