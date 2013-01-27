// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  $('form#new_todo').bind('ajax:success', function(xhr, data, status) {
    $('ul.todos').append(data);
    $('input#todo_todo').val('');
  });
});
