Stats = function(){
  var self = this;
  var googleWrapper = null;

  function initialize(google){
    googleWrapper = google;
    
  }

  return {
    initialize: initialize
  }
}();