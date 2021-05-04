Rails.application.routes.draw do
  devise_for :users
  get "u/:username" => "profile#index", as: :profile
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :communities do
    resources :posts
  end
  root to: "public#index"
end
