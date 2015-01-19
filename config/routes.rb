Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'welcome/index'

  authenticated :user do # change index when user have authenticated
    root 'diaries#index', as: "authenticated_root"
  end

  resources :diaries do
    member do 
      get "like", to: "diaries#upvote"
      get "dislike", to: "diaries#downvote"
    end

    resources :comments
  end

  root 'welcome#index'
end
