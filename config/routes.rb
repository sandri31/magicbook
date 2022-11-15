# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Ajoute la route pour aller vers la page top
  resources :cards do
    collection do
      get 'top'
    end
  end

  # Public pages
  root 'public#index'
  get 'about', to: 'public#about'
  # get 'terms', to: 'public#terms'
  get 'random', to: 'public#random'
  get 'construction', to: 'public#construction'
end
