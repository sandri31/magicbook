# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :cards do
    get 'top', to: 'cards#top'
  end

  # Public pages
  root 'public#index'
  get 'about', to: 'public#about'
  get 'terms', to: 'public#terms'
  get 'random', to: 'public#random'
  get 'construction', to: 'public#construction'
end
