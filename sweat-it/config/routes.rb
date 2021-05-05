Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get "u/:username" => "public#profile", as: :profile

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :communities do
    resources :posts
  end
  resources :subscriptions
  resources :comments, only: [:create], default:{format:'js'}
  
  root to: "public#index"
end
