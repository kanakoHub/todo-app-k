Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#index'

  resources :boards do
    resources :tasks, only: %i[show edit update new create destroy] do
      resources :comments, only: [:new, :create]
    end
  end

  resource :profile, only: %i[show edit update]
end
