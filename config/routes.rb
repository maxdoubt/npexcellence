Rails.application.routes.draw do
  root 'pages#show', :defaults => { :id => 'home' }

  resources :pages,           only: [:show]
  resources :uploads
  resource  :user_session,    only: [:new,  :create, :destroy]

  # named routes (sessions)
  match "access(/:access_code)"         => "admissions#create",      :as => :access,  via: [:get, :post]
  match "confirm(/:confirmation_code)"  => "confirmations#create",   :as => :confirm, via: [:get, :post]
  match "login"                         => "user_sessions#new",      :as => :login,   via: [:get, :post]
  match "logout"                        => "user_sessions#destroy",  :as => :logout,  via: [:get, :post]


  namespace :admin do
    # collection resource routes
    resources :pages do
      member do
        get 'test'
      end
      collection do
        post 'reorganize', :format => 'json'
      end
    end

  end

end
