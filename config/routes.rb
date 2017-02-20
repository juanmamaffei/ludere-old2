Rails.application.routes.draw do
  devise_for :usuarios
  get 'misions/mismisiones'

  get 'estrellas/nueva'
  post 'estrellas', to: 'estrellas#crear'
  
  resources :misions do
  	resources :objetivos
  	member do
  		put "like", to: "misions#upvote"
  		put "dislike", to: "misions#downvote"
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'root#index'
end
