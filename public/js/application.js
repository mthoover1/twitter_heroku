var username = '/Vanderln'
var getTweets = function(username) { 
    $.ajax({
    type: 'get',
    url: username,
    beforeSend: function() { $('.container').html('<img src="ajax-loader.gif">'); },
    success: function(data) { $('.container').html(data); }
  });
};

$(document).ready(function() {
  getTweets(username);

  $('#user-entry').on('submit', function(event) {
    event.preventDefault();
    username = '/' + $(this).find('input').val()
    getTweets(username);
  });

  $('#author').on('blur', function(event) {
    event.preventDefault();
    username = '/' + $(this).val()
    getTweets(username);
  });
});
