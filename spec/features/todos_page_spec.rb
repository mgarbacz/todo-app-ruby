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
end
