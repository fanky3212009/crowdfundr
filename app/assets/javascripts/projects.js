// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready', function () {
  $('.rewards-show').click(function () {
    var reward = $(this);
    var contribution = parseInt(reward.find('.reward-contribution').html());      // get reward amount

    $(reward.find('#pledge_amount')).val(contribution);           // fill out the 'amount field' before submitting
    //TODO fill out user_id & project_id before submitting
    $(reward.find('#pledge_project_id')).val(1);
    $(reward.find('#pledge_user_id')).val(1);

    $(reward.find('.rewards-form')).submit();                     // submit form
  });
});
