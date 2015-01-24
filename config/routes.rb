Rails.application.routes.draw do
  get 'users/show'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'welcome/index'
  #match "users/mydiaries" => "diaries#mydiaries", :via => [:get], :as => "mydiaries"

  # routes for styling different headers in show page and the rest
  get 'diaries/show'
  get 'devise/diaries/new'
  get 'devise/diaries/index' 
  get 'devise/diaries/show'

  get 'diaries/gopy'
  get 'devise/diaries/gopy'
  get 'diaries/huongdan'
  get 'devise/diaries/huongdan'


  resources :users

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
