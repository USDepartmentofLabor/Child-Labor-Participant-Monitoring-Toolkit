$(document).ready(function() {

  var fieldType = $('[name="custom_field[field_type]"]');

  toggleSelections(fieldType.val());

  fieldType.on('change', function(e) {
    toggleSelections(e.target.value);
  });
});

function toggleSelections(value) {
  if(value === 'check_box' || value === 'radio_button' || value === 'select') {
    $('#selections').show();
  } else {
    $('#selections').hide();
    $('#selections textarea').val('');
  }
}
