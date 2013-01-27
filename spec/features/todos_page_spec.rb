require 'spec_helper'

feature 'todos page' do
  before(:each) do
    visit '/'
  end

  it 'should be root' do
    page.should have_content('Your Todos')
  end

  it 'should display todos' do
    find('ul.todos').should be_true
  end

  it 'should display no todos if none are in database' do
    todo_count = Todo.all.count
    all('li.todo').should have(todo_count).items
  end

  it 'should display all todos that are in database' do
    todo = Todo.new( { :todo => 'Test todo', :done => true } )
    if todo.save
      visit '/'
      all('li.todo').should have(1).items
    end
  end

  it 'should display new todo form' do
    page.should have_selector('form#new_todo')
  end

  it 'should display input for todo todo' do
    page.should have_selector('input#todo_todo')
  end
end
