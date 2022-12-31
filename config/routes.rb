Rails.application.routes.draw do
  root to: 'static_pages#top'
  get 'maps/index'
  get 'about', to: 'static_pages#about'
end
