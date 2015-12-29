// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require icheck.min
//= require jquery.smartWizard
//= require jquery.jgrowl.min
//= require jquery.validate.min
//= require Chart.min
//= require jquery.geocomplete.min
//= require home
//= require children
//= require projects
//= require report_wizard
//= require households

function icheck(){
  if($(".icheck").length > 0){
    $(".icheck").each(function(){
      var $el = $(this);
      var opt = {
        checkboxClass: 'icheckbox_square-red',
        radioClass: 'iradio_square-red',
      }
      $el.iCheck(opt);
    });
  }
}

$(document).ready(function() {
  $('.has-tooltip').tooltip();
  icheck();
});
