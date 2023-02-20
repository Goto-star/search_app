Rails.application.routes.draw do
  root to: 'static_pages#top'
  get 'about', to: 'static_pages#about'
  get 'users/show'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end
