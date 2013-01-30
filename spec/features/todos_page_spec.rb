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

  it 'should display all todos that are in database' do
    todo_count = Todo.all.count
    all('li.todo').should have(todo_count).items

    todo = Todo.create! valid_attributes_hash
    visit '/'
    all('li.todo').should have(todo_count + 1).items
  end

  it 'should show todo for todo item' do
    todo = Todo.create! valid_attributes_hash
    visit '/'
    find('li.todo').should have_content(valid_attributes_hash[:todo])
  end

  it 'should show checkbox for todo item' do
    todo = Todo.create! valid_attributes_hash
    visit '/'
    find('li.todo').should have_selector('input.todo_done') 
  end

  it 'should have true class todo on check of checkbox' do
    todo = Todo.create! valid_attributes_hash
    visit '/'
    page.should have_selector('input.todo_done_false') 
    check('todo_done_1')
    page.should have_selector('input.todo_done_true') 
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

  it 'should add todo to todos list when submitted' do
    todo_count = all('li.todo').count
    within('form#new_todo') do
      fill_in('todo_todo', 
        :with => valid_attributes_hash[:todo])
      click_button('todo_submit')
    end
    all('li.todo').should have(todo_count + 1).items
  end
end
