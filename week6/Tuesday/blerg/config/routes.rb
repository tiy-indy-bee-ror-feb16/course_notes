Rails.application.routes.draw do
  mount Payola::Engine => '/payola', as: :payola
  namespace :admin do
    resources :authors
    resources :comments
    resources :posts
    resources :tags
    get '/users/:id' => 'authors#show'
    root to: "authors#index"
  end

  resources :authors do
    resources :comments, only: [:create, :destroy, :show]
    resources :posts
  end

  resources :posts do
    resources :comments, only: [:create, :show]
  end

  resources :comments, only: [:index] do
    resources :comments, only: [:create, :show]
  end

  resources :tags, only: [:show]

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create', as: :login_create
  delete '/logout' => 'sessions#destroy', as: :logout

  get '/signup' => 'authors#new', as: :signup
  get '/order/complete/:id' => 'order#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'posts#index'

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

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
