Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "homes#top"
  get "home/about" => "homes#about"

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships,only:[:create,:destroy]
     get "followings" => "relationships#followings",as: "followings"
      get "followers" => "relationships#followers",as: "followers"
  end
  
    resources :messages,only:[:create]
     resources :rooms, only:[:create, :show]
  
  resources :groups do
    get "join" => "groups#join"
  end
end