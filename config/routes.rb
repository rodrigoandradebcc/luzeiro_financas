Rails.application.routes.draw do
  resources :results
  resources :second_synthetic_accounts
  resources :analytic_accounts
  resources :synthetic_accounts
  resources :operations, except: [:edit, :update]
  resources :accounts
  resources :account_types
  resources :chart_of_accounts
  resources :companies
  resources :form_wizard
  get 'checar_data', to: 'results#check_valid_date', as: :check_valid_date
  get 'selecionar_periodo', to: 'results#selecionar_periodo', as: :result_search
  get 'control_users/index'
  devise_for :users
  get 'welcome/index'
  get 'livro_diario', to: 'operations#index', as: :ledger
  get 'cadastrar/contas', to: 'form_wizard#index', as: :wizard_index
  resources :enterprises
  
  get 'analytic_ledger/:id', to: 'analytic_accounts#analytic_ledger', as: :analytic_ledger
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
