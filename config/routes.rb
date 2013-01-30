TodoAppRuby::Application.routes.draw do
  root :to => 'todos#index'

  match 'todos' => 'todos#index', :via => :get
  match 'todos' => 'todos#create', :via => :post
  match 'todos/:id' => 'todos#update', :via => :put
  match 'todos/:id' => 'todos#destroy', :via => :delete
  match 'todos' => 'todos#clear_done', :via => :delete
end
