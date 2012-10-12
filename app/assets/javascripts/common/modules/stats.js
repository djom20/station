Stats = function(){
  var self = this;
  var googleWrapper = null;

  function drawChart(google){

    $.getJSON("/stats/expense", function(data, textStatus, jqXHR){
      // Create the data table.
      var data = google.visualization.arrayToDataTable(data);
      

      // Set chart options
      var options = {
          title: 'Expenses by Car',
          vAxis: {title: 'Car',  titleTextStyle: {color: 'red'}}
        };

      // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.BarChart(document.getElementById('by_car'));
      chart.draw(data, options);
    });
    

    $.getJSON("/stats/gas_stations", function(data, textStatus, jqXHR){
      // Create the data table.
      var data = google.visualization.arrayToDataTable(data);
      

      // Set chart options
      var options = {
          title: 'Expenses by Gas Station',
          vAxis: {title: 'Gas Station',  titleTextStyle: {color: 'red'}}
        };

      // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.BarChart(document.getElementById('by_station'));
      chart.draw(data, options);
    });
  }
 
  return {
    drawChart: drawChart
  }
}();