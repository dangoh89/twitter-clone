Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :twits
  resources :users
  resources :friendships
  get 'user_dashboard', to: "users#user_dashboard"
  get 'my_followers', to: 'users#my_followers'
  get 'user_twits', to: "twits#user_twits"
  get 'search_followers', to: "users#search"
  post 'add_follower', to: 'users#add_follower'
  get '/twits/hashtag/:name', to:'twits#hashtags'
  root "users#user_dashboard"
end
