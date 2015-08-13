var runAnimation = function(elem1, elem2) {
  elem1.show();
  elem2.hide();

  elem1.addClass('animated fadeIn')
  setTimeout(function() {
    elem1.removeClass('animated fadeIn')
  }, 2000);
};

$(document).ready(function() {
  $('#merchant-steps').hide();
  $('#btn-customer').addClass('selected');

  $('#btn-customer').on('click', function() {

    $('#btn-customer').addClass('selected');
    $('#btn-salon').removeClass('selected');
    runAnimation($('#user-steps'), $('#merchant-steps'))
    return false;
  });

  $('#btn-salon').on('click', function() {

    $('#btn-salon').addClass('selected');
    $('#btn-customer').removeClass('selected');
    runAnimation($('#merchant-steps'), $('#user-steps'))
    return false;
  });
});
