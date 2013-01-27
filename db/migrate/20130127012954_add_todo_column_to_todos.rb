class AddTodoColumnToTodos < ActiveRecord::Migration
  def change 
    add_column :todos, :todo, :string
  end
end
