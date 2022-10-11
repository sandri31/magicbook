# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cards
  resources :cards do
    post :search, on: :collection
  end
  get 'public/home'
  get 'public/about'
  get 'public/terms'

  root 'public#home'
end
