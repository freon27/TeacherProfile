Teacherprofile::Application.routes.draw do
  
  resources :main_pages, :only => [:show, :edit, :update]
  resources :philosophy_pages, :only => [:show, :edit, :update]
  resources :experience_pages, :only => [:show, :edit, :update] do
    resources :positions
    resources :qualifications
  end
  resources :qualifications do
    resources :subjects
  end
  
  
  resources :users do
    member do
      get 'dashboard'
    end
  end
  
  resource :session, :controller => 'sessions'

  resources :users, :controller => 'clearance/users', :only => [:new, :create] do
    resource :password,
      :controller => 'passwords',
      :only       => [:create, :edit, :update]
  end

  resources :profiles

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "clearance/sessions#new"
  
  match '/sign_in',  :to => 'clearance/sessions#new'
  # See how all your routes lay out with "rake routes
end