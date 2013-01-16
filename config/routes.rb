VacationsManagement::Application.routes.draw do
  resources :employees do
    collection do
      get 'search', :action=>'search'
	  end
	  resources :vacations, :only=>[:new, :create, :destroy, :index, :show]
  end
  
  devise_for :users, :controllers=>{:registrations=>'my_registrations'}
  
  namespace :public, :path_prefix=>'site' do
    get 'find_employee', :action=>'find_employee', :controller=>:employees, :as=>'find_employee'
    post 'search_result_details', :action=>'search_result_details', :controller=>:employees, :as=>'search_result_details'
  end

  get 'my_account' => 'users#edit_self', :as=>:edit_self
  put 'update_account' => 'users#update_self', :as=>:update_self

  resources :users
  
  root :to => 'employees#index'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
