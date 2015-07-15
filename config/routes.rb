Rails.application.routes.draw do
  get 'rails/g'

  get 'rails/controller'

  get 'rails/profiles'

  get 'rails/g'

  get 'rails/controller'

  get 'rails/favorites'

  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  #JSON output feeds
  get 'data/users' => 'users#feed' #, constraints: {subdomain: 'api'}
  get 'data/users/:id' => 'users#user_feed' #, constraints: {subdomain: 'api'}

  #login handler
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'

  get 'profile' => 'users#profile'

  get 'greatestgood' => 'welcome#greatestgood'
  get 'template' => 'welcome#template'
  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  resources :users
  resources :groups
  resources :posts
  resources :favorites
  resources :topics
  resources :profiles
  resources :followers



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
