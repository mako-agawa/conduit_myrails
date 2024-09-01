Rails.application.routes.draw do

  # Root path to index action
  root "articles#index"

  # CRUD routes without using resources
  get    'users',          to: 'users#index',   as: 'users'
  get    'signup',      to: 'users#new',     as: 'signup'
  post   'users',          to: 'users#create'
  get    'users/:id',      to: 'users#show',    as: 'user'
  get    'users/:id/edit', to: 'users#edit',    as: 'edit_user'
  patch  'users/:id',      to: 'users#update'
  put    'users/:id',      to: 'users#update'
  delete 'users/:id',      to: 'users#destroy'

  get    "/login",   to: "sessions#new",     as: 'login'
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"


  resources :articles

end
