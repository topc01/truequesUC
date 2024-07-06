Rails.application.routes.draw do
  
    # devise_for :clients do
    #     get '/clients/sign_out' => 'devise/sessions#destroy'
        
    # end

    devise_for :clients, controllers: {
      registrations: 'clients/registrations'
    }

  devise_for :administrators, controllers: {
    sessions: 'administrators/sessions'
  }
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root :to => 'home#home'
  
  # Defines the routes for the products controller
  resources :products, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  # get "/products/:id/summary", to: "products#summary", as: "product_summary"
  # get "/products/search", to: "products#search", as: "search"
  # get "/products", to: "products#index", as: "products"



  # Defines the routes for the clients controller
  # resources :clients, only: [:new, :create, :destroy, :edit, :update]
  get "/client/:id", to: "clients#show", as: "client_show"
  get "/clients/products", to: "clients#products", as: "client_products"
  get "/clients/reviews", to: "clients#reviews", as: "client_reviews"
  get "/edit", to: "clients#edit", as: "edit_profile"
  patch "/clients/update", to: "clients#update", as: "update_profile"
  get "/client/:id", to: "clients#view", as: "client_view"

  # Defines the routes for the admin controller
  # resources :admin, only: [:new, :create, :destroy, :edit, :update]
  get '/admin/index', to: 'admin#index', as: 'admin_page'
  delete '/admin/:id', to: 'admin#destroy', as: 'admin_client_destroy'
  delete '/admin/review/:id', to: 'admin#destroy_review', as: 'admin_review_destroy'
  delete '/admin/product/:id', to: 'admin#destroy_product', as: 'admin_product_destroy'

  # Defines the routes for the reviews controller
  resources :clients do
      resources :reviews, only: [:new, :create]
  end
  
  # get "/reviews/:client_id", to: "reviews#index"

  # Defines the routes for the requests controller
  resources :requests, only: [:index, :show, :destroy]
  get "/requests/new/:product_id", to: "requests#new", as: "new_request"
  post "/requests/create/:product_id/:offer_id", to: "requests#create", as: "create_request"
  post "/requests/accept/:id", to: "requests#accept", as: "accept_request"
  # get "/requests/:client_id/sent", to: "requests#sent", as: "request_sent"
  # get "/requests/:client_id/received", to: "requests#received", as: "request_received"
  # get "/requests/:id/summary", to: "requests#summary", as: "request_summary"

  # Defines the routes for the chat controller
  get "/chat", to: "chats#index", as: "chat"
  post "/chat/:sender/:receiver", to: "chats#create", as: "create_chat"
  get "/chat/:chat_id", to: "chats#show", as: "show_chat"

  get '/login', to: 'client#login', as: 'login'

  # create message path
  post "/message/:chat_id", to: "messages#create", as: "create_message"

  # Comment controler


  post '/new_comment', to: 'comments#create'
  delete '/comments/:id', to: 'comments#destroy', as: 'delete_comment'
  get '/comments/:id', to: 'comments#show', as: 'comment'


  post '/new_response', to: 'comment_responses#create'
  delete '/response/:id', to: 'comment_responses#destroy', as: 'delete_response'






  







  # get "/admin", to: "admin#index", as: "admin"
  # delete "/admin/:id", to: "admin#destroy"
  # delete "/admin/review/:id", to: "admin#destroy_review"
  # delete "/admin/product/:id", to: "admin#destroy_product"
  
  # resources :products, only: [:index, :new, :create, :destroy]

  # get '/profile/edit', to: 'clients#edit_profile', as: 'edit_profile'
  # patch '/profile/update', to: 'clients#update', as: 'update_profile'
  # get '/home_profile', to: 'home#profile', as: 'profile'
  # get '/home_edit_profile', to: 'home#edit', as: 'profile_edit'

  # get '/_chat', to: 'home#chat', as: 'chat'
  
  # get 'login', to: 'home#login', as: 'login'
end
