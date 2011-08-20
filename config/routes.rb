Teacherprofile::Application.routes.draw do
  
  resources :main_pages, :only => [:show, :edit, :update]
  resources :philosophy_pages, :only => [:show, :edit, :update]
  resources :experience_pages, :only => [:show, :edit, :update] do
    resources :positions
    resources :qualifications
  end
  
  resources :subject_areas
  
  resources :sample_work_pages, :only => [:show, :edit, :update] do
    resources :subject_areas
  end

  resources :qualifications do
    resources :subjects
  end
  
  resources :passwords,
     :controller => 'passwords',
     :only       => [:new, :create]
  
  
  resource  :session,
     :controller => 'sessions',
     :only       => [:new, :create, :destroy]

  resources :users do
    resource :password,
      :controller => 'passwords',
      :only       => [:create, :edit, :update]
      
    member do
      get 'dashboard'
    end
  end

  resources :profiles do
    member do
      put 'publish'
      put 'unpublish'
    end
  end

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
  root :to => "sessions#new"
  
  match '/sign_in',  :to => 'sessions#new'
  match '/sign_up'  => 'users#new', :as => 'sign_up'
  match 'sign_out' => 'sessions#destroy', :via => :delete, :as => 'sign_out'
  # See how all your routes lay out with "rake routes
end
