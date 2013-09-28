require 'sidekiq/web'

Rails4Bp::Application.routes.draw do
  
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root :to => 'application#index'

  devise_for :users

  mount Sidekiq::Web, at: '/sidekiq'

  resources :crews
  resources :profiles

  resources :pages do
    collection do
      post 'rebuild'
    end
  end

  resources :categories do
    collection do
      post 'rebuild'
    end
  end

  resources :countrylanguages do
    match 'advanced_search' => 'countrylanguages#advanced_search', on: :collection, via: [:get, :post], as: :advanced_search
    collection do
      #match ':language/:countrycode' => 'countrylanguages#view', :via => [:get, :post], :as => :countrylanguage
      match 'search' => 'countrylanguages#search', :via => [:get, :post], :as => :search
    end
  end

  resources :cities do
    match 'advanced_search' => 'cities#advanced_search', on: :collection, via: [:get, :post], as: :advanced_search
    collection do
      match 'search' => 'cities#search', :via => [:get, :post], :as => :search
    end
  end

  resources :countries do
    match 'advanced_search' => 'countries#advanced_search', on: :collection, via: [:get, :post], as: :advanced_search
    collection do
      match 'search' => 'countries#search', :via => [:get, :post], :as => :search
    end
  end

  resources :articles


  match "static" => "application#static", via: [:get, :post]


  #root to: 'dashboard#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
