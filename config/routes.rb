TodoAppRuby::Application.routes.draw do
  root :to => 'todos#index'

  match 'index' => 'todos#index', :via => :get
  match 'create' => 'todos#create', :via => :post
  match 'update/:id' => 'todos#update', :via => :put
end
