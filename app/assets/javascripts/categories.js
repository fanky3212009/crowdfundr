// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready page:load', function () {
  $(window).scroll(function() {
   if ($(window).scrollTop() > $(document).height() - $(window).height() - 50) {
     return alert('near bottom');
   }
  });
});
