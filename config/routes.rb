Rails.application.routes.draw do
  devise_for :usuarios
  get 'misions/mismisiones'

  get 'estrellas/nueva' #Habilitar sólo para pruebas
  post 'estrellas', to: 'estrellas#crear'

  get 'usuarios', to: 'usuarios#index'
  get 'usuarios/:idusuario', to: 'usuarios#mostrar', as:'veruser'
  
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
