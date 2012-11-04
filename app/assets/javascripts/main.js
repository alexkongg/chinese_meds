jQuery(function($){
    $(".chosen").chosen({no_results_text: "No results matched"});
});

CM = {
  setup: function() {
    $('#mainPopUp').hide();
  }
}

$(CM.setup);


$(function() {                         
  $('#Browse').click(function () {
    $('#mainPopUp').show('slow');
    $('#Browse').hide(1200);
    })
});

$(document).ready(function(){
  $('.herbs li:nth-child(odd)').addClass('alternate');
});