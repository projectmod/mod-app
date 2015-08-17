var refreshPartial = function() {
  $.ajax({
    url: "/merchants/refresh_availability",
    type: "POST"
    })
}

$(document).ready(function() {
  setInterval(refreshPartial, 10000);
});
