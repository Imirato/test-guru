# frozen_string_literal: true

Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: %i[create]

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
