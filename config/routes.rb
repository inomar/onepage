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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
