require 'sidekiq/web'

Rails4Bp::Application.routes.draw do

  resources :topics

  resources :projects
  resources :folders
  resources :companies
  resources :crews
  resources :countries
  resources :cities
  resources :profiles
  resources :pages
  resources :categories
  resources :countrylanguages
  resources :articles

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root :to => 'application#index'

  devise_for :users, :path => "auth", :path_names => {:sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'sign_up'}

  mount Sidekiq::Web, at: '/sidekiq'

end
