var refreshPartial = function() {
  $.ajax({
    url: "/merchants/refresh_availability",
    type: "POST"
    })
}

$(document).ready(function() {
  if ($('.availability-link-settings').length > 0) {
    setInterval(refreshPartial, 10000);
  };
});
