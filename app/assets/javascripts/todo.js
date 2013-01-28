// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function updateTodoList() {
  $('form#new_todo').bind('ajax:success', function(xhr, data, status) {
    $('ul.todos').append(data);
    $('input#todo_todo').val('');
  });
}

function updateTodoDone() {
  $('form.edit_todo').bind('ajax:success', function(xhr, data, status) {
    $(this).parent().replaceWith(data);
    updateTodoDone();
  });
}

$(function() {
  updateTodoList();
  updateTodoDone();
});
