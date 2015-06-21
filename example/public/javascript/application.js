$(function() {
  var config = {};
  var widgetsContainer = $("#widgets");
  window.suricate = new Suricate.Application(widgetsContainer, config);
  suricate.start();
});
