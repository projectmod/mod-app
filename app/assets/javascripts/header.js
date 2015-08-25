var refreshPartial = function() {
  $.ajax({
    url: "/merchants/refresh_availability",
    type: "POST"
    })
}

$(document).ready(function() {
  setInterval(function() {
    if ($('.availability-link-settings').length > 0) {
      refreshPartial();
    };
  }, 10000);
});
