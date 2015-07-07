# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  if $(".child-status").length > 0
    $(".child-status .status-note").popover()

  $("select#household-selection").on "change", (event) ->
    optionSelected = $('option:selected', this)
    if @value == "0"
      $("#household-form-modal").modal("show")