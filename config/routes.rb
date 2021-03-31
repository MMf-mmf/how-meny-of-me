Rails.application.routes.draw do
  get 'user/new'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get  '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get 'search', to: 'static_pages#search'
  post '/results', to: 'static_pages#scrape_search_results'

  get '/signup', to: 'users#new'
  #get 'users', to: 'users#show'
  resources :users
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
