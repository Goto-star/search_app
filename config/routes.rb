Rails.application.routes.draw do
  root to: 'static_pages#top'
  get 'about', to: 'static_pages#about'

  devise_for :users
end
