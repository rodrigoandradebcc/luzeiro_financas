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
  


devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  authenticated :user do
      root 'welcome#dashboard', as: :authenticated_root
  end

  

  get 'checar_data', to: 'results#check_valid_date', as: :check_valid_date
  get 'selecionar_periodo', to: 'results#selecionar_periodo', as: :result_search
  get 'control_users/index'
  get 'dashboard', to: 'welcome#dashboard', as: :dashboard
  get 'livro_diario', to: 'operations#index', as: :daily_ledger
  get 'livro_razao', to: 'ledger#index', as: :ledger
  get 'cadastrar/contas', to: 'form_wizard#index', as: :wizard_index
  resources :enterprises
  post 'authorize_operation/:id', to: 'operations#authorize_operation', as: :authorize_operation
  get 'analytic_ledger/:id', to: 'analytic_accounts#analytic_ledger', as: :analytic_ledger
  get 'home', to: 'home#visitors', as: :visitors
  get 'nova_senha', to: 'home#password', as: :forget_password
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  root 'home#visitors'

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
