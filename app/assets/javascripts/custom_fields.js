$(document).ready(function() {
  var target = '[name="custom_field[field_type]"]';

  registerToggleSelectionsCallback('', target);
});

function registerToggleSelectionsCallback(owner, target) {
  var fieldType = $(owner + ' ' + target);
  toggleSelections(owner + ' #selections', fieldType.val());
  fieldType.on('change', function(e) {
    toggleSelections(owner + ' #selections', e.target.value);
  });
}

function toggleSelections(target, value) {
  if(value === 'check_box' || value === 'radio_button' ||
    value === 'select' || value === 'rank_list' ) {
    $(target).show();
  } else {
    $(target).hide();
    $(target + ' textarea').val('');
  }
}

// For rank_list inputs, label the check boxes in the order they were selected
// and store this value in a hidden field associated with each checkbox
function updateRank(data) {
  var currentOrder = getCurrentOrder(data.name + '_order');

  console.log(data);
  console.log(currentOrder);

  if(data.action === 'ifChecked') {
    currentOrder.push(data.option);
  } else {
    currentOrder = currentOrder.filter(function(x) { return x != data.option });
  }

  $(data.name + '_order').val(JSON.stringify(currentOrder));

  renumber($('.grid-value[data-name="' + data.name + '"]'), currentOrder);
}

// Name is the name of the hidden field holding the rank for the input field
function getCurrentOrder(name) {
  var currentOrder = $('input[name="' + name + '"]').val() || "[]";
  return JSON.parse(currentOrder);
}

function renumber(gridValues, order) {
  $(gridValues).text('#');

  order.forEach(function(o, i) {
    $(gridValues[o - 1]).text(i + 1);
  });
}
