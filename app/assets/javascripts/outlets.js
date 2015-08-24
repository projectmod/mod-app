var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

var success = function(pos){
  var crd = pos.coords;
  $('#longitude').val(crd.longitude);
  $('#latitude').val(crd.latitude);
};

var error = function(err){
};

var getLocation = function() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(success, error, options);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
};

$(document).ready(function(){
  getLocation();
});
