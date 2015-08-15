// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function adjustElementHeight(element) {

  var heights = [ ];

  $(element).each(function() {
    heights.push( $(this).height() );
  });
  var max = Math.max.apply(null, heights);

  $(element).each(function() {
    $(this).height(max);
  });
}

function inheritElementHeight(element) {
  $(element).each(function() {
    $(this).css("height", "inherit");
  });
}

function checkAdjustElementHeight(element) {
  if ($("#mq-detector > span.visible-lg").is(":visible")) {
    adjustElementHeight(element);
  }
  else if ($("#mq-detector > span.visible-md").is(":visible")) {
    adjustElementHeight(element);
  }
  else if ($("#mq-detector > span.visible-sm").is(":visible")) {
    inheritElementHeight(element);
  }
  else if ($("#mq-detector > span.visible-xs").is(":visible")) {
    inheritElementHeight(element);
  }
  else { }
}

$(window).on('resize', checkAdjustElementHeight('.caption'));

$(document).ready(function(){

  checkAdjustElementHeight('.caption');

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
