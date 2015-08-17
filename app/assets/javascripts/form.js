$(document).ready(function() {
  $('form').on('click', '.add_fields', function(event) {
    var new_field = $(this).data('fields');
    $('.working-day-fields').append(new_field);
    event.preventDefault();
  });
})
