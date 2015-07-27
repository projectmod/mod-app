// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function adjustCaptionHeight() {

  var heights = [ ];

  $(".caption").each(function() {
    heights.push( $(this).height() );
  });
  var max = Math.max.apply(null, heights);

  $(".caption").each(function() {
    $(this).height(max);
  });
}

function inheritCaptionHeight() {
  $(".caption").each(function() {
    $(this).css("height", "inherit");
  });
}

function checkAdjustCaptionHeight() {
  if ($("#mq-detector > span.visible-lg").is(":visible")) {
    adjustCaptionHeight();
  }
  else if ($("#mq-detector > span.visible-md").is(":visible")) {
    adjustCaptionHeight();
  }
  else if ($("#mq-detector > span.visible-sm").is(":visible")) {
    inheritCaptionHeight();
  }
  else if ($("#mq-detector > span.visible-xs").is(":visible")) {
    inheritCaptionHeight();
  }
  else { }
}

$(window).on('resize', checkAdjustCaptionHeight);

$(document).ready(function(){

  checkAdjustCaptionHeight();

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
