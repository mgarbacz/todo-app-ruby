require 'spec_helper'

describe TodosController do

  def valid_attributes_hash
    { :todo => 'Test todo', :done => true }
  end

  describe 'GET "todos"' do
    it 'returns http success' do
      get 'index'
      response.should be_success
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Todo' do
        expect {
          post :create, { :todo => valid_attributes_hash }, {}
        }.to change(Todo, :count).by(1)
      end
    end
  end

end
