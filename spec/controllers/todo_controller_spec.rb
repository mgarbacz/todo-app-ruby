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

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested todo' do
        todo = Todo.create! valid_attributes_hash
        put :update, { :id => todo.to_param, :done => true }, {}
      end

      it 'assigns the requested todo as todo' do
        todo = Todo.create! valid_attributes_hash
        put :update, { :id => todo.to_param, :done => true }, {}
        assigns(:todo).should be_a(Todo)
      end

      it 'responds with the partial for updated todo' do
        todo = Todo.create! valid_attributes_hash
        put :update, { :id => todo.to_param, :done => true }, {}
        response.should render_template('todos/_todo')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested todo' do
      todo = Todo.create! valid_attributes_hash
      expect {
        delete :destroy, { :id => todo.to_param }, {}
      }.to change(Todo, :count).by(-1)
    end
  end

end
