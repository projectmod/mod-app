var initializeAccordian = function(elem, icon) {

  elem.on('show.bs.collapse', function() {
    icon.removeClass("fa-plus").addClass("fa-minus");
  });

  elem.on('hide.bs.collapse', function() {
    icon.removeClass("fa-minus").addClass("fa-plus");
  });
};

$(document).ready(function() {
  
  // Initialize Previous Appointment Accordian
  initializeAccordian($('#prev-app-collapse'), $('#prev-app-icon'))
});
