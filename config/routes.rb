Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations" }
  root to: 'books#index'

  concern :commentable do
    resources :comments, only: %i[create edit update destroy]
  end

  resources :books do
    scope module: :books do
      concerns :commentable
    end
  end
  resources :reports do
    scope module: :reports do
      concerns :commentable
    end
  end
  resources :users, only: %i[index show] do
    resource :relationships, only: %i[create destroy]
    scope module: :users do
      resources :followings, only: [:index]
      resources :followers, only: [:index]
    end
  end
end
