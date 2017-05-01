jQuery ->
  $('#households-data-table').DataTable()

  $('form').on 'click', '.remove_fields', (event) ->
    event.preventDefault()
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.associated-fields').hide()

  $('form').on 'click', '.add_fields', (event) ->
    event.preventDefault()
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    has_table = $(this).parents('table').length > 0
    append = $(this).data('fields').replace(regexp, time)
    if(has_table)
      $(this).parents('table').find('tbody').append(append)
    else
      $(this).before(append)

    $('.date-select > select').wrap('<div class="col-md-4">')
    
    $('input[type="checkbox"].square-red, input[type="radio"].square-red')
      .iCheck
        checkboxClass: "icheckbox_square-red",
        radioClass: 'iradio_square-red',
        increaseArea: '10%'
      .on 'ifChecked ifUnchecked', (event) ->
        tgt = $(event.target)
        data = {
          option: tgt.data('option'),
          action: event.type,
          name: tgt[0].name
        }
        updateRank(data)
