$(document).ready(function () {
  $("#timeline").click(function(e) {
    e.preventDefault();
    $(this).find("#time-elapsed").toggleClass("hidden");
    $(this).find("#time-remaining").toggleClass("hidden");
  });

  $('a[data-show]').on('click', function(e) {
    e.preventDefault();

    var tgt = $(this).data('show');

    if(tgt) {
      $('#' + tgt).show();
    }
  });

  $('a[data-hide]').on('click', function(e) {
    e.preventDefault();

    var tgt = $(this).data('hide');

    if(tgt) {
      $('#' + tgt).hide();
    }
  });

  $('#locations td span').editable({ mode: 'inline' });
});
