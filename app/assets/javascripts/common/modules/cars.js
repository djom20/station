Cars = function(){
  var self = this;
  function initialize(){
   
    $(self).on("click", "table.cars tbody tr", function(e){
      
      var carSlug = $(this).data('car-slug');
      var previewUrl = $(this).data('preview-url');
      $.get(previewUrl, function(data, textStatus, jqXHR){
        $('#display_car').html(data);
      });

    });
  }
  return {
    initialize: initialize
  }
}();