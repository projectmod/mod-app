var checkOutletConfirmed = function(id) {
  $.ajax({
    url: "/bookings/" + id + "/check",
    type: "POST"
  }).done(function(response) {
    if (response.confirmed) {
      window.location.href = 'result';
    }
  })
};

$(document).ready(function(){
  if ($("#pending-booking").length > 0) {
    var id = $('.outlet-id').text();

    setInterval(function() {
      checkOutletConfirmed(id)
    }, 1000);

    window.setTimeout(function() {
      window.location.href = 'result';
    }, 180000);
  }
});
