Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index, :create, :show, :update, :destroy]
      resources :meals, only: [:index]
    end
  end
end
