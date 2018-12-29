document.addEventListener("DOMContentLoaded", function() {
  var el = document.getElementById("timeZone");
  if (el) {
    var tz = Intl.DateTimeFormat().resolvedOptions().timeZone;
    el.value = tz;
  }
});
