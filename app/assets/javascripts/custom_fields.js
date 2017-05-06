$(document).ready(function() {
  var target = '[name="custom_field[field_type]"]';

  registerToggleSelectionsCallback('', target);

  // This doesn't really work if there is more than one rank-order set
  // on the page
  var order = JSON.parse($('.grid-order').first().val());
  renumber($('.grid-value'), order);
  $('.grid-check').on('ifChecked ifUnchecked', function(e) {
    var tgt = $(e.target);
    var data = {
      option: tgt.data('option'),
      action: e.type,
      name: tgt[0].id
    };

    updateRank(data)
  });
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
  var orderField = data.name.split('__')[0] + '_order';
  var currentOrder = getCurrentOrder(orderField);

  if(data.action === 'ifChecked') {
    currentOrder.push(data.option);
  } else {
    currentOrder = currentOrder.filter(function(x) { return x != data.option });
  }

  $('input#' + orderField).val(JSON.stringify(currentOrder));

  renumber($('.grid-value'), currentOrder);
}

// id is the id of the hidden field holding the rank for the input field
function getCurrentOrder(id) {
  var currentOrder = $('input#' + id).val() || "[]";
  return JSON.parse(currentOrder);
}

function renumber(gridValues, order) {
  $(gridValues).text('#');

  order.forEach(function(o, i) {
    $(gridValues[o]).text(i + 1);
  });
}
