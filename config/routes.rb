Rails.application.routes.draw do
  root to: 'static_pages#top'
  get 'static_pages/about'
end
