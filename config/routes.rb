# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :cards do
    collection do
      get 'top'
    end
  end

  # Public pages
  root 'public#index'
  get 'random', to: 'public#random'
  get 'contact', to: 'contacts#new', as: 'contact'
  resources :contacts, only: %i[new create]
end
