$(document).ready(function() {
  appendIdea();
  fetchIdeas();
});

function fetchIdeas() {
  $.ajax({
    type: "GET",
    url: "api/v1/ideas",
    success: function(ideas) {
      $.each(ideas, function(index, idea) {
        renderIdea(idea);
      });
    }
  })
}

appendIdea = function() {
  $('#newIdea').on('click', function(event) {
    createIdea();
  });
}

function renderIdea(idea) {
  $("#ideas").append(
  "<div class='idea' data-id=" +
  idea.id +
  "><h6>Title: " +
   idea.title +
   "</h6><p>Body: " +
   idea.body +
   "</p>" +
   '<div class="buttons">' +
   '<button class="edit">Edit</button>' +
   '<button class="delete">Delete</button>' +
   '<form class="edit-idea-form">' +
   '<label>Title</label>' +
   '<input type="text" placeholder="Title" class="idea-title">' +
   '<label>Body</label>' +
   '<input type="text" placeholder="Body" class="idea-body">' +
   '<input type="submit" class="update" value="Update Idea">' +
   '</form>' +
   '</div>' +
   '</div>'
   )
}

createIdea = function() {
  var $title = $('#newIdeaTitle').val();
  var $body = $('#newIdeaBody').val();
  $.ajax({
    type: "POST",
    url: "api/v1/ideas",
    data: { idea: {title: $title, body: $body} },
    sucess: function(data) {
      appendIdea(data);
      $('#newIdeaTitle').val('');
      $('#newIdeaBody').val('');
    }
  });
}
