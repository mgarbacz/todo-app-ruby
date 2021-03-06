class TodosController < ApplicationController

  def index 
    @todos = Todo.all
  end

  def create
    @todo = Todo.new(params[:todo])

    respond_to do |format|
      if @todo.save
        format.html { 
          render :partial => 'todos/todo', :locals => { :todo => @todo }
        }
      else
        format.html { @todo.errors }
      end
    end
  end

  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { 
          render :partial => 'todos/todo', :locals => { :todo => @todo }
        }
      else
        format.html { @todo.errors }
      end
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { head :ok }
    end
  end

  def clear_done
    @todos = Todo.where(:done => true)
    @todos.destroy_all

    respond_to do |format|
      format.html { head :ok }
    end
  end

end
