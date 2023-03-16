Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  root to: 'static_pages#top'
  get 'about', to: 'static_pages#about'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users

  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
      get 'history'
    end
  end
end
