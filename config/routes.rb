Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/new'

  resources :microposts
  resources :user
  
  resources :microposts do
    member do
      get :upvote
      get :unvote
    end
  end
  
  resources :comments
  
  resources :comments do
    member do
      get :upvote
      get :unvote
    end
  end
  
  post 'comments/create' => 'comments#create', as: "create_comment"
  post 'comments/createb' => 'comments#createb', as: "create_commentb"
  get 'ask/show'
  get 'new/show'
  get 'threads/show'
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'home', to: 'home#show'
  get 'me', to: 'me#show', as: 'me'

  root to: "microposts#index"
end
