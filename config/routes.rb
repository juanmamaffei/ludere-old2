Rails.application.routes.draw do
  resources :objetivos
  resources :misions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'misions#index'
end
