var validations = {
  email: [/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/, 'Please enter a valid email address']
};
$(document).ready(function() {
  // Check all the input fields of type email. This function will handle all the email addresses validations
  $("input[type=email]").change( function() {
    // Set the regular expression to validate the email
    validation = new RegExp(validations['email'][0]);
    // validate the email value against the regular expression
    if (!validation.test(this.value)) {
      // If the validation fails then we show the custom error message
      this.setCustomValidity(validations['email'][1]);
      $("#emailInput").css("border-color", "#f36c12");
      $("#emailInput").css("color", "#f36c12");
      var el = document.getElementById("emailInput");
      el.classList.remove("approve");
      el.classList.add("failed");
      return false;
    } else {
      // This is really important. If the validation is successful you need to reset the custom error message
      this.setCustomValidity('');
      $("#emailInput").css("border-color", "#929292");
      var el = document.getElementById("emailInput");
      el.classList.add("approve");
      el.classList.remove("failed");
    }
  });
  $('#formName').change(function() {
    var el = document.getElementById("formName");
    el.className += " approve";
  });
  $('#cbName').change(function() {
    var el = document.getElementById("cbName");
    el.className += " approve";
  });
  $("#formPhone").change(function() {
    var el = document.getElementById("formPhone");
    el.className += " approve";
  });
  $("#cbPhone").change(function() {
    var el = document.getElementById("cbPhone");
    el.className += " approve";
  });
  $("#subject").change(function() {
    var el = document.getElementById("subject");
    el.className += " approve";
  });
  $("#uni").change(function() {
    var el = document.getElementById("uni");
    el.className += " approve";
  });
  $("#fac").change(function() {
    var el = document.getElementById("fac");
    el.className += " approve";
  });
})
