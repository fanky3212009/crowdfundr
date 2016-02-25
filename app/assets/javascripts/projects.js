// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready page:load', function () {
    $('.rewards-form').submit(function (e) {
      e.preventDefault();

      $.ajax({
        url: $(this).attr('action'),
        method:'POST',
        data: $(this).serialize(),
        dataType: 'json',
        success: function (data) {
          if (data) {
            $('#pledge-total').html(data);
          }
        },
        error: function () {
          console.log("Errors!");
        }
      });
    });

    $('.rewards-show').click(function () {
        var self = $(this);

        self.find('.rewards-form').trigger('submit');



    });
}) // });




    //
    // var contribution = parseInt(reward.find('.reward-contribution').html());      // get reward amount
    //
    // $(reward.find('#pledge_amount')).val(contribution);           // fill out the 'amount field' before submitting

    // TODO fill out user_id & project_id before submitting
    // // $(reward.find('#pledge_project_id')).val(2);
    // $(reward.find('#pledge_user_id')).val(1);
    // console.log('working');
    //
    // $(reward.find('.rewards-form')).submit();                     // submit form
