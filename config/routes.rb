TodoAppRuby::Application.routes.draw do
  root :to => 'todo#todos'

  match 'create' => 'todo#create', :via => :post
end
