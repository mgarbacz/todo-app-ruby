TodoAppRuby::Application.routes.draw do
  root :to => 'todos#index'

  match 'create' => 'todos#create', :via => :post
end
