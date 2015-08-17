$(document).ready(function() {
  $('form').on('click', '.add_fields', function(event) {
    var time = new Date().getTime();
    var regexp = new RegExp($(this).data('id'), 'g');
    var new_field = $(this).data('fields').replace(regexp, time);
    $('.working-day-fields').append(new_field)
    event.preventDefault();
  });
})
