# frozen_string_literal: true

Rails.application.routes.draw do
  resource :comments, only: %i[create update destroy]
  devise_for :users
  
  resources :users, only: %i[index show]

  resources :posts
  devise_scope :user do
    # root to: 'devise/registrations#new'

    root to: 'home#index'
  end
end
