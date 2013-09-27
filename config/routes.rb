Lancemine::Application.routes.draw do
  resources :projects

  match '/signin', to: 'sessions#create', via: :post  
  match '/signout', to: 'sessions#destroy', via: :delete  

  root to: 'projects#index'
end
