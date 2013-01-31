// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function onAddTodo() {
  $('form#new_todo').bind('ajax:success', function(xhr, data, status) {
    $('ul.todos').append(data);
    $('input#todo_todo').val('');
    onUpdateTodo();
    onDeleteTodo();
  });
}

function onUpdateTodo() {
  $('form.edit_todo').bind('ajax:success', function(xhr, data, status) {
    $(this).parent().replaceWith(data);
    onUpdateTodo();
    onDeleteTodo();
  });
}

function onDeleteTodo() {
  $('a.todo_destroy').bind('ajax:success', function(xhr, data, status) {
    $(this).parent().remove();
  });
}

function onClearTodos() {
  $('#clear_done_todos').bind('ajax:success', function(xhr, data, status) {
    $('li.todo_done_true').remove();
  });
}

$(function() {
  onAddTodo();
  onUpdateTodo();
  onDeleteTodo();
  onClearTodos();
});
