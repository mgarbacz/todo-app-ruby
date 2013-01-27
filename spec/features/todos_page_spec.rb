require 'spec_helper'

feature 'todos page' do
  it 'should be root' do
    visit '/'
    page.should have_content('Your Todos')
  end

  it 'should display todos' do
    visit '/'
    find('ul.todos').should be_true
  end

  it 'should display no todos if none are in database' do
    visit '/'
    todo_count = Todo.all.count
    all('li.todo').should have(todo_count).items
  end

  it 'should display all todos that are in database' do
    todo = Todo.new( { :todo => 'Test todo', :done => true } )
    todo.save
    visit '/'
    all('li.todo').should have(1).items
  end
end
