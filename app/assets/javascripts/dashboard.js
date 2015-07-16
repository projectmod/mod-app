$(document).ready(function() {

  $('#prev-app-collapse').on('show.bs.collapse', function() {
    $('#prev-app-icon').removeClass("fa fa-plus").addClass("fa fa-minus");
  });

  $('#prev-app-collapse').on('hide.bs.collapse', function() {
    $('#prev-app-icon').removeClass("fa fa-minus").addClass("fa fa-plus");
  });
});
