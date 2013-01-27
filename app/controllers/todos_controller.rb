class TodosController < ApplicationController

  # Declaring formats for all views
  respond_to :html, :json

  def index 
    @todos = Todo.all

    respond_with(@todos)
  end

  def create
    @todo = Todo.create(params[:todo])

    respond_with(@todo, :location => root_path)
  end
end
