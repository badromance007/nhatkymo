Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'welcome/index'

  authenticated :user do # change index when user have authenticated
    root 'diaries#index', as: "authenticated_root"
  end

  resources :diaries
  root 'welcome#index'
end
