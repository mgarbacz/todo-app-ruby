class TodoController < ApplicationController
  def todos
    @todos = Todo.all
  end
end
