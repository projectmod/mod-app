$(document).ready(function() {

  // Smoothen out parallax scrolling for Chrome Browsers
  if (window.addEventListener) {window.addEventListener('DOMMouseScroll', function(){});}
  window.onmousewheel = document.onmousewheel = function(){};

  var isMobile, parallax, speed;
  isMobile = /Android|webOS|iPhone|iPad|iPod|Silk|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);

  if (isMobile === false) {
    parallax = document.querySelectorAll('.parallax');
    speed = 0.5;
    [].slice.call(parallax).forEach(function(el,i){
      var pxAdjustment = $('.parallax').data().posAdjustment || 0
      console.log(pxAdjustment)
      var startingPos = window.pageYOffset - $(el).position().top - pxAdjustment
      $(el).css('background-position', '50% ' + startingPos * speed + 'px')
      window.onscroll = function() {
        var windowYOffset = (window.pageYOffset - $(el).position().top)
        var elBackgrounPos = "50% " + (windowYOffset - pxAdjustment) * speed + "px";
        el.style.backgroundPosition = elBackgrounPos;
      };
    });
  }
});
