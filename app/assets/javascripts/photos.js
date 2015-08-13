var intializeUploadButtons = function(button, target) {

  button.on('click', function() {
    target.click();
    return false;
  });  
};

var initializeImagePreview = function(uploader, preview) {

  $(uploader).change(function(event) {
    var file, input, reader;


    input = $(event.currentTarget);
    file = input[0].files[0];
    reader = new FileReader();

    reader.onload = function(e) {
      var image_base64 = e.target.result;
      preview.attr("src", image_base64);
    };
    console.log(file)

    reader.readAsDataURL(file);
  });
}

$(document).ready(function() {

  for (var i = 0; i < 6; i++) {
    initializeImagePreview($('#image-uploader-' + i), $('#image-previewer-' + i));
    intializeUploadButtons($('#button-image-uploader-' + i), $('#image-uploader-' + i));
  };
});
