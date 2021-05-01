require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'
  root to: 'homepage#index'

  resources :websites do
  end

  resources :links do
  end

  get '/parse' => 'parser#parse', as: :parse

  resources :parsers do
  end

  resources :websites do
  end
end
