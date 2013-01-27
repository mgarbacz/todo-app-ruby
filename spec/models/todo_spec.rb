require 'spec_helper'

describe Todo do
  before(:each) do
    @todo = Todo.new(valid_attributes_hash)
  end

  def valid_attributes_hash
    { :todo => 'Test todo', :done => true }
  end

  it 'should be valid' do
    @todo.should be_valid
  end

  it 'should not be valid without a todo' do
    @todo.todo = ''
    @todo.should_not be_valid
  end

  it 'should not be valid without a done' do
    @todo.done = nil
    @todo.should_not be_valid
  end
end
