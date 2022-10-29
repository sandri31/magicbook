# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cards do
    get 'search', to: 'cards#search', on: :collection
  end

  # Public pages
  root 'public#index'
  get 'about', to: 'public#about'
  get 'terms', to: 'public#terms'
  get 'random', to: 'public#random'
  get 'construction', to: 'public#construction'
end
