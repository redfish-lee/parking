Rails.application.routes.draw do
  resources :parks

  constraints format: :json do
    namespace :api do
      namespace :v1 do
        resources :parks
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
