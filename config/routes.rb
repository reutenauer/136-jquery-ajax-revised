Checklist::Application.routes.draw do
  devise_for :users

  resources :tasks
  match '/tasks/:id' => 'tasks#assign', :via => :post
  root to: 'tasks#index'
end
