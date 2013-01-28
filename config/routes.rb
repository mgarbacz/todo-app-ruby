TodoAppRuby::Application.routes.draw do
  root :to => 'todos#index'

  match 'index' => 'todos#index', :via => :get
  match 'create' => 'todos#create', :via => :post
end
