// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
  $(document).on('ready page:load', function () {
    // $('.tag-form').hide();

    $('.new_tag').on('submit', function (e) {
      e.preventDefault();

      $.ajax({
        url: $(this).attr('action'),
        method: 'POST',
        data: $(this).serialize(),
        dataType:'script'
        // success: function (data) {
        //
        //   console.log(data);
        //   if (data) {
        //     $('#project-tags-list').append('<div class="each-tag">' + data + '</div>');
        //   }
        // },
        // error: function () {
        //   console.log("errors!");
        // }
      });
    })

    $('.add-new-tag').on('click', function (e) {
      e.preventDefault();
      $('.tag-form').css("display", "block");


      // e.preventDefault();
      //
      // $.ajax({
      //   url: $(this).attr('href'),
      //   method: 'GET',
      //   dataType:'json',
      //   success: function (data) {
      //     if (data) {
      //       $(this).append(data);
      //     }
      //   }
      // });
    });
  });
