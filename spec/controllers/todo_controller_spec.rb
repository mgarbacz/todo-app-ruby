require 'spec_helper'

describe TodosController do

  def valid_attributes_hash
    { :todo => 'Test todo' }
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

      it 'assigns a newly created todo as todo' do
        post :create, { :todo => valid_attributes_hash }, {}
        assigns(:todo).should be_a(Todo)
      end

      it 'responds with the partial for created todo' do
        post :create, { :todo => valid_attributes_hash }, {}
        response.should render_template('todos/_todo')
      end
    end
  end

end
