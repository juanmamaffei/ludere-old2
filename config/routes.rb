Rails.application.routes.draw do
  devise_for :usuarios
  resources :misions do
  	resources :objetivos
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'misions#index'
end
