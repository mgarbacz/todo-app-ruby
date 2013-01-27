class TodosController < ApplicationController

  # Declaring formats for all views
  respond_to :json, :except => :index

  def index 
    @todos = Todo.all
  end

  def create
    @todo = Todo.new(params[:todo])

    if @todo.save
      respond_with(@todo, :status => :ok, :location => root_path)
    else
      respond_with(@todo.errors, :status => :ok, :location => root_path)
    end
  end
end
