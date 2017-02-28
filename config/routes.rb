Rails.application.routes.draw do
  root to: "parks#index"
  resources :parks

  constraints format: :json do
    namespace :api do
      namespace :v1 do
        resources :parks, param: :name
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
