class TodosController < ApplicationController

  def index 
    @todos = Todo.all
  end

  def create
    @todo = Todo.new(params[:todo])

    respond_to do |format|
      if @todo.save
        format.html { render :partial => 'todos/todo' }
      else
        format.html { @todo.errors }
      end
    end
  end

end
