Rails.application.routes.draw do
  get 'users/new'
  get '/signup', to: 'users#new'
  root 'static_pages#top'
end