Checklist::Application.routes.draw do
  devise_for :users

  resources :tasks
  match '/tasks/:id/assign' => 'tasks#assign', :via => :post
  root to: 'tasks#index'
end
