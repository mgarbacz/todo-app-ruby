require 'spec_helper'

feature 'todos page' do
  before(:each) do
    visit '/'
  end

  def valid_attributes_hash
    { :todo => 'Test todo' }
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
    todo = Todo.new(valid_attributes_hash)
    if todo.save
      visit '/'
      all('li.todo').should have(1).items
    end
  end

  it 'should show todo for todo item' do
    todo = Todo.new(valid_attributes_hash)
    if todo.save
      visit '/'
      find('li.todo').should have_content(valid_attributes_hash[:todo])
    end
  end

  it 'should display new todo form' do
    page.should have_selector('form#new_todo')
  end

  it 'should display input for todo todo' do
    page.should have_selector('form#new_todo input#todo_todo')
  end

  it 'should display submit button for todo' do
    page.should have_selector('form#new_todo input#todo_submit')
  end
end
