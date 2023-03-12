Rails.application.routes.draw do
  root to: 'static_pages#top'
  get 'about', to: 'static_pages#about'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users

  resources :posts do
    collection do
      get 'search'
      get 'history'
    end
  end
end
