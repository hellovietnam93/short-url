# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homes#index"
  resources :links, only: :index
  post "encode", to: "links#create"
  get "decode", to: "links#decode"
  get "/s/:slug", to: "links#show", as: :short
end
