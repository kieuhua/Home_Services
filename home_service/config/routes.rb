Rails.application.routes.draw do
  
  root to: "categories#index"
  
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
 
  devise_for :admins
  devise_for :users
  
  # put constraints on categories routes
  # this will give me /categories/repairs, /categories/cleaning, ...
  # it is hard code, I don't like it, but I just want to checkout this kind of constraints
  kinds = %w| repairs cleaning yard helpers|
  get 'categories/:kind', to: "categories#kind", constraints: { kind: Regexp.new(kinds.join('|'))}
  
  get 'cart/show', to: 'cart#show'
  get 'cart/checkout', to: 'cart#checkout'
  get 'cart/place_order', to: 'cart#place_order'
  
  # shallow will give path like categories/:id/subcategory for new, create and index
  # and /subcategories/:id for  edit, update, destroy
  resources :categories, shallow: true do
    resources :subcategories
  end
  # I need subcategories for create new subcategory, it needs subcategories Post
  resources :subcategories, only: :index
  
  # kieu important that resources :users, go after devise_for :users
  shallow do
     resources :users do
        resources :clients
        resources :vendors 
     end
  end 
  resources :users do
    resources :profiles, only: [:new, :show, :update, :destroy]
  end
  # I should not need this, will check it out later
  resources :profiles
   
  resources :clients, :vendors do
    resources :comments
  end
  #resources :comments, only: [:index, :new, :create]
  resources :comments
  
  resources :vendors, shallow: true do
    resources :services
  end 
  # I need this route, so I can have post services, to: services#create for creating a new service
  resources :services, only: [:index, :create]
  
  #resources :orders  
  resources :order_items, only: [:create, :update, :destroy]
  resources :cart, only: [:show]
end
