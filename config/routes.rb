# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cards do
    collection do
      get 'search'
    end
  end

  # Public pages
  get 'public/index'
  root 'public#index'
  get 'about', to: 'public#about'
  get 'terms', to: 'public#terms'
  get 'random', to: 'public#random'
end
