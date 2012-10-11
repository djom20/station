Tanking = function(){
  var self = this;

  function initialize(){

    $(self).on('click', 'a.create_gas_station', function(e){
      var url = $(this).attr("href");
      var stationName = $('#station_name').val();
      $.ajax({
        url: "/gas_stations",
        type: 'POST',
        dataType: 'json',
        data: {
          "station[name]": stationName
        },
        success: function(){
          $('#tanking_log_gas_station').empty();
          $.getJSON('/gas_stations', function(data, textStatus, jqXHR){
            $.each(data, function(index, value){
              $('<option value='+value.name+'/>').html(value.name).appendTo($('#tanking_log_gas_station'));
            });
            $('#tanking_log_gas_station').find('option[value='+stationName+']').first().attr("selected", "selected");  
          });
          
        },
        failure: function(){

        }
      });

      return false;
    })
  }

  function getGasStations(){
    $.getJSON('/gas_stations', function(data, textStatus, jqXHR){
      $.each(data, function(index, value){
        $('<option value='+value.name+'/>').html(value.name).appendTo($('#tanking_log_gas_station'));
      });
      
    });
  }

  return {
    initialize: initialize,
    getGasStations: getGasStations
  }
}();
