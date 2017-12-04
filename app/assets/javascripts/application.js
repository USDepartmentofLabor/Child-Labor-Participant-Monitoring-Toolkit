// This is a manifest file that'll be compiled into application.js, which will
// include all the files listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts,
// vendor/assets/javascripts, or any plugin's vendor/assets/javascripts
// directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at
// the bottom of the compiled file.
//
// Read Sprockets README
// (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require icheck.min
//= require app
//= require jquery.smartWizard
//= require jquery.validate.min
//= require Chart.min
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require ckeditor/init
//= require bootstrap-editable
//= require bootstrap-editable-rails
//= require toastr_rails

//= require children
//= require custom_fields
//= require households
//= require indicators
//= require projects
//= require report_wizard
//= require services
//= require service_types
//= require technical_progress_reports
//= require translations

$(document).ready(function() {
  $('.has-tooltip').tooltip();

  $('.icheck, input.square-red').iCheck({
    checkboxClass: 'icheckbox_square-red',
    radioClass: 'iradio_square-red',
    increaseArea: '10%'
  });

  $('.date-select select').wrap('<div class="col-md-4">');

  $(function() {
    $('.alert-success').fadeIn('normal', function() {
      $(this).delay(3000).fadeOut();
    });
  });

  toastr.options = {
    "closeButton": false,
    "debug": false,
    "newestOnTop": false,
    "progressBar": false,
    "positionClass": "toast-top-center",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "500",
    "hideDuration": "500",
    "timeOut": "4000",
    "extendedTimeOut": "500",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "slideDown",
    "hideMethod": "slideUp"
  };
});
