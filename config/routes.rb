require 'sidekiq/web'

Rails4Bp::Application.routes.draw do

  resources :countries
  resources :cities
  resources :pages
  resources :categories
  resources :countrylanguages

  root :to => 'application#index'

  devise_for :users, :path => "auth", :path_names => {:sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'sign_up'}

  authenticate :user do
    mount Sidekiq::Web => "/sidekiq"
    mount Sidekiq::Monitor::Engine => "/sidekiq_monitor"
  end

end
