// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

  var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
  };

  function getLocation() {
      if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(success, error, options);
      } else {
          x.innerHTML = "Geolocation is not supported by this browser.";
      }
  }

  function success(pos){
    var crd = pos.coords;
    $('#longitude').val(crd.longitude);
    $('#latitude').val(crd.latitude);
  }

  function error(err){

  }

  getLocation();
})
