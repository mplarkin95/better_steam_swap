Rails.application.routes.draw do
  root            'home#new'
  get 'signup' =>'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get  'steampull' => 'steampull#new'
  post 'steampull' => 'steampull#create'
  patch 'steampull' =>'steampull#update'
  get 'wishlist' => 'wishlist#new'
  post 'wishlist' => 'wishlist#create'
  post 'wishlistdelete' =>'wishlist#destroy'
  get 'messages' => 'messages#index'
  get 'search' => 'search#index'
  get 'newmessage' => 'messages#new'
  post 'messages' => 'messages#create'
  post 'messages/update_seen' => 'messages#update_seen'
  post 'messages/delete' => 'messages#delete'
  post 'wishlist/update' => 'wishlist#update'
  resources :users
  resources :items



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
