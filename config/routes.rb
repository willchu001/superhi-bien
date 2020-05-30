Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :reviews do
    resources :comments
  end

  resources :users

  resource :session

  root "reviews#index"

end
