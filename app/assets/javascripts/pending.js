$(document).ready(function(){
  if ($("#pending-booking").length > 0) {
    window.setTimeout(function() {
      window.location.href = 'result';
    }, 60000);
  }
});
