class TodosController < ApplicationController

  # Declaring formats for all views
  respond_to :html, :json

  def index 
    @todos = Todo.all

    respond_with(@todos)
  end

  def create
    @todo = Todo.new(params[:todo])

    if @todo.save
      respond_with(@todo, :location => root_path)
    else
      respond_with(@todo.errors, :location => root_path)
    end
  end
end
