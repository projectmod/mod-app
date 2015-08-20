var showLoading = function(button, buttonLoading) {
  $(button).on('click', function() {
    $(button).addClass('hidden');
    $(buttonLoading).removeClass('hidden');
  });
};

$(document).ready(function() {
  showLoading(('#signup-one-button'), ('#signup-one-loading'));
});
