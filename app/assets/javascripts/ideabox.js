$(document).ready(function() {
  bindListeners();
});

bindListeners = function() {
  $('#newIdea').on('click', function(event) {
    event.preventDefault();
    createEvent();
  });
};

createEvent = function() {
  var $title = $('#newIdeaTitle').val();
  var $body = $('#newIdeaBody').val();

  $.ajax({
    type: "POST",
    url: "api/v1/ideas",
    dataType: "json",
    data: {
      idea: {title: $title, body: $body}
    }
  }).then(function(data) {
    console.log(data);
  });
}
