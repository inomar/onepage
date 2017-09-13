Rails.application.routes.draw do
  root 'home#index'

  #devise_for :authors
  devise_for :authors, :controllers => {
    :sessions => "authors/sessions",
    :registrations => "authors/registrations",
    :passwords     => "authors/passwords",
    :omniauth_callbacks => "authors/omniauth_callbacks",
   }
   resources :authors, :only => [:index, :show]

  resources :pages
	get 'pages/:id/preview', to: 'pages#preview', as: 'page_preview'

  resources :templates
	get 'templates/:id/duplicate', to: 'templates#duplicate', as: 'template_duplicate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
