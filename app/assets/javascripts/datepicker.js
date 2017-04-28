var ready;
ready = function() {
  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd',
    autoclose: true
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('turbolinks:load', ready);
