Rails.application.routes.draw do
  
  resources :grupos do
    resources :posts
  end

  devise_for :usuarios
  get 'misions/mismisiones'

  get 'estrellas/nueva' #Habilitar sólo para pruebas
  post 'estrellas', to: 'estrellas#crear'
  post 'autoes', to: 'estrellas#crearauto'

  get 'usuarios', to: 'usuarios#index'
  get 'usuarios/:idusuario', to: 'usuarios#mostrar', as:'veruser'
  
  patch 'usuarios/darestrellas', to: 'estrellas#darestrellas'
  put 'usuarios/darestrellas', to: 'estrellas#darestrellas'
  
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
