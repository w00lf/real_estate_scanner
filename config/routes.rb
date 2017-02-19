Rails.application.routes.draw do
  get 'dashboard/index'

  post :graphql, to: 'graphql#create'
  root 'dashboard#index'
end
