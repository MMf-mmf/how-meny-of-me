Rails.application.routes.draw do

  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get  '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get 'search', to: 'static_pages#search'
  #get '/results', to: 'static_pages#scrape_search_results'
  post '/results', to: 'static_pages#scrape_search_results'
  
  get 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get '/signup', to: 'users#new'
  get '/history', to: 'users#history'
  resources :users
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
