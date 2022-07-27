Rails.application.routes.draw do
  get 'public/home'
  get 'public/about'
  get 'public/terms'

  root 'public#home'
end
