UI = function(){

  function initialize(){
    $('.datepicker').datepicker({format: 'yyyy-mm-dd'});
  }

  return {
    initialize: initialize
  }
}();