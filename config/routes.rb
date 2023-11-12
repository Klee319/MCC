Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings'
    get 'followers' => 'relationships#followers'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'home' => 'homes#home'

  resources :forms do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :storylines do
    resources :talks
    get 'add_user' => 'storylines#add_user_view'
    post 'add_user' => 'storylines#add_user'
  end
end
