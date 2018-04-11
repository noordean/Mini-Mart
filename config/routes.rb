Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i(index show create update destroy)

      post "/users/login" => "users#login"
    end
  end
  namespace :api do
    namespace :v1 do
      resources :products, only: %i(index show create update destroy)
    end
  end
  namespace :api do
    namespace :v1 do
      resources :pings, only: %i(create)
    end
  end
end
