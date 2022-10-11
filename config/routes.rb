# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cards
  resources :cards do
    post :search, on: :collection
  end

  # Public pages
  get 'public/index'
  root 'public#index'
  get 'about', to: 'public#about'
  get 'terms', to: 'public#terms'
  get 'random', to: 'public#random'
end
