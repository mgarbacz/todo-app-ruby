TodoAppRuby::Application.routes.draw do
  root :to => 'todos#index'

  match 'create' => 'todo#create', :via => :post
end
