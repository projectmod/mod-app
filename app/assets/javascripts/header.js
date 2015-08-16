var refreshPartial = function() {
  $.ajax({
    url: "/merchants/refresh_availability",
    type: "POST"
    })
  console.log("I'm firing")
}

$(document).ready(function() {
  setInterval(refreshPartial, 10000);
});
