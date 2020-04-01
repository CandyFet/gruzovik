Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  if Rails.env.development?
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  else
    mount RailsAdmin::Engine => '/madmin', as: 'rails_admin'
  end

  devise_for :users, only: [:sessions, :confirmations]

  resources :news, only: [:index, :show]

  resources :promotions, only: [:index]

  resources :catalog, only: [:index] do
    collection do
      get 'price'
      get 'mark/:mark', action: :mark, as: :mark
      get 'model/:model', action: :model, as: :model
      post 'part'
    end
  end

  resources :products, only: [:show] do
    collection do
      get 'price/:id', action: :price, as: :price
    end
    member do
      get ':part', action: :part, as: :part
    end
  end

  resources :pages, only: [:show] do
    collection do
      get 'sto'
      get 'carwash'
      get 'rental'
    end
  end

  resource :cart, only: [:show] do
    collection do
      post :add_part
      delete :remove_part
      post 'change_amount/:li', action: :change_amount, as: :change_amount
    end
  end

  resource :orders, only: [:new, :create]

  get 'company', to: 'pages#company'
  # get 'employees', to: 'pages#employees'

  namespace :forms do
    post 'sto'
    post 'carwash'
    post 'rental'
  end

  get 'search' => 'general#search'
  post 'search_mark' => 'general#search_mark'
  post 'search_model' => 'general#search_model'
  post 'search_price_subcategory' => 'general#search_price_subcategory'
  post 'search_price_lastcategory' => 'general#search_price_lastcategory'

  root to: 'general#index'

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
