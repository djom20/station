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

    $(self).on("click", ".btn.cars", function(e){
      $('#car_form').validate();
    });
  }
  return {
    initialize: initialize
  }
}();