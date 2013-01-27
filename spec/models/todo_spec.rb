require 'spec_helper'

describe Todo do
  before(:each) do
    @todo = Todo.new(valid_todo_hash)
  end

  def valid_todo_hash
    { :todo => 'Test todo.', :done => false  }
  end

  it 'should be valid' do
    @todo.should be_valid
  end

end
