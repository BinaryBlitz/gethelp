$(document).ready(function() {
  document.getElementById('call-back').onclick = function() {
    var el = document.getElementById("popupi");
    el.classList.add("popup-flex");
    el.classList.remove("popup");
  };
  document.getElementById('close-icon').onclick = function() {
    var el = document.getElementById("popupi");
    el.classList.add("popup");
    el.classList.remove("popup-flex");
  };
})
