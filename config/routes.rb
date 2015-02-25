GazeCore::Application.routes.draw do
  resources :toys

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  resources :tasks
  resources :food_reports, defaults: { format: :json }
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  get "api/v1/tasks/new" => "api/v1/tasks#new"
  get "api/v1/users/update" => "api/v1/users#update"
  get "api/v1/tasks/verified" => "api/v1/tasks#verified"

  # Example resource route (maps HTTP verbs to controller actions automatically):
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users
      resources :events
      resources :answers
      resources :tasks
    end
  end

  get "leaderboard" => "home#leaderboard"
  get "api/v1/events/answer" => "events#answer"
  post "api/v1/food_reports/new" => "tapshare#new_food_report"

  #get "api/v1/tasks/verified" => "tapshare#verified_tasks"

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
