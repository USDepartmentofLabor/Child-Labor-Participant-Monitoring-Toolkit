var FormWizard = function() {
  var wizardContent = ".swMain";
  var wizardForm = "#report-wizard";

  var initWizard = function() {
    // function to initiate Wizard Form
    $(wizardContent).smartWizard({
      selected : 0,
      keyNavigation : false,
      // onLeaveStep : leaveAStepCallback,
      // onShowStep : onShowStep,
    });
    // animateBar(1);
    // initValidator();
    // runDatePicker();
  };

  var animateBar = function(val) {
    if (( typeof val == 'undefined') || val == "") {
      val = 1;
    };
    var numberOfSteps = $('.swMain > ul > li').length;
    var valueNow = Math.floor(100 / numberOfSteps * val);
    $('.step-bar').css('width', valueNow + '%');
  };

  var runDatePicker = function () {
    $('.date-picker').datepicker({
      autoclose: true,
      format: 'yyyy-mm-dd',
      language: 'zh-CN',
      orientation: 'top'
    });
  };

  var initValidator = function() {
    // $.validator.addMethod("cardExpiry", function() {
    //   //if all values are selected
    //   if ($("#card_expiry_mm").val() != "" && $("#card_expiry_yyyy").val() != "") {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // }, 'Please select a month and year');
    $.validator.addMethod("greaterThan", function(value, element, params) {
      if (!/Invalid|NaN/.test(new Date(value))) {
        return new Date(value) > new Date($(params).val());
      }

      return isNaN(value) && isNaN($(params).val()) 
        || (Number(value) > Number($(params).val())); 
    },"结束日期必须晚于开始日期");

    $.validator.addMethod("money", function(value, element) {
      var isValidMoney = /^\d{0,4}(\.\d{0,2})?$/.test(value);
      return this.optional(element) || isValidMoney;
    },"请输入有效的金额");
    $.validator.setDefaults({
      errorElement : "span", // contain the error msg in a span tag
      errorClass : 'help-block',
      errorPlacement : function(error, element) {// render error placement for each input type
        if (element.attr("type") == "radio" || element.attr("type") == "checkbox") {// for chosen elements, need to insert the error after the chosen container
          error.insertAfter($(element).closest('.form-group').children('div').children().last());
        } else if (element.attr("name") == "card_expiry_mm" || element.attr("name") == "card_expiry_yyyy") {
          error.appendTo($(element).closest('.form-group').children('div'));
        } else {
          error.insertAfter(element);
          // for other inputs, just perform default behavior
        }
      },
      ignore : ':hidden',
      rules : {
        "user[fname]" : {
          required : true
        },
        "user[lname]" : {
          required : true
        },
        "user[email]" : {
          required : true
        },
        "user[password]" : {
          required : true
        },
        "user[password_confirmation]" : {
          required : true
        },
        "project[title]" : {
          required : true
        },
        "project[industry_id]" : {
          required : true
        },
        "project[type_id]" : {
          required : true
        },
        "project[about]" : {
          required : true
        },
        "project[goals]" : {
          required : true
        },
        "project[budget]" : {
          money: true,
          min: 1,
          required : true
        },
        "project[start_at]" : {
          date: true,
          required : true
        },
        "project[end_at]" : {
          greaterThan: "#project_start_at",
          date: true,
          required : true
        }
      },
      messages : {
        firstname : "Please specify your first name"
      },
      highlight : function(element) {
        $(element).closest('.help-block').removeClass('valid');
        // display OK icon
        $(element).closest('.form-group').removeClass('has-success').addClass('has-error').find('.symbol').removeClass('ok').addClass('required');
        // add the Bootstrap error class to the control group
      },
      unhighlight : function(element) {// revert the change done by hightlight
        $(element).closest('.form-group').removeClass('has-error');
        // set error class to the control group
      },
      success : function(label, element) {
        label.addClass('help-block valid');
        // mark the current input as valid and display OK icon
        $(element).closest('.form-group').removeClass('has-error').addClass('has-success').find('.symbol').removeClass('required').addClass('ok');
      }
    });
  };
  var displayConfirm = function() {
    var form = $(wizardForm);
    $('.display-value', form).each(function() {
      var input = $('[name="' + $(this).attr("data-display") + '"]', form);
      if (input.attr("type") == "text" || input.attr("type") == "email" || input.is("textarea")) {
        $(this).html(input.val());
      } else if (input.is("select")) {
        $(this).html(input.find('option:selected').text());
      } else if (input.is(":radio") || input.is(":checkbox")) {

        $(this).html(input.filter(":checked").closest('label').text());
      } else if ($(this).attr("data-display") == 'card_expiry') {
        $(this).html($('[name="card_expiry_mm"]', form).val() + '/' + $('[name="card_expiry_yyyy"]', form).val());
      }
    });
  };
  var onShowStep = function(obj, context) {
    $(".next-step").unbind("click").click(function(e) {
      e.preventDefault();
      $(wizardContent).smartWizard("goForward");
    });
    $(".back-step").unbind("click").click(function(e) {
      e.preventDefault();
      $(wizardContent).smartWizard("goBackward");
    });
    $(".finish-step").unbind("click").click(function(e) {
      e.preventDefault();
      onFinish(obj, context, e);
    });
  };
  var leaveAStepCallback = function(obj, context) {
    return validateSteps(context.fromStep, context.toStep);
    // return false to stay on step and true to continue navigation
  };
  var onFinish = function(obj, context, event) {
    if (validateAllSteps()) {
      $('.anchor').children("li").last().children("a").removeClass('wait').removeClass('selected').addClass('done');
      var status = $(event.target).data("status");
      $("input[name='project[status]']").val(status);
      $(wizardForm).submit();
    }
  };
  var validateSteps = function(stepnumber, nextstep) {
    var isStepValid = false;
    var numberOfSteps = $('.swMain > ul > li').length;

    if (numberOfSteps > nextstep && nextstep > stepnumber) {
      // cache the form element selector
      if ($(wizardForm).valid()) {// validate the form
        $(wizardForm).validate().focusInvalid();
        $('.anchor').children("li:nth-child(" + stepnumber + ")").children("a").removeClass('wait');
        //focus the invalid fields
        animateBar(nextstep);
        isStepValid = true;
        return true;
      };
    } else if (nextstep < stepnumber) {
      $('.anchor').children("li:nth-child(" + stepnumber + ")").children("a").addClass('wait');
      animateBar(nextstep);
      return true;
    } else {
      if ($(wizardForm).valid()) {
        $('.anchor').children("li:nth-child(" + stepnumber + ")").children("a").removeClass('wait');
        displayConfirm();
        animateBar(nextstep);
        return true;
      }
    }
    ;
  };
  var validateAllSteps = function() {
    var isStepValid = true;
    // all step validation logic
    return isStepValid;
  };
  return {
    init : function() {
      initWizard();
    }
  };
}();
